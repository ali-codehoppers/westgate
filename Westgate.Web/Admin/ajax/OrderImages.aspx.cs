using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;
using System.Text;

namespace Westgate.Web.Admin.ajax
{
    public partial class OrderImages : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Tag tag = null;
            if (Request["TagId"] != null && Request["end"] != null && Request["start"] != null)
            {
                int id = int.Parse(Request["TagId"]);
                tag = (from row in DatabaseContext.Tags
                           where row.TagId == id
                           select row).First();

                int start = int.Parse(Request["start"]);
                int end = int.Parse(Request["end"]);
                UpdateImagesOrder(tag, ++start, ++end);
            }
        }


        public void UpdateImagesOrder(Tag tag, int startid, int endid)
        {
            bool isMovedDown = startid < endid ? true : false;
            int temp_start = startid < endid ? startid : endid;
            int temp_end = startid < endid ? endid : startid;

            var imageTagList = (from imgTag in DatabaseContext.ImageTags
                            where imgTag.Tag.TagId == tag.TagId
                            orderby imgTag.OrderNumber
                            select imgTag);

            foreach (Westgate.Data.ImageTag imgTag in imageTagList)
            {
                if (imgTag.OrderNumber == startid)
                {
                    imgTag.OrderNumber = endid;
                    continue;
                }
                if (isMovedDown)
                {
                    if (imgTag.OrderNumber > temp_start && imgTag.OrderNumber <= temp_end)
                        imgTag.OrderNumber--;
                }
                else
                {
                    if (imgTag.OrderNumber >= temp_start && imgTag.OrderNumber < temp_end)
                        imgTag.OrderNumber++;
                }
            }
            DatabaseContext.SaveChanges();
        }


    }
}