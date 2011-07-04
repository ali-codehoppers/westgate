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
    public partial class HomeImages : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var homeImages = from c in DatabaseContext.Images where c.OrderImage != null orderby c.OrderImage select c;
                GridView1.DataSource = homeImages;
                GridView1.DataBind();
            }

        }
        protected void upOrder(object sender, EventArgs e)
        {
            HiddenField imageId = (HiddenField)((ImageButton)sender).Parent.FindControl("hiddenImageId");
            int id = Int32.Parse(imageId.Value);
            var homeImages = (from c in DatabaseContext.Images where c.ImageId == id select c).FirstOrDefault();
            var downImages = (from c in DatabaseContext.Images where c.OrderImage == (homeImages.OrderImage - 1) select c).FirstOrDefault();
            if (downImages != null)
            {
                homeImages.OrderImage = homeImages.OrderImage - 1;
                downImages.OrderImage = downImages.OrderImage + 1;
            }
            DatabaseContext.SaveChanges();
            Response.Redirect("HomeImages.aspx");
        }
        protected void downOrder(object sender, EventArgs e)
        {
            HiddenField imageId = (HiddenField)((ImageButton)sender).Parent.FindControl("hiddenImageId");
            int id = Int32.Parse(imageId.Value);
            var homeImages = (from c in DatabaseContext.Images where c.ImageId == id select c).FirstOrDefault();
            var downImages = (from c in DatabaseContext.Images where c.OrderImage == (homeImages.OrderImage + 1) select c).FirstOrDefault();
            if (downImages != null)
            {
                homeImages.OrderImage = homeImages.OrderImage + 1;
                downImages.OrderImage = downImages.OrderImage - 1;
            }
            DatabaseContext.SaveChanges();
            Response.Redirect("HomeImages.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteImage"))
            {
                int imageId = int.Parse(e.CommandArgument.ToString());
                Westgate.Data.Image image = (from i in DatabaseContext.Images where i.ImageId == imageId select i).FirstOrDefault();
                if(image != null)
                {
                    image.OrderImage = null;
                    DatabaseContext.SaveChanges();
                    GridView1.DataBind();
                }
            }
        }
    }
}