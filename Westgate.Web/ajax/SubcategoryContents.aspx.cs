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
                    SubcategoryName.Text = Subcategory.Name;
                    SubcategoryDescription.Text = Subcategory.Description;
                }
            }
        }
    }
}