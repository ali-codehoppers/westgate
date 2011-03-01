using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Net.Mail;
using Simplicity.Data;

namespace Simplicity.Web.Utilities
{
    public class EmailUtility
    {
        private static string FROM_ADDRESS = ConfigurationSettings.AppSettings[WebConstants.Config.FROM_EMAIL_ADDRESS];
        private static string SMTP_SERVER = "smtpauth.moose.co.uk";
        private static string USER_NAME = "andrewcowie";
        private static string PASSWORD = "access";

        public static void SendEmail(string contents)
        {
            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            message.To.Add("alibinjamil@gmail.com");
            message.Subject = "This is the Subject line";
            message.From = new System.Net.Mail.MailAddress("From@online.microsoft.com");
            message.Body = "This is the message body";
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtpauth.moose.co.uk");
            System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential("andrewcowie", "access");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = SMTPUserInfo;
            smtp.Send(message);
        }

        public static void SendEmail(MailMessage message)
        {
            try
            {
                var context = new SimplicityEntities();
                string toEmails = "";
                string toNames = "";
                foreach (MailAddress address in message.To)
                {
                    toNames += address.DisplayName + ",";
                    toEmails += address.Address + ","+ConfigurationSettings.AppSettings[WebConstants.Config.ADMIN_EMAIL_ADDRESSES];
                }
                var email=new EmailQueue{LogTime=DateTime.Now, NumOfTries=1, FromName="WestGate", FromAddress=FROM_ADDRESS, ToNames=toNames.Substring(0, toNames.Length - 1), ToAddresses=toEmails.Substring(0, toEmails.Length),
                                         Subject = message.Subject,
                                         Body = message.Body,
                                         SentTime = null
                };
                context.AddToEmailQueues(email);
                context.SaveChanges();

            }
            catch (Exception ex)
            {

            }
        }

    }
}