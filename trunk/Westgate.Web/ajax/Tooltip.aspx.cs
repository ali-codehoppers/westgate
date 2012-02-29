using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web
{
    public partial class Tooltip : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Westgate.Data.Image image = null;
            if (this.Request["ImageId"] != null)
            {
                try
                {
                    int id = int.Parse(this.Request["ImageId"]);

                    image = (from img in DatabaseContext.Images
                             where img.ImageId == id
                             select img).FirstOrDefault();

                    if (image != null)
                    {
                        this.Text_Name.Text = image.Name;
                        this.Text_Desc.Text = image.Description;
                        String path = (String)GetThumbnailImagePath(image.CombinedImagePath).ToString().Replace("../", "");
                        this.Image_Tooltip.ImageUrl = (String)GetThumbnailImagePath(image.CombinedImagePath).ToString().Replace("~/","");
                    }
                }
                catch
                {
                }
            }
        }
    }
}