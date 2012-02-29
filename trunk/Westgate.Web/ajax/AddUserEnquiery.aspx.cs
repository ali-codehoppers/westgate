using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;
using System.Web.UI.HtmlControls;
using WestGate.Web.Utilities;
using System.Net.Mail;
using WestGate.Web.Utilities;
namespace Westgate.Web.ajax
{
    public partial class AddUserEnquiery  : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                String companyName = "";
                String personName = "";
                String email = "";
                String postCode = "";
                String phoneNumber = "";
                String enquiry = "";

                if (Request["companyName"] != null)
                    companyName = Request["companyName"];
                if (Request["personName"] != null)
                    personName = Request["personName"];
                if (Request["email"] != null)
                    email = Request["email"];
                if (Request["postCode"] != null)
                    postCode = Request["postCode"];
                if (Request["phoneNumber"] != null)
                    phoneNumber = Request["phoneNumber"];
                if (Request["enquiry"] != null)
                    enquiry = Request["enquiry"];

                UserEnquiry enquiryObj = new UserEnquiry
                {
                    companyName = companyName,
                    personName = personName,
                    email = email,
                    postCode = postCode,
                    phoneNumber = phoneNumber,
                    enquiry = enquiry
                };
                DatabaseContext.UserEnquiries.AddObject(enquiryObj);
                //            DatabaseContext.AddToUserEnquiries(enquiry);
                DatabaseContext.SaveChanges();

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(email, personName));
                message.Body = "Company :" + companyName + "<br/>Person :" + personName + "<br/>Email :" + email + "<br/>Post Code : " + postCode + "<br/>Phone :" + phoneNumber + "<br/>Nature of Enquiry :" + enquiry;
                message.Subject = "Nature of Enquiry";
                message.IsBodyHtml = true;
                EmailUtility.SendEmail(message);
                //ErrorLabel.Visible = true;
                //ErrorLabel.Text = "Request Sent";
            }
    }
}