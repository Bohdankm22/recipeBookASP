using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PagesParent : System.Web.UI.Page
{
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        HttpCookie myCookie = Request.Cookies["theme1"];
        if (myCookie != null)
        {
            this.Theme = myCookie.Value;
        } else
        {
            HttpCookie myNewCookie = new HttpCookie("theme1");
            myNewCookie.Value = "Dark";
            Response.Cookies.Add(myNewCookie);
        }
    }
}