// Decompiled with JetBrains decompiler
// Type: SSIS.FailedJobRestart.Program
// Assembly: SSIS.FailedJobRestart, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A087F25F-F189-44B3-8DF8-3B399D87E912
// Assembly location: C:\Users\benedictd\OneDrive - ICON CLINICAL RESEARCH LTD - IRELAND\Desktop\SSIS.FailedJobRestart\SSIS.FailedJobRestart.exe

using System.ServiceProcess;

//#nullable disable
namespace SSIS.FailedJobRestart
{
  internal static class Program
  {
    private static void Main()
    {
      ServiceBase.Run(new ServiceBase[1]
      {
        (ServiceBase) new Service1()
      });
    }
  }
}
