using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin
{
    public partial class CategoriesList : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["deleteId"] != null) {
                int id=Int32.Parse(Request["deleteId"]);
                var item = (from c in DatabaseContext.Categories where c.CategoryId == id select c).FirstOrDefault();
                if (item != null) {
                    DatabaseContext.Categories.DeleteObject(item);
                    DatabaseContext.SaveChanges();
                }
            }
            var source = from c in DatabaseContext.Categories select c;
            GridView1.DataSource = source;
            GridView1.DataBind();
        }
      
    }
}