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
    public partial class OrderTags : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["end"] != null && Request["start"] != null)
            {
                int start = int.Parse(Request["start"]);
                int end = int.Parse(Request["end"]);
                UpdateTagsOrder(++start, ++end);
            }
        }

        public void UpdateTagsOrder(int startid, int endid)
        {
            bool isMovedDown = startid < endid ? true : false;
            int temp_start = startid < endid ? startid : endid;
            int temp_end = startid < endid ? endid : startid;

            var TagsList = (from tag in DatabaseContext.Tags
                            select tag);


            foreach (Westgate.Data.Tag tag in TagsList)
            {
                if (tag.OrderNumber == startid)
                {
                    tag.OrderNumber = endid;
                    continue;
                }
                if (isMovedDown)
                {
                    if (tag.OrderNumber > temp_start && tag.OrderNumber <= temp_end)
                        tag.OrderNumber--;
                }
                else
                {
                    if (tag.OrderNumber >= temp_start && tag.OrderNumber < temp_end)
                        tag.OrderNumber++;
                }
            }
            DatabaseContext.SaveChanges();
        }


    }
}