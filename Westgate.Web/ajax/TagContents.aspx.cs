using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Web.Pages;
using Westgate.Data;

namespace Westgate.Web.ajax
{
	public partial class TagContents: AJAXPage
	{
		protected void Page_Load (object sender, EventArgs e)
		{
            if (Request["tagId"] != null)
            {
                int tagId = int.Parse(Request["tagId"]);
                Tag tag = (from t in DatabaseContext.Tags
                           where t.TagId == tagId
                           select t).FirstOrDefault();

                if (tag != null)
                {
             //       tagLink.NavigateUrl = "javascript:OnCategoryClick(" + Request["tagId"] + ")";
               //     tagLink.Text = tag.Name.ToString();
                    tagName.Text = tag.Name;
                    tagDescription.Text = tag.Description;
                }
            }
		}
	}
}