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
    public partial class EditSubCategory : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Save"] != null)
            {
                message.Visible = true;
            }
            if (Request["deleteId"] != null)
            {
                int id = Int32.Parse(Request["deleteId"]);
                Story storyItem = (from c in DatabaseContext.Stories where c.StoryId== id select c).FirstOrDefault();
                if (storyItem != null)
                {
                    DatabaseContext.Stories.DeleteObject(storyItem);
                    DatabaseContext.SaveChanges();
                }
                Response.Redirect("EditSubCategory.aspx?SubcategoryId=" + Request["SubcategoryId"]);
            }
            if (IsPostBack == false)
            {
                Subcategory subCategoryItem = getSubCategory();
            }
        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request["SubcategoryId"]);
            Subcategory subCategoryItem = (from row in DatabaseContext.Subcategories where row.SubcategoryId == id select row).First();
            subCategoryItem.Name = NameText.Text;
            subCategoryItem.Description = DescriptionText.Text;
            DatabaseContext.SaveChanges();
            Response.Redirect("EditSubCategory.aspx?save=true&SubcategoryId=" + Request["SubcategoryId"]);
        }
        private Subcategory getSubCategory() {
            int id = int.Parse(Request["SubcategoryId"]);
            Subcategory subCategoryItem = (from row in DatabaseContext.Subcategories where row.SubcategoryId == id select row).First();

            NameText.Text = subCategoryItem.Name;
            DescriptionText.Text = subCategoryItem.Description;
            return subCategoryItem;
        }
    }
}