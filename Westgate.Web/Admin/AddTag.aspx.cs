using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;

namespace Westgate.Web.Admin
{
	public partial class AddTag: AuthenticatedPage
	{
		protected void Page_Load (object sender, EventArgs e)
		{
			if (Request["Save"] != null)
			{
                successMessage.Text = "Tag Saved.";
				message.Visible = true;
			}

            if (!IsPostBack)
            {
                if (Request["tagName"] != null && Request["tagName"].Length>0)
                {
                    String value = Request["tagName"];
                    NameText.Text = Request["tagName"];
                    successMessage.Text = "This tag does not exist. Please fill this to add new tag.";
                }
            }
		}

		protected void AddButton_Click (object sender, EventArgs e)
		{
            int orderNumber = 1;
            var preRecords = (from tag in DatabaseContext.Tags
                              select tag.OrderNumber);
            if (preRecords != null && preRecords.Count() > 0)
            {
                orderNumber = preRecords.Max() + 1;
            }


			Tag TagItem = new Tag
			{
				Name = NameText.Text,
				Description = DescriptionText.Text,
				ShowInTabs = RadioButtonYes.Checked,
                OrderNumber = orderNumber
			};

			DatabaseContext.AddToTags(TagItem);
			DatabaseContext.SaveChanges();
			Response.Redirect("~/Admin/AddTag.aspx?Save=true", false);
		}

	}
}