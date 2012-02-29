using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;
using System.Text;

namespace Westgate.Web.Admin.ajax
{
    public partial class DeleteImage : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int tagId = 0;
            int imageId = 0;

            Int32.TryParse(Request["tagId"], out tagId);
            Int32.TryParse(Request["imageId"], out imageId);

            if (tagId > 0 && imageId>0)
            {

               Westgate.Data.Image img = (from image in DatabaseContext.Images
                                           where image.ImageId == imageId
                                           select image).FirstOrDefault();

               Westgate.Data.Tag tagItem = (from row in DatabaseContext.Tags
                          where row.TagId == tagId
                          select row).First();

                var imageTag = (from imgTag in DatabaseContext.ImageTags
                                where imgTag.ImageId == img.ImageId
                                && imgTag.TagId == tagItem.TagId
                                select imgTag).FirstOrDefault();
                DatabaseContext.ImageTags.DeleteObject(imageTag);
                DatabaseContext.SaveChanges();
                SetImagesOrderNumber(tagItem);
            }
            else
            {
                Westgate.Data.Image img = (from image in DatabaseContext.Images
                                           where image.ImageId == imageId
                                           select image).FirstOrDefault();

                for (int i = 0; i < img.ImageTags.Count(); i++)
                {
                    var image = img.ImageTags.ToList()[i];
                    DatabaseContext.ImageTags.DeleteObject(image);
                    i--;
                }

                DatabaseContext.Images.DeleteObject(img);
                DatabaseContext.SaveChanges();
            }

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