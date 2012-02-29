using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Data;

namespace Westgate.Web.ajax
{
    public partial class SiteMapContents : System.Web.UI.Page
    {
        WestgateEntities Context = new WestgateEntities();
        IQueryable<Westgate.Data.Tag> tagItem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tagItem = from rowCat in Context.Tags select rowCat;
                TagRepeater.DataSource = tagItem;
                TagRepeater.DataBind();
            }

        }
        protected void TagRepeater_ItemCommand(object source, RepeaterItemEventArgs e)
        {

        }
        //protected void StoryRepeater_ItemCommand(object source, RepeaterItemEventArgs e)
        //{
        //    Repeater rptHeader = (Repeater)e.Item.FindControl("storyRepeater");
        //    if (rptHeader != null)
        //    {
        //        Label catId = (Label)e.Item.FindControl("SubCatId");
        //        int id = int.Parse(catId.Text);
        //        storyItem = from row in Context.Stories where row.SubcategoryId == id select row;
        //        rptHeader.DataSource = storyItem;
        //        rptHeader.DataBind();
        //    }
        //}

    }
}