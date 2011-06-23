using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;

namespace Westgate.Web.Admin
{
    public partial class addEdit : System.Web.UI.UserControl
    {
        WestgateEntities Context = new WestgateEntities();
        Category CategoryItem;
        Subcategory subCategoryItem;
        Story StoryItem;
        int id;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Save"] == "true") {
                ShowMessage.Visible = true;
            }
            String Url = Request.Url.ToString();
            if (Url.Contains("AddCategory.aspx") || Url.Contains("AddSubCategory.aspx") || Url.Contains("AddStory.aspx"))
                {
                    EditButton.Visible = false;
                    AddButton.Visible = true;
                    if (Url.Contains("AddSubCategory.aspx") || Url.Contains("AddStory.aspx"))
                    {
                        if (!IsPostBack)
                        {
                            IEnumerable<Category> AllCategoryItem = (from row in Context.Categories select row);
                            IEnumerable<Subcategory> AllSubCategoryItem = (from row in Context.Subcategories select row);
                            if(Url.Contains("AddSubCategory.aspx"))
                            {
                                if (AllCategoryItem.Count() <= 0)
                                {
                                    Response.Redirect("~/Admin/CategoriesList.aspx", false);
                                }
                                else
                                {
                                    Category.Visible = true;
                                    CategoryList.Visible = true;
                                    CategoryList.Enabled = false;
                                    CategoryList.DataSource = AllCategoryItem;
                                    CategoryList.DataValueField = "CategoryId";
                                    CategoryList.DataTextField = "Name";
                                    CategoryList.DataBind();
                                    
                                    if (Request["CatId"] != null)
                                    {
                                        int Selection=Int32.Parse(Request["CatId"]);
                                        CategoryList.SelectedIndex = Selection;
                                    }
                    
                                }
                            }
                            else if (Url.Contains("AddStory.aspx"))
                            {
                                if (AllSubCategoryItem.Count() <= 0)
                                {
                                    Response.Redirect("~/Admin/subCategoryList.aspx", false);
                                }
                                else
                                {
                                    Category.Visible = true;
                                    CategoryList.Visible = true;
                                    CategoryList.Enabled = true;
                                    CategoryList.DataSource = AllCategoryItem;
                                    CategoryList.DataValueField = "CategoryId";
                                    CategoryList.DataTextField = "Name";
                                    CategoryList.DataBind();
                                    SubCategory.Visible = true;
                                    SubCategoryList.Visible = true;
                                    int catId = Int32.Parse(CategoryList.SelectedItem.Value);
                                    AllSubCategoryItem = (from row in Context.Subcategories where row.CategoryId == catId select row);
                                    SubCategoryList.DataSource = AllSubCategoryItem;
                                    SubCategoryList.DataValueField = "SubcategoryId";
                                    SubCategoryList.DataTextField = "Name";
                                    SubCategoryList.DataBind();
                                }
                            }
                            
                        }
                    }
                }
            else if (Url.Contains("EditCategory.aspx") || Url.Contains("EditSubCategory.aspx") || Url.Contains("EditStory.aspx"))
                {
                    CategoryList.Enabled = false;
                    SubCategoryList.Enabled = false;

                    AddButton.Visible = false;
                    EditButton.Visible = true;
                    if (Request["categoryId"] == null && Request["SubcategoryId"] == null && Request["StoryId"] == null)
                    {
                        Response.Redirect("~/Admin/CategoriesList.aspx", false);
                    }
                    else if (Request["categoryId"] != null)
                    {
                        id = int.Parse(Request["categoryId"]);
                        CategoryItem = (from row in Context.Categories where row.CategoryId == id select row).First();
                        if (!IsPostBack)
                        {
                            NameText.Text = CategoryItem.Name;
                            DescriptionText.Text = CategoryItem.Description;
                        }
                       //Response.Redirect("~/Admin/EditCategory.aspx?categoryId="+Request["categoryId"], false);
                    }
                    if (Request["SubcategoryId"] == null && Request["categoryId"] == null && Request["StoryId"] == null)
                    {
                        Response.Redirect("~/Admin/subCategoryList.aspx", false);
                    }
                    else if(Request["SubcategoryId"] != null)
                    {
                        id = int.Parse(Request["SubcategoryId"]);
                        subCategoryItem = (from row in Context.Subcategories where row.SubcategoryId == id select row).First();
                        Category.Visible = true;
                        CategoryList.Visible = true;
                        if (!IsPostBack)
                        {
                            NameText.Text = subCategoryItem.Name;
                            DescriptionText.Text = subCategoryItem.Description;
                            var AllCategoryItem = (from row in Context.Categories select row);
                            CategoryList.DataSource = AllCategoryItem;
                            CategoryList.DataTextField = "Name";
                            CategoryList.DataValueField = "CategoryId";
                            CategoryList.SelectedValue = Convert.ToString(subCategoryItem.CategoryId);
                            CategoryList.DataBind();
                        
                        }
                    }
                    if (Request["SubcategoryId"] == null && Request["categoryId"] == null && Request["StoryId"] == null)
                    {
                        Response.Redirect("~/Admin/StoryList.aspx", false);
                    }
                    else if (Request["StoryId"] != null)
                    {
                        id = int.Parse(Request["StoryId"]);
                        StoryItem = (from row in Context.Stories where row.StoryId == id select row).First();
                        SubCategory.Visible = true;
                        SubCategoryList.Visible = true;
                        if (!IsPostBack)
                        {
                            NameText.Text = StoryItem.Name;
                            DescriptionText.Text = StoryItem.Description;
                            var AllCategoryItem = (from row in Context.Subcategories select row);
                            SubCategoryList.DataSource = AllCategoryItem;
                            SubCategoryList.DataTextField = "Name";
                            SubCategoryList.DataValueField = "SubcategoryId";
                            SubCategoryList.SelectedValue = Convert.ToString(StoryItem.SubcategoryId);
                            SubCategoryList.DataBind();

                        }
                    }
                    
                }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            String Url = Request.Url.ToString();
            if (Url.Contains("AddCategory.aspx"))
            {
                CategoryItem = new Category {Name=NameText.Text,Description=DescriptionText.Text};
                Context.AddToCategories(CategoryItem);
                Context.SaveChanges();
                Response.Redirect("~/Admin/EditCategory.aspx?categoryId="+CategoryItem.CategoryId+"&Save=true", false);
            }
            else if (Url.Contains("AddSubCategory.aspx")) {
                int SelectedId=int.Parse(CategoryList.SelectedItem.Value);
                CategoryItem = (from row in Context.Categories where row.CategoryId == SelectedId select row).FirstOrDefault();
                subCategoryItem = new Subcategory { Name = NameText.Text, Description = DescriptionText.Text, CategoryId = SelectedId };
                if (CategoryItem.NumberOfSubcategories == null)
                {
                    CategoryItem.NumberOfSubcategories = 0;
                }
                CategoryItem.NumberOfSubcategories = CategoryItem.NumberOfSubcategories+1;
                Context.AddToSubcategories(subCategoryItem);
                Context.SaveChanges();
                Response.Redirect("~/Admin/EditSubCategory.aspx?SubcategoryId=" + subCategoryItem.SubcategoryId + "&Save=true", false);
            }
            else if (Url.Contains("AddStory.aspx"))
            {
                int SelectedId = int.Parse(SubCategoryList.SelectedItem.Value);
                subCategoryItem = (from row in Context.Subcategories where row.SubcategoryId == SelectedId select row).FirstOrDefault();
                StoryItem = new Story { Name = NameText.Text, Description = DescriptionText.Text, SubcategoryId = SelectedId };
                Context.AddToStories(StoryItem);
                Context.SaveChanges();
                Response.Redirect("~/Admin/EditStory.aspx?StoryId=" + StoryItem.StoryId, false);
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            String Url = Request.Url.ToString();

            if (Url.Contains("EditCategory.aspx"))
            {
                CategoryItem = (from row in Context.Categories where row.CategoryId == id select row).First();
                CategoryItem.Name = NameText.Text;
                CategoryItem.Description = DescriptionText.Text;
                Context.SaveChanges();
                Response.Redirect("~/Admin/EditCategory.aspx?categoryId=" + id + "&Save=true", false);
            }
            else if (Url.Contains("EditSubCategory.aspx"))
            {
                int SelectedId = int.Parse(CategoryList.SelectedItem.Value);
                CategoryItem = (from row in Context.Categories where row.CategoryId == SelectedId select row).FirstOrDefault();
                subCategoryItem = (from row in Context.Subcategories where row.SubcategoryId == id select row).First();
                subCategoryItem.Name = NameText.Text;
                subCategoryItem.Description = DescriptionText.Text;
                subCategoryItem.Category.NumberOfSubcategories = subCategoryItem.Category.NumberOfSubcategories - 1;
                subCategoryItem.CategoryId = SelectedId;
                if (CategoryItem.NumberOfSubcategories == null)
                {
                    CategoryItem.NumberOfSubcategories = 0;
                }
                CategoryItem.NumberOfSubcategories = CategoryItem.NumberOfSubcategories + 1;
                //Context.AddToSubcategories(subCategoryItem);
                Context.SaveChanges();
                Response.Redirect("~/Admin/EditSubCategory.aspx?SubcategoryId=" + subCategoryItem.SubcategoryId + "&Save=true", false);
            }
            else if (Url.Contains("EditStory.aspx"))
            {
                int SelectedId = int.Parse(SubCategoryList.SelectedItem.Value);
                StoryItem = (from row in Context.Stories where row.StoryId == id select row).First();
                StoryItem.Name = NameText.Text;
                StoryItem.Description = DescriptionText.Text;
                StoryItem.SubcategoryId = SelectedId;
                Context.SaveChanges();
                Response.Redirect("~/Admin/StoryList.aspx", false);
            }

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e){
            SubCategory.Visible = true;
            SubCategoryList.Visible = true;
            int catId = Int32.Parse(CategoryList.SelectedItem.Value);
            var AllSubCategoryItem = (from row in Context.Subcategories where row.CategoryId == catId select row);
            SubCategoryList.DataSource = AllSubCategoryItem;
            SubCategoryList.DataValueField = "SubcategoryId";
            SubCategoryList.DataTextField = "Name";
            SubCategoryList.DataBind();
        }
    }
}