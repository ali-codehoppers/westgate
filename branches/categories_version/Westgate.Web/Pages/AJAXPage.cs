using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Westgate.Web.Pages
{
    public class AJAXPage : GenericPage
    {
        protected override void OnLoad(EventArgs e)
        {
            Response.Expires = -1;
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
            base.OnLoad(e);
        }
    }
}