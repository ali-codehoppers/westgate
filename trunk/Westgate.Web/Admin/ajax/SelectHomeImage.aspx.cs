using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin.ajax
{
    public partial class SelectHomeImage : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int imageId = 0;

            Int32.TryParse(Request["imageId"], out imageId);

            if (imageId > 0)
            {
                Westgate.Data.Image img = (from image in DatabaseContext.Images
                                           where image.ImageId == imageId
                                           select image).FirstOrDefault();
                if (!img.HomeImage)
                {
                    img.HomeImage = true;
                }
                else {
                    img.HomeImage = false;
                }
                DatabaseContext.SaveChanges();
                msg.InnerText = "Success";
            }
        }
    }
}