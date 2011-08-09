using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;

namespace Westgate.Web.Admin
{
    public partial class EditStory : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Request["deleteId"] != null)
                {
                    int idImage = int.Parse(Request["deleteId"]);
                    var StoryImageItem = (from row in DatabaseContext.Images where row.ImageId == idImage select row).FirstOrDefault();
                    DatabaseContext.Images.DeleteObject(StoryImageItem);
                    DatabaseContext.SaveChanges();
                }
                if (Request["StoryId"] != null)
                {
                    int id = int.Parse(Request["StoryId"]);
                    Story StoryItem = (from row in DatabaseContext.Stories where row.StoryId == id select row).First();
                    NameText.Text = StoryItem.Name;
                    DescriptionText.Text = StoryItem.Description;
                    var StoryImageItem = (from row in DatabaseContext.Images where row.StoryId == id select row);
                    gvImages.DataSource = StoryImageItem;
                    gvImages.DataBind();
                }
            }

        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request["StoryId"]);
            Story StoryItem = (from row in DatabaseContext.Stories where row.StoryId == id select row).First();
            StoryItem.Name = NameText.Text;
            StoryItem.Description = DescriptionText.Text;
            DatabaseContext.SaveChanges();
            Response.Redirect("EditStory.aspx?save=true&StoryId=" + Request["StoryId"]);
        }
    }
}