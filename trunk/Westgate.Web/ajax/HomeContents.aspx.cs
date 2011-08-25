using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Web.Pages;
using Westgate.Data;
namespace Westgate.Web.ajax
{
    public partial class HomeContents : AJAXPage
    {
        IQueryable<Tag> tagItem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tagItem = from rowTag in DatabaseContext.Tags where rowTag.ShowInTabs select rowTag;
//				Label1.Text = tagItem.Count().ToString();
				CategoryRepeater.DataSource = tagItem;
                CategoryRepeater.DataBind();
            }
        }

        protected void CategoryRepeater_ItemCommand(object source, RepeaterItemEventArgs e)
        {

        }
    }
}