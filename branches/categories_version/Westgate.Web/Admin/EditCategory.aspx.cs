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
    public partial class EditCategory : AuthenticatedPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Save"] != null)
            {
                message.Visible = true;
            }
            if (Request["deleteID"] != null)
            {
                int id = Int32.Parse(Request["deleteID"]);
                Subcategory item = (from c in DatabaseContext.Subcategories where c.SubcategoryId == id select c).FirstOrDefault();
                if (item != null)
                {
                    DatabaseContext.Subcategories.DeleteObject(item);
                    DatabaseContext.SaveChanges();
                }
                Response.Redirect("~/Admin/EditCategory.aspx?categoryId=" + item.CategoryId);
            }
            if (IsPostBack == false)
            {
                Category category = GetCategory();
                if (category != null)
                {
                    gvSubcategories.DataSource = (from s in DatabaseContext.Subcategories where s.CategoryId == category.CategoryId select s);
                    gvSubcategories.DataBind();
                }
            }
        }
        private Category GetCategory()
        {
            Category category = null;
            if (Request["categoryId"] != null)
            {

                int categoryId = int.Parse(Request["categoryId"]);
                category = (from c in DatabaseContext.Categories where c.CategoryId == categoryId select c).FirstOrDefault();
                NameText.Text = category.Name;
                DescriptionText.Text = category.Description;
            }
            return category;
        }
        protected void EditButton_Click(object sender, EventArgs e) {
            int categoryId = int.Parse(Request["categoryId"]);
            Category CategoryItem = (from row in DatabaseContext.Categories where row.CategoryId == categoryId select row).First();
            CategoryItem.Name = NameText.Text;
            CategoryItem.Description = DescriptionText.Text;
            DatabaseContext.SaveChanges();

            Response.Redirect("EditCategory.aspx?save=true&categoryId=" + categoryId);
        }
    }
}