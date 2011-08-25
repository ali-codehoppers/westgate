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
    public partial class Images : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageType = Request["pageType"].ToUpper();
            if (pageType.Equals("HOME"))
            {
                rptImages.DataSource = (from i in DatabaseContext.Images orderby i.ImageId descending select i).Take(10);
            }

			if (pageType.Equals("TAG"))
            {
				int tagId = int.Parse(Request["tagId"]);

				Tag tag = (from t in DatabaseContext.Tags
						   where t.TagId == tagId
						   select t).FirstOrDefault();

                var tagImages = (from imgTag in DatabaseContext.ImageTags
                                 where imgTag.Tag.TagId == tagId
                                 orderby imgTag.OrderNumber
                                 select imgTag.Image );
				rptImages.DataSource = tagImages;
            }


            rptImages.DataBind();
        }
    }
}