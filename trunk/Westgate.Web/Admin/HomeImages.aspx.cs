using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin
{
    public partial class HomeImages : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var homeImages = from c in DatabaseContext.Images where c.OrderImage != null orderby c.OrderImage select c;
            GridView1.DataSource = homeImages;
            GridView1.DataBind();
        }
    }
}