using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Web.Pages;
namespace Westgate.Web.ajax
{
    public partial class Images : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageType = Request["pageType"].ToUpper();
            if (pageType.Equals("HOME"))
            {
                rptImages.DataSource = (from i in DatabaseContext.Images orderby i.ImageId descending select i).Take(10);
            }
            else if(pageType.Equals("CATEGORY"))
            {
                int categoryId = int.Parse(Request["categoryId"]);
                rptImages.DataSource = (from i in DatabaseContext.Images where i.Story.Subcategory.CategoryId == categoryId orderby i.ImageId descending select i).Take(10);
            }
            else if (pageType.Equals("SUBCATEGORY"))
            {
                int subcategoryId = int.Parse(Request["subcategoryId"]);
                rptImages.DataSource = (from i in DatabaseContext.Images where i.Story.SubcategoryId == subcategoryId orderby i.ImageId descending select i).Take(10);
            }
            else if (pageType.Equals("STORY"))
            {
                int storyId = int.Parse(Request["storyId"]);
                rptImages.DataSource = (from i in DatabaseContext.Images where i.StoryId == storyId orderby i.ImageId descending select i).Take(10);
            }
            rptImages.DataBind();
        }
    }
}