using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin
{
    public partial class addHomeImages : AuthenticatedPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void checkImages(object sender, EventArgs e) {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("checkItem");
                HiddenField item = (HiddenField)(cb.Parent.FindControl("ImageHiddenValue"));
                int imageId = Int32.Parse(item.Value);
                var image = (from c in DatabaseContext.Images where c.ImageId == imageId && c.OrderImage!=null select c).FirstOrDefault();
                if (image != null) {
                    cb.Checked = true;
                }
            }
        }
        protected void updateImages(object sender, EventArgs e) {
            if (IsPostBack)
            {
                int count = 0;
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("checkItem");
                    if (cb.Checked)
                    {
                        count++;
                    }
                }
                if (count > 10)
                {
                    messageImg.Visible = true;
                    messageSuccessImg.Visible = false;
                }
                else
                {
                    var imageOrder = (from c in DatabaseContext.Images select c.OrderImage).Max();
                    int imageCount = 0;
                    if (imageOrder != null) {
                        imageCount = imageOrder.Value;
                    }
                    imageCount = imageCount+1;
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        CheckBox cb = (CheckBox)row.FindControl("checkItem");
                        HiddenField item = (HiddenField)((cb).Parent.FindControl("ImageHiddenValue"));
                        int imageId = Int32.Parse(item.Value);
                        var image = (from c in DatabaseContext.Images where c.ImageId == imageId select c).FirstOrDefault();
                        if (cb.Checked)
                        {
                            if (image.OrderImage == null)
                            {

                                image.OrderImage = imageCount;
                                DatabaseContext.SaveChanges();
                                imageCount++;
                            }
                        }
                        else
                        {
                            if (image.OrderImage != null) {
                                if (imageCount > image.OrderImage.Value) {
                                    var otherImages = from c in DatabaseContext.Images where c.OrderImage > image.OrderImage.Value select c;
                                    foreach (Westgate.Data.Image checkOrder in otherImages) {
                                        checkOrder.OrderImage = (checkOrder.OrderImage.Value)-1;
                                        imageCount = checkOrder.OrderImage.Value+1;
                                    }
                                    DatabaseContext.SaveChanges();
                                }
                            }
                            image.OrderImage = null;
                            DatabaseContext.SaveChanges();
                        }
                    }
                    messageImg.Visible = false;
                    messageSuccessImg.Visible = true;
                }
            }
        }
        /*protected void SelectItemChange(object sender, EventArgs e)
        {
            int count = 0;
            foreach(GridViewRow row in GridView1.Rows){
                CheckBox cb = (CheckBox)row.FindControl("checkItem");
                if (cb.Checked) {
                    count++;
                }
            }
            if (count > 10)
            {
                CheckBox cb = (CheckBox)sender;
                cb.Checked = false;
                messageImg.Visible = true;
            }
            else {
                CheckBox cb = (CheckBox)sender;
                messageImg.Visible = false;
                if(cb.Checked){
                    HiddenField item = (HiddenField)(((CheckBox)sender).Parent.FindControl("ImageHiddenValue"));
                    int imageId = Int32.Parse(item.Value);
                    var image = (from c in DatabaseContext.Images where c.ImageId == imageId select c).FirstOrDefault();
                    image.OrderImage = count;
                    DatabaseContext.SaveChanges();
                }
            }
        }*/
    }
}