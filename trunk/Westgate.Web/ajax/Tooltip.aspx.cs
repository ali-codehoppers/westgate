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
            if (this.Request["Name"] != null)
            {
                this.Text_Name.Text = "" + this.Request["Name"];
            }
            else
            {
                this.Text_Name.Text = "";
                this.Text_Name.Visible = false;
            }

            if (this.Request["Desc"] != null)
            {
                this.Text_Desc.Text = ""+this.Request["Desc"];
            }
            else
            {
                this.Text_Desc.Text = "";
                this.Text_Desc.Visible = false;
            }

            if (this.Request["Path"] != null)
            {
                // this.Image_Tooltip.Attributes["src"] = (String)GetThumbnailImagePath(this.Request["Path"]);

                this.Image_Tooltip.ImageUrl = (String)GetThumbnailImagePath(this.Request["Path"]);
            }
            else
            {
                this.Image_Tooltip.Visible = false;
            }

        }
    }
}