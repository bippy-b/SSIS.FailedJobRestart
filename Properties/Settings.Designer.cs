// Decompiled with JetBrains decompiler
// Type: SSIS.FailedJobRestart.Properties.Settings
// Assembly: SSIS.FailedJobRestart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A087F25F-F189-44B3-8DF8-3B399D87E912
// Assembly location: C:\Users\benedictd\OneDrive - ICON CLINICAL RESEARCH LTD - IRELAND\Desktop\SSIS.FailedJobRestart\SSIS.FailedJobRestart.exe

using System.CodeDom.Compiler;
using System.Configuration;
using System.Diagnostics;
using System.Runtime.CompilerServices;

//#nullable disable
namespace SSIS.FailedJobRestart.Properties
{
  [CompilerGenerated]
  [GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "15.9.0.0")]
  internal sealed class Settings : ApplicationSettingsBase
  {
    private static Settings defaultInstance = (Settings) SettingsBase.Synchronized((SettingsBase) new Settings());

    public static Settings Default
    {
      get
      {
        Settings defaultInstance = Settings.defaultInstance;
        return defaultInstance;
      }
    }

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("3000")]
    public int timerInterval => (int) this[nameof (timerInterval)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("https://icondev.service-now.com/api/now/table/")]
    public string SN_base => (string) this[nameof (SN_base)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("svc_iconwsclient")]
    public string SNUser => (string) this[nameof (SNUser)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("Rt590N!!")]
    public string SNPassword => (string) this[nameof (SNPassword)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("Error/Broken")]
    public string ServiceNowCategory => (string) this[nameof (ServiceNowCategory)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("Self-service")]
    public string ServiceNowContactType => (string) this[nameof (ServiceNowContactType)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("Application Error")]
    public string ServiceNowSubCategory => (string) this[nameof (ServiceNowSubCategory)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("GBS Application Support")]
    public string SN_AssignmentGroup => (string) this[nameof (SN_AssignmentGroup)];

    [ApplicationScopedSetting]
    [DebuggerNonUserCode]
    [DefaultSettingValue("ff66fe036f721900857ccf164b3ee44b")]
    public string IncidentSysID => (string) this[nameof (IncidentSysID)];
  }
}
