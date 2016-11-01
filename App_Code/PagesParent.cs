using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PagesParent : System.Web.UI.Page
{
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if (Session["Theme"] != null)
        {
            this.Page.Theme = (string)Session["Theme"];
        }
    }
}