using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using System.Configuration;

using Westgate.Data;
namespace Westgate.Web.Admin
{
    public partial class HomeImages : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                tbText.Text = ConfigurationManager.AppSettings["HomeText"];                
            }
        }
        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            if (IsPostBack == false)
            {
                tbText.Text = ConfigurationManager.AppSettings["HomeText"];      
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
                        int imageOrder = image.OrderImage.Value;
                        var otherImages = from c in DatabaseContext.Images where c.OrderImage > image.OrderImage.Value select c;
                        foreach (Westgate.Data.Image checkOrder in otherImages)
                        {
                            checkOrder.OrderImage = (checkOrder.OrderImage.Value) - 1;
                        }
                        DatabaseContext.SaveChanges();
                        image.OrderImage = null;
                        DatabaseContext.SaveChanges();
                        GridView1.DataBind();
                }

            }
            if (e.CommandName.Equals("ImageUp"))
            {
                int imageId = int.Parse(e.CommandArgument.ToString());
                var homeImages = (from c in DatabaseContext.Images where c.ImageId == imageId select c).FirstOrDefault();
                var downImages = (from c in DatabaseContext.Images where c.OrderImage == (homeImages.OrderImage - 1) select c).FirstOrDefault();
                if (downImages != null)
                {
                    homeImages.OrderImage = homeImages.OrderImage - 1;
                    downImages.OrderImage = downImages.OrderImage + 1;
                }
                DatabaseContext.SaveChanges();

            }
            if (e.CommandName.Equals("ImageDown"))
            {
                int imageId = int.Parse(e.CommandArgument.ToString());
                var homeImages = (from c in DatabaseContext.Images where c.ImageId == imageId select c).FirstOrDefault();
                var downImages = (from c in DatabaseContext.Images where c.OrderImage == (homeImages.OrderImage + 1) select c).FirstOrDefault();
                if (downImages != null)
                {
                    homeImages.OrderImage = homeImages.OrderImage + 1;
                    downImages.OrderImage = downImages.OrderImage - 1;
                }
                DatabaseContext.SaveChanges();

            }
            Response.Redirect(Request.UrlReferrer.AbsoluteUri.ToString());

        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["HomeText"] = "hello";   
        }
    }
}