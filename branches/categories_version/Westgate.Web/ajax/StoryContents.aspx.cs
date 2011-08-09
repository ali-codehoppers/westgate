using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;
using Westgate.Web.Pages;

namespace Westgate.Web.ajax
{
    public partial class StoryContents : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["StoryId"] != null)
            {
                int StoryId = int.Parse(Request["StoryId"]);
                Story Storycategory = (from c in DatabaseContext.Stories where c.StoryId == StoryId select c).FirstOrDefault();
                if (Storycategory != null)
                {
                    categoryLink.NavigateUrl = "javascript:OnCategoryClick(" + Storycategory.Subcategory.CategoryId + ")";
                    categoryLink.Text = Storycategory.Subcategory.Category.Name.ToString();
                    subcategoryLink.NavigateUrl = "javascript:OnSubcategoryClick(" + Storycategory.SubcategoryId + ")";
                    subcategoryLink.Text = Storycategory.Subcategory.Name.ToString();
                    storyLink.NavigateUrl = "javascript:OnStoryClick(" + Request["StoryId"] + ")";
                    storyLink.Text = Storycategory.Name.ToString();

                    StorycategoryName.Text = Storycategory.Name;
                    StorycategoryDescription.Text = Storycategory.Description;
                    rptCategories.DataSource = (from row in DatabaseContext.Images where row.StoryId == StoryId orderby row.ImageId descending select row).Take(4);
                    rptCategories.DataBind();
                }
            }
        }
    }
}