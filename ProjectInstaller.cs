// Decompiled with JetBrains decompiler
// Type: SSIS.FailedJobRestart.ProjectInstaller
// Assembly: SSIS.FailedJobRestart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A087F25F-F189-44B3-8DF8-3B399D87E912
// Assembly location: C:\Users\benedictd\OneDrive - ICON CLINICAL RESEARCH LTD - IRELAND\Desktop\SSIS.FailedJobRestart\SSIS.FailedJobRestart.exe

using System.ComponentModel;
using System.Configuration.Install;
using System.ServiceProcess;

//#nullable disable
namespace SSIS.FailedJobRestart
{
  [RunInstaller(true)]
  public class ProjectInstaller : Installer
  {
    private IContainer components = (IContainer) null;
    private ServiceProcessInstaller serviceProcessInstaller1;
    private ServiceInstaller serviceInstaller1;

    public ProjectInstaller() => this.InitializeComponent();

    protected override void Dispose(bool disposing)
    {
      if (disposing && this.components != null)
        this.components.Dispose();
      base.Dispose(disposing);
    }

    private void InitializeComponent()
    {
      this.serviceProcessInstaller1 = new ServiceProcessInstaller();
      this.serviceInstaller1 = new ServiceInstaller();
      this.serviceProcessInstaller1.Password = (string) null;
      this.serviceProcessInstaller1.Username = (string) null;
      this.serviceInstaller1.Description = "This service was written by David Benedict to automate running SQL jobs a second time.  If the job fails a 3rd time then a Service Now ticket gets created.";
      this.serviceInstaller1.DisplayName = "SQL.SSIS.JobRetry";
      this.serviceInstaller1.ServiceName = "SQL.SSIS.JobRetry";
      this.Installers.AddRange(new Installer[2]
      {
        (Installer) this.serviceProcessInstaller1,
        (Installer) this.serviceInstaller1
      });
    }
  }
}
