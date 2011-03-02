using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Net;
using Westgate.Data;

namespace WestgateEmailService
{
    public partial class WestgateEmailService : ServiceBase
    {
        private static NameValueCollection AppSettings = System.Configuration.ConfigurationManager.AppSettings;
        private static string SMTP_SERVER = AppSettings["SMTP_SERVER"];
        private static string USER_NAME = AppSettings["USER_NAME"];
        private static string PASSWORD = AppSettings["PASSWORD"];
        private Timer timer;

        public WestgateEmailService()
        {
            InitializeComponent();
            this.EventLog.Log = "Application";

            this.CanHandlePowerEvent = true;
            this.CanHandleSessionChangeEvent = true;
            this.CanPauseAndContinue = true;
            this.CanShutdown = true;
            this.CanStop = true;
        }

        protected override void OnStart(string[] args)
        {
            TimerCallback tick = new TimerCallback(SendEmails);
            timer = new System.Threading.Timer(tick, null, 0, long.Parse(AppSettings["SLEEP_TIME"]));
        }

        protected override void OnStop()
        {
            timer.Dispose();
        }
        private void Log(string message, EventLogEntryType type)
        {
            this.EventLog.WriteEntry(message, type);
        }

        private void SendEmails(object state)
        {
            try
            {
                SmtpClient smtp = new SmtpClient(SMTP_SERVER);
                NetworkCredential userInfo = new NetworkCredential(USER_NAME, PASSWORD);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = userInfo;


                WestgateEntities DatabaseContext = new WestgateEntities();
                List<EmailQueue> emails = (from e in DatabaseContext.EmailQueues where e.SentTime == null && e.NumOfTries < 5 select e).ToList();
                foreach (EmailQueue eq in emails)
                {
                    try
                    {
                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(eq.FromAddress, eq.FromName);
                        string[] toNames = eq.ToNames.Split(',');
                        string[] toAddresses = eq.ToAddresses.Split(',');
                        for (int index = 0; index < toAddresses.Length; index++)
                        {
                            if (toAddresses[index].Length > 0)
                            {
                                message.To.Add(new MailAddress(toAddresses[index], toNames[index]));
                            }
                        }
                        message.Subject = eq.Subject;
                        message.Body = eq.Body;
                        message.IsBodyHtml = true;
                        smtp.Send(message);
                        eq.SentTime = DateTime.Now;

                        Log("Queue Id:" + eq.QueueID + " processed.", EventLogEntryType.Information);
                    }
                    catch (Exception ex)
                    {
                        Log("Queue Id:" + eq.QueueID + " errored.", EventLogEntryType.Error);
                        Log(ex.ToString(), EventLogEntryType.Error);
                    }
                    eq.NumOfTries++;
                }
                DatabaseContext.SaveChanges();

            }
            catch (Exception ex)
            {
                //Log("Connection String:);
                Log(ex.ToString(), EventLogEntryType.Error);
            }
        }
    }
}
