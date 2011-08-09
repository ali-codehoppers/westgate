using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Data;
namespace Westgate.Web.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WestgateEntities db = new WestgateEntities();
            if (IsPostBack == false)
            {
                TreeNode categoriesNode = new TreeNode("Categories");
                categoriesNode.NavigateUrl = "~/Admin/CategoriesList.aspx";
                categoriesNode.Expand();
                
                List<Category> categories = (from c in db.Categories orderby c.Name select c).ToList();
                foreach (Category category in categories)
                {
                    TreeNode catNode = new TreeNode(category.Name,category.CategoryId.ToString());
                    catNode.NavigateUrl = "~/Admin/EditCategory.aspx?categoryId=" + category.CategoryId;
                    foreach (Subcategory subcategory in category.Subcategories)
                    {
                        TreeNode subcatNode = new TreeNode(subcategory.Name,subcategory.SubcategoryId.ToString());
                        subcatNode.NavigateUrl = "~/Admin/EditSubCategory.aspx?subCategoryId=" + subcategory.SubcategoryId;
                        foreach (Story story in subcategory.Stories)
                        {
                            TreeNode storyNode = new TreeNode(story.Name + "   [" + story.Images.Count + "]",story.StoryId.ToString());
                            storyNode.NavigateUrl = "~/Admin/EditStory.aspx?storyId=" + story.StoryId;
                            subcatNode.ChildNodes.Add(storyNode);
                        }
                        catNode.ChildNodes.Add(subcatNode);
                    }
                    catNode.CollapseAll();
                    categoriesNode.ChildNodes.Add(catNode);                    
                }
                
                tvStructure.Nodes.Add(categoriesNode);
                tvStructure.Nodes.Add(new TreeNode("Manage Home Page", "Manage Home Page", "", "~/Admin/HomeImages.aspx", ""));
            }
            string subcategoryId = Request["subcategoryId"];
            string storyId = Request["storyId"];
            if(storyId != null)
            {
                int storyIdInt = int.Parse(storyId);
                Story story = (from s in db.Stories where s.StoryId == storyIdInt select s).FirstOrDefault();
                if(story != null)
                {
                    subcategoryId = story.SubcategoryId.ToString();
                }
            }
            if(subcategoryId != null)
            {
                foreach (TreeNode catNode in tvStructure.Nodes[0].ChildNodes)
                {
                    foreach (TreeNode subcatNode in catNode.ChildNodes)
                    {
                        if (subcatNode.Value == subcategoryId)
                        {
                            catNode.Expand();
                            if (storyId != null)
                            {
                                foreach (TreeNode storyNode in subcatNode.ChildNodes)
                                {
                                    if (storyNode.Value == storyId)
                                    {
                                        subcatNode.Expand();
                                        break;
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
            }
        }
    }
}