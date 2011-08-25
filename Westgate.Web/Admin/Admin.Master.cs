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
                TreeNode categoriesNode = new TreeNode("Tags");
                categoriesNode.NavigateUrl = "~/Admin/TagsList.aspx";
                categoriesNode.Expand();
                
                List<Tag> listTags = (from t in db.Tags orderby t.Name select t).ToList();
                foreach (Tag tag in listTags)
                {
                    TreeNode catNode = new TreeNode(tag.Name,tag.TagId.ToString());
                    catNode.NavigateUrl = "~/Admin/EditTag.aspx?tagId=" + tag.TagId;
                    catNode.CollapseAll();
                    categoriesNode.ChildNodes.Add(catNode);                    
                }
                
                tvStructure.Nodes.Add(categoriesNode);
                tvStructure.Nodes.Add(new TreeNode("Add New Image", "Add New Image", "", "~/Admin/AddImageNew.aspx", ""));
                tvStructure.Nodes.Add(new TreeNode("Gallery", "Gallery", "", "~/Admin/Gallery.aspx", ""));
            }
        }
    }
}