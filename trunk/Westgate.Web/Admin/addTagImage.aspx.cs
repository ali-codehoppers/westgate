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
    public partial class addTagImage : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["tagId"] != null)
                {
                    int tagId = int.Parse(Request["tagId"]);

                    Tag tag = (from t in DatabaseContext.Tags
                               where t.TagId == tagId
                               select t).FirstOrDefault();

                    var imagesList = (from img in DatabaseContext.Images
                                      where (from t in img.ImageTags
                                             where t.Tag.TagId == tagId
                                             select t).Count() == 0
                                      select img);

                    GridViewImages.DataSource = imagesList;
                    GridViewImages.DataBind();
                }
            }
        }

        protected void checkImages(object sender, EventArgs e)
        {
        }

        protected void updateImages(object sender, EventArgs e)
        {
            int count = 0;
            Tag tag = null;
            if (Request["tagId"] != null)
            {
                int tagId = int.Parse(Request["tagId"]);
                tag = (from t in DatabaseContext.Tags
                       where t.TagId == tagId
                       select t).FirstOrDefault();
            }

            int orderNumber = 1;
            var result = (from itag in DatabaseContext.ImageTags
                         where itag.Tag.TagId == tag.TagId
                         select itag.OrderNumber).Max();
            if (result.Value != null && result.Value > 0)
            {
                orderNumber = result.Value + 1;
            }

            foreach (GridViewRow row in GridViewImages.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("checkItem");
                HiddenField item = (HiddenField)((cb).Parent.FindControl("ImageHiddenValue"));
                int imageId = Int32.Parse(item.Value);
                var image = (from c in DatabaseContext.Images
                             where c.ImageId == imageId
                             select c).FirstOrDefault();

                if (cb.Checked)
                {
                    ImageTag imgTag = new ImageTag
                    {
                        Tag = tag,
                        Image = image,
                        OrderNumber = orderNumber
                    };
                    DatabaseContext.ImageTags.AddObject(imgTag);
                    //                    image.ImageTags.Add(tag);
                }
                orderNumber++;
            }
            DatabaseContext.SaveChanges();
            messageSuccessImg.Visible = true;


            ClientScript.RegisterStartupScript(this.GetType(), "CloseFinding", "parent.window.location.href=parent.window.location.href;", true);
        }
    }
}