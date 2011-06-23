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
            }
            return category;
        }
    }
}