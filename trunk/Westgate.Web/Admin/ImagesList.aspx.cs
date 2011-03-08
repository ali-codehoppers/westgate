using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin
{
    public partial class ImagesList : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ddlSubcategories_DataBound(object sender, EventArgs e)
        {
            ddlStories.DataBind();
        }
        protected void ddlStories_DataBound(object sender, EventArgs e)
        {
            gvImages.DataBind();
        }

        
    }
}