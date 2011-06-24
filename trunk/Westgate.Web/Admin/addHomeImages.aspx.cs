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
        protected void SelectItemChange(object sender, EventArgs e)
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
        }
    }
}