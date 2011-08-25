using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Web.Pages;
namespace Westgate.Web.Admin
{
    public partial class Login : GenericPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (tbUserName.Text.Equals("admin") && tbPassword.Text.Equals("admin"))
            {
                Session[ParameterNames.Session.LOGGED_IS_USERID] = "1";
                Response.Redirect("~/Admin/TagsList.aspx");
            }
            else
            {
                lblError.Text = ParameterNames.Messages.Error.INVALID_LOGIN;
            }
        }
    }
}