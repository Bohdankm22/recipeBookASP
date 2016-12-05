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
        if (Request.QueryString["RecipeId"] == null)
        {
            Response.Redirect("Recipes.aspx");
        }

        if (IsPostBack)
        {
            DataList1.DataBind();
        }

        
    }

    protected void afterDeleting(object sender, EventArgs e)
    {
        Response.Redirect("Recipes.aspx");
    }

    protected void Unnamed3_Click(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)DetailsView1.Rows[5].Cells[1].FindControl("DropDownList1");
        TextBox tb = (TextBox)DetailsView1.Rows[5].Cells[1].FindControl("categoryTextBox"); 
        String text = tb.Text;
        tb.Text = "";
        ddl.Items.Add(new ListItem(text, text));
        ddl.SelectedValue = text;
    }
}