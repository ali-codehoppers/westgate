using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;

namespace Westgate.Web.Master
{
    public partial class mainMaster : System.Web.UI.MasterPage
    {
        WestgateEntities Context = new WestgateEntities();
        IQueryable<Category> categoryItem;
        IQueryable<Subcategory> subcategoryItem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryItem = from rowCat in Context.Categories select rowCat;
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
               subcategoryItem = from row in Context.Subcategories where row.CategoryId == id select row;
               rptHeader.DataSource = subcategoryItem;
               rptHeader.DataBind();    
            }
        }

    }
}