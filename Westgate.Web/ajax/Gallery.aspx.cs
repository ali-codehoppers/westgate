using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;
using System.Web.UI.HtmlControls;

namespace Westgate.Web.ajax
{
    public partial class Gallery : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
//                TreeNode categoriesNode = new TreeNode("All");
////                categoriesNode.NavigateUrl = "~/Gallery.aspx";
//                categoriesNode.Expand();
//                List<Tag> listTags = (from t in DatabaseContext.Tags orderby t.Name select t).ToList();
//                foreach (Tag tag in listTags)
//                {
//                    TreeNode catNode = new TreeNode(tag.Name, tag.TagId.ToString());
// //                   catNode.NavigateUrl = "~/Gallery.aspx?tagId=" + tag.TagId;
//                    catNode.CollapseAll();
//                    categoriesNode.ChildNodes.Add(catNode);

//                }

//                tvStructure.Nodes.Add(categoriesNode);


//                tvStructure.SelectedNode= Selecte

                if (Request["tagId"] != null)
                {
                    int tagId = int.Parse(Request["tagId"]);
                    SetGallery(tagId);
                }
                else
                {
                    SetGallery();
                }


            }



        }

        protected void tvStructure_SelectedNodeChanged(object sender, EventArgs e)
        {
            int tagId = -1;
            try
            {
              //  tagId = int.Parse(tvStructure.SelectedNode.Value.ToString());
                SetGallery(tagId);
            }
            catch (Exception ex)
            {
                SetGallery();
            }
        }


        private void SetGallery()
        {
            var tagImages = (from Image in DatabaseContext.Images
                             orderby Image.OrderImage
                             select Image);
            Repeater1.DataSource = tagImages;
            Label1.Text = tagImages.Count().ToString();
            Repeater1.DataBind();

        }

        private void SetGallery(int tagId)
        {
            if (tagId > 0)
            {
                Tag tag = (from t in DatabaseContext.Tags
                           where t.TagId == tagId
                           select t).FirstOrDefault();

                var tagImages = (from imgTag in DatabaseContext.ImageTags
                                 where imgTag.Tag.TagId == tag.TagId
                                 orderby imgTag.OrderNumber
                                 select imgTag.Image);

                Repeater1.DataSource = tagImages;
                Repeater1.DataBind();
                Label1.Text = tagImages.Count().ToString();

            }
            else
                SetGallery();

        }

    }
}