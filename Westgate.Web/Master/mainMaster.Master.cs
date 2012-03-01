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
            Tag allTag = new Tag
            {
                TagId = 0,
                Name = "All"
            };

            Tag galleryTag = new Tag
            {
                TagId = 3,
                Name = "Gallery"
            };




            WestgateEntities DatabaseContext = new WestgateEntities();
            List<Tag> taglistMain = (from row in DatabaseContext.Tags where row.ShowInTabs orderby row.OrderNumber select row).ToList();
            taglistMain.Insert(2, galleryTag);

            Repeater1.DataSource = taglistMain;
            Repeater1.DataBind();

            /*List<Tag> taglistMore = (from row in DatabaseContext.Tags where row.ShowInTabs orderby row.OrderNumber select row).ToList();
            if (taglistMore.Count>6)
            {
                div_repeatermore.Visible = true;
                for (int i = 0; i < 6; i++)
                {
                    taglistMore.RemoveAt(0);
                }

                RepeaterMore.DataSource = taglistMore;
                RepeaterMore.DataBind();
            }
            else
            {
                div_repeatermore.Visible = false;

            }
            */
            div_repeatermore.Visible = false;

            //            Repeater1.DataSource = (from row in DatabaseContext.Tags where row.ShowInTabs orderby row.OrderNumber select row).Take(7);
            //           Repeater1.DataBind();


            //List<Tag> taglist = (from row in DatabaseContext.Tags where row.ShowInTabs orderby row.OrderNumber select row).ToList();
            //taglist.Insert(0, allTag);

            //Repeater2.DataSource = taglist;
            //Repeater2.DataBind();

            if (!IsPostBack)
            {


                //TreeNode categoriesNode = new TreeNode("All");
                //categoriesNode.NavigateUrl = "javascript:onGalleryClick()";
                //categoriesNode.Expand();
                //List<Tag> listTags = (from t in DatabaseContext.Tags orderby t.Name select t).ToList();
                //foreach (Tag tag in listTags)
                //{
                //    TreeNode catNode = new TreeNode(tag.Name, tag.TagId.ToString());
                //    catNode.NavigateUrl = "javascript:onGalleryClick("+tag.TagId+")";
                //    catNode.CollapseAll();
                //    categoriesNode.ChildNodes.Add(catNode);
                //}
                //tvStructure.Nodes.Add(categoriesNode);
            }
        }



        protected void submitButton_Click(object sender, ImageClickEventArgs e)
        {
            WestgateEntities DatabaseContext = new WestgateEntities();
            UserEnquiry enquiry = new UserEnquiry
            {
                companyName = CompanyTextID.Text,
                personName = PersonTextID.Text,
                email = EmailTextID.Text,
                postCode = PostTextID.Text,
                phoneNumber = PhoneTextID.Text,
                enquiry = EnquirySelectedId.SelectedItem.Text
            };
            DatabaseContext.UserEnquiries.AddObject(enquiry);
            //            DatabaseContext.AddToUserEnquiries(enquiry);
            DatabaseContext.SaveChanges();
            MailMessage message = new MailMessage();
            message.To.Add(new MailAddress(EmailTextID.Text, PersonTextID.Text));
            message.Body = "Company :" + CompanyTextID.Text + "<br/>Person :" + PersonTextID.Text + "<br/>Email :" + EmailTextID.Text + "<br/>Post Code : " + PostTextID.Text + "<br/>Phone :" + PhoneTextID.Text + "<br/>Nature of Enquiry :" + EnquirySelectedId.SelectedItem.Text;
            message.Subject = "Nature of Enquiry";
            message.IsBodyHtml = true;
            EmailUtility.SendEmail(message);
            ErrorLabel.Visible = true;
            ErrorLabel.Text = "Request Sent";



        }
    }
}