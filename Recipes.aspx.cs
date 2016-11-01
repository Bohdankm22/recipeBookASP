using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recipes : PagesParent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListView1.DataSource = Application["RecipesList"];
        ListView1.DataBind();
    }
}