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
    public partial class TagsList : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["deleteID"] != null)
            {
                int id = Int32.Parse(Request["deleteID"]);
                var item = (from t in DatabaseContext.Tags where t.TagId == id select t).FirstOrDefault();
                if (item != null)
                {
                    //RepeaterTags.DataSource = null;
                    var imageTagList = (from imgTag in DatabaseContext.ImageTags where imgTag.TagId == item.TagId select imgTag);
                    foreach (Westgate.Data.ImageTag imgTag in imageTagList)
                    {
                        DatabaseContext.ImageTags.DeleteObject(imgTag);
                        //DatabaseContext.SaveChanges();
                    }
                    DatabaseContext.Tags.DeleteObject(item);
                    DatabaseContext.SaveChanges();
                    SetTagsOrderNumber();
                }
                Response.Redirect("~/Admin/TagsList.aspx");
            }
            SetTagsOrderNumber();
            var source = from t in DatabaseContext.Tags orderby t.OrderNumber select t;
            RepeaterTags.DataSource = source;
            RepeaterTags.DataBind();

        }

        private void SetTagsOrderNumber()
        {
            var tagsList = (from tags in DatabaseContext.Tags
                        orderby tags.OrderNumber
                        select tags);

            int orderNumber = 1;
            foreach (Westgate.Data.Tag tag in tagsList)
            {
                tag.OrderNumber = orderNumber++;
            }
            DatabaseContext.SaveChanges();
        }


    }
}