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
    public partial class SubcategoryContents : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["SubcategoryId"] != null)
            {
                int SubcategoryId = int.Parse(Request["SubcategoryId"]);
                Subcategory Subcategory = (from c in DatabaseContext.Subcategories where c.SubcategoryId == SubcategoryId select c).FirstOrDefault();
                if (Subcategory != null)
                {
                    categoryLink.NavigateUrl = "javascript:OnCategoryClick(" + Subcategory.CategoryId + ")";
                    categoryLink.Text = Subcategory.Category.Name.ToString();
                    subcategoryLink.NavigateUrl = "javascript:OnSubcategoryClick(" + Request["SubcategoryId"] + ")";
                    subcategoryLink.Text = Subcategory.Name.ToString();
                    SubcategoryName.Text = Subcategory.Name;
                    SubcategoryDescription.Text = Subcategory.Description;
                    rptImageCategories.DataSource = (from row in DatabaseContext.Images where (from n in DatabaseContext.Stories where n.SubcategoryId == SubcategoryId select n.StoryId).Contains(row.StoryId) orderby row.ImageId descending select row).Take(4);
                    rptImageCategories.DataBind();
                }
            }
        }
    }
}