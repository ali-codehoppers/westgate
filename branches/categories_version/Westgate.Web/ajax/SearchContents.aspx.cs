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
            bool checkCat=false,checkSubCat=false,checkStory=false;
            if (Request["search"] != "")
            {
                
                    SearchItems.Visible = false;
                    String search = Request["search"].ToString();
                    String[] searchArray = search.Split(' ');
                    List<Category> CategorySearch = new List<Category>();
                    foreach (String n in searchArray)
                    {
                        var cat = (from row in DatabaseContext.Categories where (row.Name.Contains(n) || row.Description.Contains(n)) select row ).Distinct();
                        if (!cat.Any()) {
                            checkCat = true;
                        }
                        foreach (Category c in cat)
                        {
                            CategorySearch.Add(c);
                        }
                    }
                    List<Westgate.Data.Image> ImageCategorySearch;
                    Repeater1.DataSource=CategorySearch.Distinct();
                    Repeater1.DataBind();
                    for(int i=0;i<Repeater1.Items.Count;i++){
                        ImageCategorySearch = new List<Westgate.Data.Image>();
                        HyperLink CategoryId = (HyperLink)Repeater1.Items[i].FindControl("CategoryID");
                        int idItem = Int32.Parse(CategoryId.Text.ToString());
                        var catImage = from row in DatabaseContext.Images where row.Story.Subcategory.CategoryId == idItem select row;
                        foreach (Westgate.Data.Image c in catImage)
                        {
                            ImageCategorySearch.Add(c);
                        }
                        Repeater categoryImage = (Repeater)Repeater1.Items[i].FindControl("imageCategoryRepeater");
                        categoryImage.DataSource = ImageCategorySearch.Distinct().Take(5);
                        categoryImage.DataBind();
                    }


                    List<Subcategory> SubCategorySearch = new List<Subcategory>();
                    foreach (String n in searchArray)
                    {
                        var cat = (from row in DatabaseContext.Subcategories where (row.Name.Contains(n) || row.Description.Contains(n)) select row).Distinct();
                        if (!cat.Any())
                        {
                            checkSubCat = true;
                        }
                        foreach (Subcategory c in cat)
                        {
                            
                            SubCategorySearch.Add(c);
                        }
                    }

                    List<Westgate.Data.Image> ImageSubcategorySearch;
                    Repeater2.DataSource = SubCategorySearch.Distinct();
                    Repeater2.DataBind();
                    for (int i = 0; i < Repeater2.Items.Count; i++)
                    {
                        ImageSubcategorySearch = new List<Westgate.Data.Image>();
                        HyperLink SubcategoryId = (HyperLink)Repeater2.Items[i].FindControl("SubcategoryID");
                        int idItem = Int32.Parse(SubcategoryId.Text.ToString());
                        var catImage = from row in DatabaseContext.Images where row.Story.SubcategoryId== idItem select row;
                        foreach (Westgate.Data.Image c in catImage)
                        {
                            ImageSubcategorySearch.Add(c);
                        }
                        Repeater SubcategoryImage = (Repeater)Repeater2.Items[i].FindControl("imageSubcategoryRepeater");
                        SubcategoryImage.DataSource = ImageSubcategorySearch.Distinct().Take(5);
                        SubcategoryImage.DataBind();
                    }

                    List<Story> StorySearch = new List<Story>();
                    foreach (String n in searchArray)
                    {
                        var cat = (from row in DatabaseContext.Stories where (row.Name.Contains(n) || row.Description.Contains(n)) select row).Distinct();
                        if (!cat.Any())
                        {
                            checkStory = true;
                        }
                        foreach (Story c in cat)
                        {

                            StorySearch.Add(c);
                        }
                    }

                    List<Westgate.Data.Image> ImageStorySearch;
                    Repeater3.DataSource = StorySearch.Distinct();
                    Repeater3.DataBind();
                    for (int i = 0; i < Repeater3.Items.Count; i++)
                    {
                        ImageStorySearch = new List<Westgate.Data.Image>();
                        HyperLink StoryId = (HyperLink)Repeater3.Items[i].FindControl("StoryID");
                        int idItem = Int32.Parse(StoryId.Text.ToString());
                        var catImage = from row in DatabaseContext.Images where row.StoryId == idItem select row;
                        foreach (Westgate.Data.Image c in catImage)
                        {
                            ImageStorySearch.Add(c);
                        }
                        Repeater StoryImage = (Repeater)Repeater3.Items[i].FindControl("imageStoryRepeater");
                        StoryImage.DataSource = ImageStorySearch.Distinct().Take(5);
                        StoryImage.DataBind();
                    }

                if(checkCat&&checkSubCat&&checkStory){
                    SearchItems.Visible = true;
                    SearchItems.Text = "No Search Result";
                }
            }
            else {
                
                SearchItems.Text = "No Search Result";
            }
        }

    }
}