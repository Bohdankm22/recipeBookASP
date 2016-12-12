using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * (c) Author: Bohdan Sharipov
 * All rights reserved.
 */

public partial class Setup : PagesParent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        HttpCookie myNewCookie = new HttpCookie("theme1");
        myNewCookie.Value = DarkTheme.Checked ? "Dark" : "Light";
        Response.Cookies.Remove("theme1");
        Response.Cookies.Add(myNewCookie);
        Response.Redirect("~/Setup.aspx");
    }
}
