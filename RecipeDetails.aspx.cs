using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

/*
 * (c) Author: Bohdan Sharipov
 * All rights reserved.
 */

public partial class RecipeDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            DataList1.Visible = false;
            Label1.Visible = true;
        }

        if (Request.QueryString["RecipeId"] == null)
        {
            Response.Redirect("Recipes.aspx");
        }
    }
}