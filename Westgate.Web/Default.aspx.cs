using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;

namespace Westgate.Web
{
    public partial class Default : Pages.GenericPage
    {
        IQueryable<Category> categoryItem;
        IQueryable<Subcategory> subcategoryItem;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryItem = from rowCat in DatabaseContext.Categories select rowCat;
                Label1.Text = categoryItem.Count().ToString();
                CategoryRepeater.DataSource = categoryItem;
                CategoryRepeater.DataBind();
            }
        }
        protected void CategoryRepeater_ItemCommand(object source, RepeaterItemEventArgs e)
        {
            
            Repeater rptHeader = (Repeater)e.Item.FindControl("subCategoryRepeater");
            if (rptHeader != null)
            {
                Label catId = (Label)e.Item.FindControl("CatId");
                int id = int.Parse(catId.Text);
                subcategoryItem = from row in DatabaseContext.Subcategories where row.CategoryId == id select row;
                rptHeader.DataSource = subcategoryItem;
                rptHeader.DataBind();
            }
        }

    }
}