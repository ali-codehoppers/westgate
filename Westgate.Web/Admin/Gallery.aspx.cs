using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;
using System.Web.Services;

namespace Westgate.Web.Admin
{
    public partial class Gallery : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tag allTag = new Tag
                {
                    TagId = 0,
                    Name = "All"
                };

                List<Tag> taglist = (from row in DatabaseContext.Tags where row.ShowInTabs orderby row.OrderNumber select row).ToList();
                taglist.Insert(0, allTag);

                Repeater2.DataSource = taglist;
                Repeater2.DataBind();
            }

            if (Request["tagId"] != null)
            {
                int tagId = int.Parse(Request["tagId"]);
                Tag tag = (from t in DatabaseContext.Tags
                           where t.TagId == tagId
                           select t).FirstOrDefault();


                SetGallery(tagId);

                if (Request["deleteID"] != null)
                {
                    int imageId = Int32.Parse(Request["deleteID"]);
                    Westgate.Data.Image img = (from image in DatabaseContext.Images
                                               where image.ImageId == imageId
                                               select image).FirstOrDefault();

                    var imageTag = (from imgTag in DatabaseContext.ImageTags
                                    where imgTag.ImageId == img.ImageId
                                    && imgTag.TagId == tagId
                                    select imgTag).FirstOrDefault();
                    DatabaseContext.ImageTags.DeleteObject(imageTag);
                    DatabaseContext.SaveChanges();
                    SetImagesOrderNumber(tag);
//                    Response.Redirect("~/Admin/Gallery.aspx?tagId=" + tag.TagId);
                }

            }
            else
            {
                SetGallery();
            }
        }

        private void SetGallery()
        {
            var images = (from img in DatabaseContext.Images
                                select img);
            Repeater1.DataSource = images;
            Label1.Text = images.Count().ToString();
            Repeater1.DataBind();

        }

        private void SetGallery(int tagId)
        {
            if (tagId > 0)
            {
                Tag tag = (from t in DatabaseContext.Tags
                           where t.TagId == tagId
                           select t).FirstOrDefault();

                var tagImages = (from imgTag in DatabaseContext.ImageTags
                                 where imgTag.Tag.TagId == tag.TagId
                                 orderby imgTag.OrderNumber
                                 select imgTag.Image);

                Repeater1.DataSource = tagImages;
                Repeater1.DataBind();
                Label1.Text = tagImages.Count().ToString();

            }
            else
                SetGallery();

        }

        private void SetImagesOrderNumber(Tag tag)
        {
            var imageTagList = (from imgTag in DatabaseContext.ImageTags
                                where imgTag.Tag.TagId == tag.TagId
                                orderby imgTag.OrderNumber
                                select imgTag);

            int orderNumber = 1;
            foreach (Westgate.Data.ImageTag imgTag in imageTagList)
            {
                imgTag.OrderNumber = orderNumber++;
            }
            DatabaseContext.SaveChanges();
        }
    }
}