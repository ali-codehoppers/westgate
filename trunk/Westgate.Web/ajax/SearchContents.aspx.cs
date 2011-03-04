using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;
namespace Westgate.Web.ajax
{
    public partial class SearchContents : Pages.GenericPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["search"] != "")
            {
                
                    SearchItems.Visible = false;
                    String search = Request["search"].ToString();
                    String[] searchArray = search.Split(' ');
                    List<Category> CategorySearch = new List<Category>();
                    foreach (String n in searchArray)
                    {
                        var cat = (from row in DatabaseContext.Categories where (row.Name.Contains(n) || row.Description.Contains(n)) select row ).Distinct();
                        foreach (Category c in cat)
                        {

                            CategorySearch.Add(c);
                        }
                    }
                    Repeater1.DataSource=CategorySearch.Distinct();
                    Repeater1.DataBind();
                    List<Subcategory> SubCategorySearch = new List<Subcategory>();
                    foreach (String n in searchArray)
                    {
                        var cat = (from row in DatabaseContext.Subcategories where (row.Name.Contains(n) || row.Description.Contains(n)) select row).Distinct();
                        foreach (Subcategory c in cat)
                        {
                            
                            SubCategorySearch.Add(c);
                        }
                    }
                    Repeater2.DataSource = SubCategorySearch.Distinct();
                    Repeater2.DataBind();
                    List<Story> StorySearch = new List<Story>();
                    foreach (String n in searchArray)
                    {
                        var cat = (from row in DatabaseContext.Stories where (row.Name.Contains(n) || row.Description.Contains(n)) select row).Distinct();
                        foreach (Story c in cat)
                        {

                            StorySearch.Add(c);
                        }
                    }
                    Repeater3.DataSource = StorySearch.Distinct();
                    Repeater3.DataBind();

            }
            else {
                SearchItems.Text = "No Search Result";
            }
        }
    }
}