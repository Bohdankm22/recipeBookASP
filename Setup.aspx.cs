using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Setup : PagesParent
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Session["Theme"] = DarkTheme.Checked ? "Dark" : "Light";
        Server.Transfer(Request.FilePath);
    }
}