using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DDit.OSISoft.SP2EF
{
    public partial class SP2EFService : ServiceBase
    {
        public SP2EFService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, " Start.");
            Process.Start();
        }

        protected override void OnStop()
        {
            LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, " Stop.");
        }
    }
    public static class Process
    {
        public static void Start()
        {
            ThreadStart start = new ThreadStart(ThreadAction);
            Thread th = new Thread(start);
            th.IsBackground = true;
            th.Start();
        }
        public static void ThreadAction()
        {
            while (true)
            {
                try
                {
                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, "is Running.");
                    Sp2Ef.Entry();
                    System.Threading.Thread.Sleep(30000);
                }
                catch (Exception ex)
                {
                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("Exception Message:[").Append(ex.Message).Append("]").ToString());
                }
            }
        }
    }
}
