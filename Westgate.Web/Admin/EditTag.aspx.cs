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
    public partial class EditTag : AuthenticatedPage
    {
        IQueryable<Westgate.Data.Image> imageList = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Save"] != null)
            {
                message.Visible = true;
            }

            Tag tagItem = null;
            if (Request["TagId"] != null)
            {
                if (!IsPostBack)
                {
                    int id = int.Parse(Request["TagId"]);
                    tagItem = (from row in DatabaseContext.Tags
                               where row.TagId == id
                               select row).First();
                    NameText.Text = tagItem.Name;
                    DescriptionText.Text = tagItem.Description;

                    if (!tagItem.IsEditable)
                        SetTag(tagItem);

                    //SetImagesOrderNumber(tagItem);

                    //imageList = (from imgTag in DatabaseContext.ImageTags
                    //             where imgTag.Tag.TagId == tagItem.TagId
                    //             orderby imgTag.OrderNumber
                    //             select imgTag.Image);

                    //Repeater1.DataSource = imageList;
                    //Repeater1.DataBind();
                }
                //if (Request["deleteID"] != null)
                //{
                //    int imageId = Int32.Parse(Request["deleteID"]);
                //    Westgate.Data.Image img = (from image in DatabaseContext.Images
                //                               where image.ImageId == imageId
                //                               select image).FirstOrDefault();

                //    var imageTag = (from imgTag in DatabaseContext.ImageTags
                //                    where imgTag.ImageId == img.ImageId
                //                    && imgTag.TagId == tagItem.TagId
                //                    select imgTag).FirstOrDefault();
                //    DatabaseContext.ImageTags.DeleteObject(imageTag);
                //    DatabaseContext.SaveChanges();
                //    SetImagesOrderNumber(tagItem);
                //    Response.Redirect("~/Admin/EditTag.aspx?tagId=" + tagItem.TagId);
                //}

            }

            if (IsPostBack == false)
            {
                Tag tag = GetTag();
            }
        }

        private Tag GetTag()
        {
            Tag tag = null;
            if (Request["tagId"] != null)
            {

                int tagId = int.Parse(Request["tagId"]);
                tag = (from t in DatabaseContext.Tags
                       where t.TagId == tagId
                       select t).FirstOrDefault();
                NameText.Text = tag.Name;
                DescriptionText.Text = tag.Description;
                RadioButtonYes.Checked = tag.ShowInTabs;
                RadioButtonNo.Checked = !tag.ShowInTabs;
            }
            return tag;
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            int tagId = int.Parse(Request["tagId"]);

            Tag tagItem = (from row in DatabaseContext.Tags
                           where row.TagId == tagId
                           select row).First();
            tagItem.Name = NameText.Text;

            tagItem.Description = DescriptionText.Text;
            tagItem.ShowInTabs = RadioButtonYes.Checked;

            DatabaseContext.SaveChanges();

            Response.Redirect("EditTag.aspx?save=true&tagId=" + tagId);
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

        private void SetTag(Tag tag)
        {
            if (!tag.IsEditable)
            {
                this.NameText.Enabled = false;
                this.RadioButtonYes.Enabled = false;
                this.RadioButtonNo.Enabled = false;
            }
        }
    }
}