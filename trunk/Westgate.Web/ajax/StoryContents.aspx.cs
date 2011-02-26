using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;
using Westgate.Web.Pages;

namespace Westgate.Web.ajax
{
    public partial class StoryContents : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["StoryId"] != null)
            {
                int StoryId = int.Parse(Request["StoryId"]);
                Story Storycategory = (from c in DatabaseContext.Stories where c.StoryId == StoryId select c).FirstOrDefault();
                if (Storycategory != null)
                {
                    StorycategoryName.Text = Storycategory.Name;
                    StorycategoryDescription.Text = Storycategory.Description;
                }
            }
        }
    }
}