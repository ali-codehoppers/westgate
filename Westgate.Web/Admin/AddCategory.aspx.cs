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
    public partial class AddCategory : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Save"] != null) {
                message.Visible = true;
            }
        }
        protected void AddButton_Click(object sender, EventArgs e)
        {
            Category CategoryItem = new Category { Name = NameText.Text, Description = DescriptionText.Text };
            DatabaseContext.AddToCategories(CategoryItem);
            DatabaseContext.SaveChanges();
            Response.Redirect("~/Admin/AddCategory.aspx?Save=true", false);
        }
    }
}