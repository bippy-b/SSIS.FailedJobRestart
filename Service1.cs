// Decompiled with JetBrains decompiler
// Type: SSIS.FailedJobRestart.Service1
// Assembly: SSIS.FailedJobRestart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A087F25F-F189-44B3-8DF8-3B399D87E912
// Assembly location: C:\Users\benedictd\OneDrive - ICON CLINICAL RESEARCH LTD - IRELAND\Desktop\SSIS.FailedJobRestart\SSIS.FailedJobRestart.exe

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NLog;
using SSIS.FailedJobRestart.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Security;
using System.ServiceProcess;
using System.Text;
using System.Timers;

//#nullable disable
namespace SSIS.FailedJobRestart
{
  public class Service1 : ServiceBase
  {
    private static Logger logger = LogManager.GetCurrentClassLogger();
    private System.Timers.Timer timer1 = new System.Timers.Timer();
    private readonly string con = ConfigurationManager.ConnectionStrings["AppSupportSSIS"].ConnectionString;
    private IContainer components = (IContainer) null;

    public Service1() => this.InitializeComponent();

    protected override void OnStart(string[] args)
    {
      try
      {
        Service1.logger.Info("--==SQL.SSIS.JobRetry Service Started==--");
        Service1.logger.Info("========Begin Settings Values=========");
        Service1.logger.Info("timerInterval : " + (object) Settings.Default.timerInterval);
        Service1.logger.Info("SN_base : " + Settings.Default.SN_base);
        Service1.logger.Info("SNUser : " + Settings.Default.SNUser);
        Service1.logger.Info("SNPassword Length : " + (object) Settings.Default.SNPassword.Length);
        Service1.logger.Info("ServiceNowCategory : " + Settings.Default.ServiceNowCategory);
        Service1.logger.Info("ServiceNowContactType : " + Settings.Default.ServiceNowContactType);
        Service1.logger.Info("ServiceNowSubCategory : " + Settings.Default.ServiceNowSubCategory);
        Service1.logger.Info("SN_AssignmentGroup : " + Settings.Default.SN_AssignmentGroup);
        Service1.logger.Info("IncidentSysID : " + Settings.Default.IncidentSysID);
        Service1.logger.Info("========End Settings Values=========");
        this.timer1.Interval = (double) Settings.Default.timerInterval;
        Service1.logger.Trace("Timer1.Interval set properly");
        this.timer1.Elapsed += new ElapsedEventHandler(this.timer1_Tick);
        this.timer1.Enabled = true;
        Service1.logger.Trace("timer1.Enabled set to true");
        Service1.logger.Trace("timer1 started");
        LogManager.Flush();
      }
      catch (Exception ex)
      {
        Service1.logger.Trace("--==Entering timer1_tick catch==--");
        Service1.logger.Error(ex, "Error Message:" + ex.Message);
        LogManager.Flush();
      }
    }

    protected override void OnStop()
    {
      Service1.logger.Trace("SSIS.FailedJob Service entering OnStop().");
      this.timer1.Enabled = false;
      Service1.logger.Trace("Timer1.Enabled set to false");
      this.timer1.Stop();
      Service1.logger.Trace("Timer1.Stop() executed");
      LogManager.Shutdown();
    }

    private void timer1_Tick(object sender, ElapsedEventArgs e)
    {
      Service1.logger.Debug("Service timer has lapsed.  Entering Tick.");
      try
      {
        Service1.logger.Trace("--==Entering timer1_tick try==--");
        this.timer1.Enabled = false;
        this.timer1.Stop();
        Service1.logger.Info("Start checking jobs.");
        this.CollectAllFailedJobs();
        this.CheckForRepeatOffenders();
        this.CheckForFirstTimeOffenders();
        this.CheckForStuckJobs();
        Service1.logger.Info("Done checking jobs.");
      }
      catch (Exception ex)
      {
        Service1.logger.Trace("--==Entering timer1_tick catch==--");
        Service1.logger.Error(ex, "Error Message:" + ex.Message);
        LogManager.Flush();
      }
      finally
      {
        Service1.logger.Trace("--==Entering timer1_tick finally==--");
        this.timer1.Enabled = true;
        this.timer1.Start();
      }
    }

    private void CheckForRepeatOffenders()
    {
      string str = nameof (CheckForRepeatOffenders);
      Service1.logger.Trace("--==Entering " + str + "==--");
      SqlConnection connection = (SqlConnection) null;
      string newLine = Environment.NewLine;
      try
      {
        connection = new SqlConnection(this.con);
        connection.Open();
        SqlCommand sqlCommand = new SqlCommand("[db_app_support].[ssis].[usp_get_multi_failed_jobs]", connection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        if (sqlDataReader.HasRows)
        {
          Service1.logger.Debug("MultiTime Reader.HasRows = true");
          while (sqlDataReader.Read())
          {
            string incident = this.CreateIncident("SSIS Job Failure : " + sqlDataReader["job_name"].ToString(), "SSIS Job has failed more than one time in the past 24 hours." + newLine + newLine + "Please verify exact failure times in the table [db_app_support].[ssis].[failed_job_log] or msdb.dbo.sysJobHistory for further information" + newLine + "You can also check the table [db_app_support].[ssis].[tbl_sql_job_retry] to see if the automation has attempted to run the job already today." + newLine + newLine + "Server : " + Environment.MachineName + newLine + "SSIS Job : " + sqlDataReader["job_name"].ToString() + newLine + "Job ID: " + sqlDataReader["job_id"].ToString());
            Service1.logger.Info("Created Incident number : " + incident);
            this.MarkRecordCompleted(sqlDataReader["job_name"].ToString(), incident);
            Service1.logger.Info("Marked Jobs as complete.");
          }
        }
        else
          Service1.logger.Debug("Reader.HasRows = false");
      }
      catch (Exception ex)
      {
        Service1.logger.Trace("--==Entering " + str + " catch==--");
        Service1.logger.Error(ex, "Error Message:" + ex.Message);
        LogManager.Flush();
      }
      finally
      {
        Service1.logger.Trace("--==Entering " + str + " finally==--");
        connection?.Close();
      }
    }

    private void CheckForFirstTimeOffenders()
    {
      string str1 = nameof (CheckForFirstTimeOffenders);
      Service1.logger.Trace("--==Entering " + str1 + "==--");
      SqlConnection connection = (SqlConnection) null;
      string newLine = Environment.NewLine;
      try
      {
        Service1.logger.Trace(str1 + ": made it to try");
        connection = new SqlConnection(this.con);
        connection.Open();
        SqlCommand sqlCommand = new SqlCommand("[db_app_support].[ssis].[usp_get_single_failed_jobs]", connection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        if (sqlDataReader.HasRows)
        {
          Service1.logger.Debug("FirstTime Reader.HasRows = true");
          while (sqlDataReader.Read())
          {
            Service1.logger.Info("Attempting to restart job : " + sqlDataReader["job_name"].ToString());
            string str2 = this.TrySSISJobAgain(sqlDataReader["job_name"].ToString());
            Service1.logger.Debug("result is : " + str2);
            this.MarkRecordCompleted(sqlDataReader["job_name"].ToString(), "INC0000000");
            Service1.logger.Info("Marked Jobs as complete.");
          }
        }
        else
          Service1.logger.Debug("Reader.HasRows = false");
      }
      catch (Exception ex)
      {
        Service1.logger.Error(ex, "An error occurred:" + ex.Message);
      }
      finally
      {
        Service1.logger.Trace(str1 + ": made it to finally");
        connection?.Close();
        Service1.logger.Trace("Conn closed.");
      }
    }

    private void CheckForStuckJobs()
    {
      string str = nameof (CheckForStuckJobs);
      Service1.logger.Trace("--==Entering " + str + "==--");
      string newLine = Environment.NewLine;
      try
      {
        Service1.logger.Trace(str + ": made it to try");
        SqlConnection connection = new SqlConnection(this.con);
        connection.Open();
        SqlCommand sqlCommand = new SqlCommand("[db_app_support].[ssis].[usp_get_stuck_jobs]", connection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        if (!sqlDataReader.HasRows)
          return;
        string incident = this.CreateIncident("SSIS Job possibly stuck : " + sqlDataReader["job_name"].ToString(), "SSIS Job has started but not finished." + newLine + newLine + "Please verify if it should still be running by comparing job history to current running hours." + newLine + "Server : " + Environment.MachineName + newLine + "SSIS Job : " + sqlDataReader["job_name"].ToString() + newLine + "Job ID: " + sqlDataReader["job_id"].ToString() + "Start Date/Time : " + sqlDataReader["start_execution_date"].ToString() + "Current Step ID : " + sqlDataReader["current_executed_step_id"].ToString() + "Step Name : " + sqlDataReader["step_name"].ToString());
        Service1.logger.Info("Created Incident number : " + incident);
      }
      catch (Exception ex)
      {
        Service1.logger.Error("Error Occurred : " + ex.Message);
      }
    }

    private void CollectAllFailedJobs()
    {
      string str = "CollectAllFailedJobs()";
      SqlConnection connection = (SqlConnection) null;
      try
      {
        Service1.logger.Trace("--==Opening conn==--");
        connection = new SqlConnection(this.con);
        connection.Open();
        Service1.logger.Trace("--==Step 1==--");
        SqlCommand sqlCommand = new SqlCommand("[db_app_support].[ssis].[usp_insert_all_failed_jobs]", connection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        sqlCommand.ExecuteNonQuery();
        Service1.logger.Trace("--==Query Executed/Step 4==--");
      }
      catch (Exception ex)
      {
        Service1.logger.Error(ex, "Error Message:" + ex.Message);
      }
      finally
      {
        Service1.logger.Trace(str + ": made it to finally");
        connection?.Close();
      }
    }

    private void MarkRecordCompleted(string job_name, string sn_ticket)
    {
      string str = "MarkRecordCompleted()";
      Service1.logger.Trace("MarkRecordCompleted()");
      Service1.logger.Trace("job_name : " + job_name);
      Service1.logger.Trace("sn_ticket : " + sn_ticket);
      SqlConnection connection = (SqlConnection) null;
      try
      {
        Service1.logger.Trace("--==Opening conn==--");
        connection = new SqlConnection(this.con);
        connection.Open();
        Service1.logger.Trace("--==Step 1==--");
        SqlCommand sqlCommand = new SqlCommand("[db_app_support].[ssis].[usp_set_failed_jobs_complete]", connection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        sqlCommand.Parameters.Add(new SqlParameter("jobname", (object) job_name));
        sqlCommand.Parameters.Add(new SqlParameter("SNTicket", (object) sn_ticket));
        sqlCommand.ExecuteNonQuery();
        Service1.logger.Trace("--==Query Executed/Step 4==--");
      }
      catch (Exception ex)
      {
        Service1.logger.Error(ex, "Error Message:" + ex.Message);
      }
      finally
      {
        Service1.logger.Trace(str + ": made it to finally");
        connection?.Close();
        Service1.logger.Debug("Closed Conn.");
      }
    }

    private bool ExecuteSQL(string dcfSQL, int dcfid)
    {
      Service1.logger.Trace("--==Entering ExecuteSQL==--");
      string newLine = Environment.NewLine;
      SqlConnection connection = (SqlConnection) null;
      int num = 0;
      bool flag = false;
      try
      {
        Service1.logger.Trace("--==ExecuteSQL:Opening conn==--");
        connection = new SqlConnection(this.con);
        connection.Open();
        Service1.logger.Trace("--==ExecuteSQL:Setting.cmd==--");
        SqlCommand sqlCommand = new SqlCommand(dcfSQL, connection);
        sqlCommand.CommandType = CommandType.Text;
        num = sqlCommand.ExecuteNonQuery();
        Service1.logger.Trace("--==ExecuteSQL:Query Executed==--");
        Service1.logger.Trace("results:" + num.ToString());
        flag = true;
      }
      catch (Exception ex)
      {
        Service1.logger.Trace("--==Entering catch in ExecuteSQL==--");
        Service1.logger.Error(ex, "eDCFID=" + dcfid.ToString() + newLine + newLine + "Error Message:" + newLine + ex.Message + newLine + newLine + "Error Stack Trace:" + newLine + ex.StackTrace);
        Service1.logger.Trace("--==Exiting catch in ExecuteSQL==--");
        LogManager.Flush();
        Service1.logger.Trace("results:" + num.ToString());
        flag = false;
      }
      finally
      {
        Service1.logger.Trace("--==Entering finally in ExecuteSQL==--");
        if (connection != null)
        {
          Service1.logger.Trace("--==In finally closing conn in ExecuteSQL==--");
          connection.Close();
        }
        Service1.logger.Trace("--==Exiting finally in ExecuteSQL==--");
      }
      Service1.logger.Trace("--==Exiting ExecuteSQL==--");
      return flag;
    }

    private string TrySSISJobAgain(string job_name)
    {
      string str = "TrySSISJobAgain()";
      Service1.logger.Trace("TrySSISJobAgain()");
      Service1.logger.Trace("job_name : " + job_name);
      SqlConnection connection = (SqlConnection) null;
      try
      {
        Service1.logger.Trace("--==Opening conn==--");
        connection = new SqlConnection(this.con);
        connection.Open();
        Service1.logger.Trace("--==Step 1==--");
        SqlCommand sqlCommand = new SqlCommand("[db_app_support].[ssis].[usp_start_ssis_job]", connection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        sqlCommand.Parameters.Add(new SqlParameter("jobname", (object) job_name));
        sqlCommand.ExecuteNonQuery();
        Service1.logger.Trace("--==Query Executed/Step 4==--");
      }
      catch (Exception ex)
      {
        Service1.logger.Error(ex, "Error Message : " + ex.Message);
        return "false";
      }
      finally
      {
        Service1.logger.Trace(str + ": made it to finally");
        connection?.Close();
        Service1.logger.Debug("Closed Conn.");
      }
      return "true";
    }

    private string CreateIncident(string shortDescription, string description)
    {
      Service1.logger.Debug("Entering CreateIncident()");
      Service1.logger.Trace("shortDescription : " + shortDescription.ToString());
      Service1.logger.Trace("description : " + description.ToString());
      string newLine = Environment.NewLine;
      string incident = "";
      Service1.HttpResponse httpResponse1 = new Service1.HttpResponse();
      string url = Settings.Default.SN_base + "incident";
      Service1.logger.Trace("inc_url : " + url);
      try
      {
        string incidentSysId = Settings.Default.IncidentSysID;
        string data = JsonConvert.SerializeObject((object) new
        {
          description = description,
          short_description = shortDescription,
          contact_type = Settings.Default.ServiceNowContactType,
          category = Settings.Default.ServiceNowCategory,
          subcategory = Settings.Default.ServiceNowSubCategory,
          assignment_group = Settings.Default.SN_AssignmentGroup,
          caller_id = Settings.Default.SNUser,
          cmdb_ci = incidentSysId
        });
        Service1.logger.Trace("JSON data for INC : " + data);
        Service1.HttpResponse httpResponse2 = this.PostRequest(url, data);
        Service1.logger.Trace("IncResponse : " + httpResponse2.ResponseString);
        incident = (string) JObject.Parse(httpResponse2.ResponseString).SelectToken("result.number");
        Service1.logger.Trace("INC Number : " + incident);
      }
      catch (Exception ex)
      {
        Service1.logger.Error(ex, "Error Message : " + ex.Message);
      }
      return incident;
    }

    private Service1.HttpResponse GetRequest(string url)
    {
      ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
      string str = string.Empty;
      HttpWebRequest request = (HttpWebRequest) WebRequest.Create(url);
      string snUser = Settings.Default.SNUser;
      string snPassword = Settings.Default.SNPassword;
      this.ProxyAuthentication(ref request);
      string base64String = Convert.ToBase64String(Encoding.GetEncoding("ISO-8859-1").GetBytes(snUser + ":" + snPassword));
      request.Headers.Add("Authorization", "Basic " + base64String);
      request.ServerCertificateValidationCallback += (RemoteCertificateValidationCallback) ((sender, certificate, chain, sslPolicyErrors) => true);
      request.Timeout = 600000;
      request.Method = "GET";
      request.Accept = "application/json";
      using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
      {
        using (Stream responseStream = response.GetResponseStream())
        {
          using (StreamReader streamReader = new StreamReader(responseStream))
            str = streamReader.ReadToEnd();
        }
        Dictionary<string, object> dictionary = new Dictionary<string, object>();
        for (int index = 0; index < response.Headers.Count; ++index)
          dictionary.Add(response.Headers.Keys[index], (object) response.Headers[index]);
        return new Service1.HttpResponse()
        {
          Headers = dictionary,
          Status = response.StatusCode,
          ResponseString = str.ToString()
        };
      }
    }

    private Service1.HttpResponse PutRequest(string url, string data)
    {
      ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
      string str = string.Empty;
      HttpWebRequest request = (HttpWebRequest) WebRequest.Create(url);
      string snUser = Settings.Default.SNUser;
      string snPassword = Settings.Default.SNPassword;
      this.ProxyAuthentication(ref request);
      string base64String = Convert.ToBase64String(Encoding.GetEncoding("ISO-8859-1").GetBytes(snUser + ":" + snPassword));
      request.Headers.Add("Authorization", "Basic " + base64String);
      request.ServerCertificateValidationCallback += (RemoteCertificateValidationCallback) ((sender, certificate, chain, sslPolicyErrors) => true);
      request.Timeout = 600000;
      request.Method = "PUT";
      request.Accept = "application/json";
      request.ContentType = "application/json";
      byte[] bytes = Encoding.UTF8.GetBytes(data);
      request.ContentLength = (long) bytes.Length;
      using (Stream requestStream = request.GetRequestStream())
        requestStream.Write(bytes, 0, bytes.Length);
      using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
      {
        using (Stream responseStream = response.GetResponseStream())
        {
          using (StreamReader streamReader = new StreamReader(responseStream))
            str = streamReader.ReadToEnd();
        }
        Dictionary<string, object> dictionary = new Dictionary<string, object>();
        for (int index = 0; index < response.Headers.Count; ++index)
          dictionary.Add(response.Headers.Keys[index], (object) response.Headers[index]);
        return new Service1.HttpResponse()
        {
          Headers = dictionary,
          Status = response.StatusCode,
          ResponseString = str.ToString()
        };
      }
    }

    private void ProxyAuthentication(ref HttpWebRequest request)
    {
      IWebProxy proxy = request.Proxy;
      if (proxy == null)
        return;
      string Address = proxy.GetProxy(request.RequestUri).ToString();
      if (Address == request.Address.ToString())
        return;
      request.UseDefaultCredentials = true;
      request.Proxy = (IWebProxy) new WebProxy(Address, false)
      {
        Credentials = CredentialCache.DefaultCredentials
      };
    }

    private Service1.HttpResponse PostRequest(string url, string data)
    {
      ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
      string str = string.Empty;
      HttpWebRequest request = (HttpWebRequest) WebRequest.Create(url);
      string snUser = Settings.Default.SNUser;
      string snPassword = Settings.Default.SNPassword;
      this.ProxyAuthentication(ref request);
      string base64String = Convert.ToBase64String(Encoding.GetEncoding("ISO-8859-1").GetBytes(snUser + ":" + snPassword));
      request.Headers.Add("Authorization", "Basic " + base64String);
      request.ServerCertificateValidationCallback += (RemoteCertificateValidationCallback) ((sender, certificate, chain, sslPolicyErrors) => true);
      request.Timeout = 600000;
      request.Method = "POST";
      request.Accept = "application/json";
      request.ContentType = "application/json";
      byte[] bytes = Encoding.UTF8.GetBytes(data);
      request.ContentLength = (long) bytes.Length;
      using (Stream requestStream = request.GetRequestStream())
        requestStream.Write(bytes, 0, bytes.Length);
      using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
      {
        using (Stream responseStream = response.GetResponseStream())
        {
          using (StreamReader streamReader = new StreamReader(responseStream))
            str = streamReader.ReadToEnd();
        }
        Dictionary<string, object> dictionary = new Dictionary<string, object>();
        for (int index = 0; index < response.Headers.Count; ++index)
          dictionary.Add(response.Headers.Keys[index], (object) response.Headers[index]);
        return new Service1.HttpResponse()
        {
          Headers = dictionary,
          Status = response.StatusCode,
          ResponseString = str.ToString()
        };
      }
    }

    protected override void Dispose(bool disposing)
    {
      if (disposing && this.components != null)
        this.components.Dispose();
      base.Dispose(disposing);
    }

    private void InitializeComponent()
    {
      this.components = (IContainer) new System.ComponentModel.Container();
      this.ServiceName = nameof (Service1);
    }

    public class HttpResponse
    {
      public Dictionary<string, object> Headers { get; set; }

      public string ResponseString { get; set; }

      public HttpStatusCode Status { get; set; }
    }

    public class Ticket
    {
      public string number { get; set; }

      public string sysid { get; set; }
    }
  }
}
