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
        WestgateEntities Context = new WestgateEntities();
        IQueryable<Category> categoryItem;
        IQueryable<Subcategory> subcategoryItem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryItem = from rowCat in Context.Categories select rowCat;
                CategoryRepeater.DataSource = categoryItem;
                CategoryRepeater.DataBind();
            }
        }

        protected void CategoryRepeater_ItemCommand(object source, RepeaterItemEventArgs e)
        {
            Repeater rptHeader = (Repeater)e.Item.FindControl("subCategoryRepeater");
            if (rptHeader != null)
            {
               Label catId = (Label)e.Item.FindControl("CatId");
               int id = int.Parse(catId.Text);
               subcategoryItem = from row in Context.Subcategories where row.CategoryId == id select row;
               rptHeader.DataSource = subcategoryItem;
               rptHeader.DataBind();    
            }
        }

        protected void submitButton_Click(object sender, ImageClickEventArgs e)
        {
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