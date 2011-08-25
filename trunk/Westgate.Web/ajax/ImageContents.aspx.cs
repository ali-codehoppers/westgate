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
    public partial class ImageContents : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageType = Request["pageType"].ToUpper();
            if (pageType.Equals("HOME"))
            {
				var homeImages = from i in DatabaseContext.Images
								 where i.OrderImage != null
								 orderby i.OrderImage
								 select i;
				if (homeImages.Count() == 0)
            {
					homeImages = (from i in DatabaseContext.Images
								  orderby i.ImageId descending
								  select i);
            }
				rptImages.DataSource = homeImages;
            }

			if (pageType.Equals("TAG"))
            {
				int tagId = int.Parse(Request["tagId"]);

				Tag tag = (from t in DatabaseContext.Tags
						   where t.TagId == tagId
						   select t).FirstOrDefault();

                var tagImages = (from imgTag in DatabaseContext.ImageTags
                                 where imgTag.Tag.TagId == tag.TagId
                                 orderby imgTag.OrderNumber
                                  select imgTag.Image);

				//var tagImages = (from i in DatabaseContext.Images
				//                  where i.Tags.Contains(tag) == true
				//                 orderby i.ImageId descending
				//                  select i);

				rptImages.DataSource = tagImages;
            }



            rptImages.DataBind();
        }
    }
}