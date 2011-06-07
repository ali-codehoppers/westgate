using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin
{
    public partial class EditStory : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = id = int.Parse(Request["StoryId"]);
            var StoryImageItem = (from row in DatabaseContext.Images where row.StoryId == id select row);
            gvImages.DataSource = StoryImageItem;
            gvImages.DataBind();
            
        }
    }
}