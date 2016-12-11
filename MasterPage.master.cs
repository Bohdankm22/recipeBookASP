using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * (c) Author: Bohdan Sharipov
 * All rights reserved.
 */

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void singOutBtn_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
    }
}
