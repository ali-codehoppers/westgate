using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;
using System.Net.Mail;
using WestGate.Web.Utilities;

namespace Westgate.Web.Master
{
    public partial class GalleryMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WestgateEntities DatabaseContext = new WestgateEntities();
            Repeater1.DataSource = (from row in DatabaseContext.Tags where row.ShowInTabs orderby row.OrderNumber select row).Take(7);
            Repeater1.DataBind();

            if (IsPostBack == false)
            {
                TreeNode categoriesNode = new TreeNode("All");
                categoriesNode.NavigateUrl = "~/Gallery.aspx";
                categoriesNode.Expand();

                List<Tag> listTags = (from t in DatabaseContext.Tags orderby t.Name select t).ToList();
                foreach (Tag tag in listTags)
                {
                    TreeNode catNode = new TreeNode(tag.Name, tag.TagId.ToString());
                    catNode.NavigateUrl = "~/Gallery.aspx?tagId=" + tag.TagId;
                    catNode.CollapseAll();
                    categoriesNode.ChildNodes.Add(catNode);
                }

                tvStructure.Nodes.Add(categoriesNode);
            }

        }
    }
}