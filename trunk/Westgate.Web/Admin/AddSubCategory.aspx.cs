using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

using Westgate.Data;

namespace Westgate.Web.Admin
{
    public partial class AddSubCategory : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Category category = GetCategory();
            if(category != null)
            {
                lblCategoryName.Text = category.Name;
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Category category = GetCategory();
            if (category != null)
            {
                Subcategory subcategory = new Subcategory { Name = tbName.Text, Description = tbDescription.Text, CategoryId = category.CategoryId };
                if (category.NumberOfSubcategories == null)
                {
                    category.NumberOfSubcategories = 0;
                }
                category.NumberOfSubcategories = category.NumberOfSubcategories + 1;
                DatabaseContext.AddToSubcategories(subcategory);
                DatabaseContext.SaveChanges();
                Response.Redirect("~/Admin/EditSubCategory.aspx?subcategoryId=" + subcategory.SubcategoryId + "&Save=true", false);
            }
        }
        private Category GetCategory()
        {
            int categoryId = int.Parse(Request["categoryId"]);
            return (from c in DatabaseContext.Categories where c.CategoryId == categoryId select c).FirstOrDefault();
        }
    }
}