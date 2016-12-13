using System;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class Login : PagesParent
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (FormsAuthentication.Authenticate(Login1.UserName, Login1.Password)) {
           FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
        }
    }
}