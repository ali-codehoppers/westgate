using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;
using Westgate.Web.Pages;

namespace Westgate.Web.Admin
{
    public partial class subCategoryList : AuthenticatedPage
    {
        int selectedIndex = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                var CategorySource=from c in DatabaseContext.Categories select c;
                ddlCategory.DataSource = CategorySource;
                ddlCategory.DataBind();
                if (Request["CategoryId"] != null)
                {
                    //'' int catId = Int32.Parse(Reqest["CategoryId"]);
                    //ddlCategory.SelectedIndex = catId;
                    //ddlCategory.SelectedItem.Value = Request["CategoryId"];
                    foreach (ListItem i in ddlCategory.Items)
                    {
                        if (i.Value == Request["CategoryId"])
                        {
                            i.Selected = true;
                            break;
                        }
                    }
                }
                else
                {
                     ddlCategory.SelectedIndex = selectedIndex;
                }
            }
            Category_Change(ddlCategory, System.EventArgs.Empty);
        }
        protected void Category_Change(object sender, EventArgs e) {
            if (Request["deleteId"] != null) { 
                int id=Int32.Parse(Request["deleteId"]);
                var subCategoryItem = (from c in DatabaseContext.Subcategories where c.SubcategoryId == id select c).FirstOrDefault();
                if (subCategoryItem != null) {
                    DatabaseContext.Subcategories.DeleteObject(subCategoryItem);
                    DatabaseContext.SaveChanges();
                }
            }
            DropDownList list = (DropDownList)sender;
            int idSelected = Int32.Parse(list.SelectedItem.Value);
            selectedIndex = idSelected;
            var subCategorySource = from c in DatabaseContext.Subcategories where c.CategoryId == idSelected select c;
            GridView1.DataSource = subCategorySource;
            GridView1.DataBind();
        }
    }
}