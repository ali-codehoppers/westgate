using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Web.Pages;
using Westgate.Data;
namespace Westgate.Web.ajax
{
    public partial class CategoryContents : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["categoryId"] != null)
            {
                int categoryId = int.Parse(Request["categoryId"]);
                Category category = (from c in DatabaseContext.Categories where c.CategoryId == categoryId select c).FirstOrDefault();
                if (category != null)
                {
                    categoryName.Text = category.Name;
                    categoryDescription.Text = category.Description;
                }
            }
        }
    }
}