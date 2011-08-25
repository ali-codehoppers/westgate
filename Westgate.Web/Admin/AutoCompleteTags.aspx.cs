using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using Westgate.Data;
using System.Text;

namespace Westgate.Web.Admin
{
    public partial class AutoCompleteTags : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var source = from t in DatabaseContext.Tags select t;
            StringBuilder sb = new StringBuilder();
            foreach (Tag tag in source)
            {
                sb.Append(tag.Name).Append("\n");
            }
            Response.Write(sb.ToString());
        }
    }
}