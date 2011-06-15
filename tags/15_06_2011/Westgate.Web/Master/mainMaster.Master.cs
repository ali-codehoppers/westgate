using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;
using System.Net.Mail;
using WestGate.Web.Utilities;

namespace Westgate.Web.Master
{
    public partial class mainMaster : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            WestgateEntities DatabaseContext = new WestgateEntities();
            Repeater1.DataSource = (from row in DatabaseContext.Categories select row).Take(7);
            Repeater1.DataBind();
        }



        protected void submitButton_Click(object sender, ImageClickEventArgs e)
        {
            WestgateEntities DatabaseContext = new WestgateEntities();
            UserEnquiry enquiry = new UserEnquiry {     
                                                        companyName = CompanyTextID.Text, 
                                                        personName = PersonTextID.Text,
                                                        email=EmailTextID.Text,
                                                        postCode=PostTextID.Text,
                                                        phoneNumber=PhoneTextID.Text,
                                                        enquiry = EnquirySelectedId.SelectedItem.Text
                                                };
            DatabaseContext.AddToUserEnquiries(enquiry);
            DatabaseContext.SaveChanges();
            MailMessage message = new MailMessage();
            message.To.Add(new MailAddress(EmailTextID.Text, PersonTextID.Text));
            message.Body = "Company :" + CompanyTextID.Text + "<br/>Person :" + PersonTextID.Text + "<br/>Email :"+EmailTextID.Text+ "<br/>Post Code : "+PostTextID.Text+"<br/>Phone :"+PhoneTextID.Text+"<br/>Nature of Enquiry :"+EnquirySelectedId.SelectedItem.Text;
            message.Subject = "Nature of Enquiry";
            message.IsBodyHtml = true;
            EmailUtility.SendEmail(message);
            ErrorLabel.Visible = true;
            ErrorLabel.Text = "Request Sent";   
        }
    }
}