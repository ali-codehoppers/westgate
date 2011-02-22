using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Westgate.Data;
    
namespace Westgate.Web.Pages
{
    public class AuthenticatedPage : GenericPage
    {
        protected override void OnLoad(EventArgs e)
        {
            if (Session[ParameterNames.Session.LOGGED_IS_USERID] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
            else
            {
                base.OnLoad(e);
            }
        }
    }
}