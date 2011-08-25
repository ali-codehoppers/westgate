using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;

namespace Westgate.Web
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WestgateEntities DatabaseContext = new WestgateEntities();
            if (Request["tagId"] != null)
            {
                int tagId = int.Parse(Request["tagId"]);


                Tag tag = (from t in DatabaseContext.Tags
                           where t.TagId == tagId
                           select t).FirstOrDefault();

                var tagImages = (from imgTag in DatabaseContext.ImageTags
                                 where imgTag.Tag.TagId == tag.TagId
                                 orderby imgTag.OrderNumber
                                 select imgTag.Image);

                //var tagImages = (from i in DatabaseContext.Images
                //                  where i.Tags.Contains(tag) == true
                //                 orderby i.ImageId descending
                //                  select i);

                Repeater1.DataSource = tagImages;
                Label1.Text = tagImages.Count().ToString();
            }
            else
            {
                var tagImages = (from imgTag in DatabaseContext.ImageTags
                                 orderby imgTag.Tag.OrderNumber, imgTag.OrderNumber
                                 select imgTag.Image);
                Repeater1.DataSource = tagImages;
                Label1.Text = tagImages.Count().ToString();
            }



            Repeater1.DataBind();

        }

        protected object GetThumbnailImagePath(object path)
        {
            return path.ToString().Replace(".png", "_thumb.png");
        }

    }
}
