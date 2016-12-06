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

    protected void DataList1_EditCommand(object source,
    DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        DataList1.DataBind();
    }

    protected void DataList1_CancelCommand(object source,
        DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void DataList1_UpdateCommand(object source,
        DataListCommandEventArgs e)
    {
        SqlDataSource2.UpdateParameters["Ingredient_id"].DefaultValue = e.CommandArgument.ToString();
        SqlDataSource2.UpdateParameters["Ingredient_measure_unit"].DefaultValue = ((TextBox)e.Item.FindControl("Ingredient_measure_unitTextBox")).Text;
        SqlDataSource2.UpdateParameters["Ingredient_quantity"].DefaultValue = ((TextBox)e.Item.FindControl("Ingredient_quantityTextBox")).Text;
        SqlDataSource2.UpdateParameters["Ingredient_name"].DefaultValue = ((TextBox)e.Item.FindControl("Ingredient_nameTextBox")).Text;

        SqlDataSource2.Update();

        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void DtateList1_DeleteCommand(object source,
        DataListCommandEventArgs e)
    {
        SqlDataSource2.DeleteParameters["Ingredient_id"].DefaultValue = e.CommandArgument.ToString();
        SqlDataSource2.Delete();
        DataList1.DataBind();
    }

    protected void IngredientButton_Click(object sender, EventArgs e)
    {
            double k = 0;
            if (QuantityTextBox.Text != null && QuantityTextBox.Text != "")
            {
                k = Double.Parse(QuantityTextBox.Text);
            }
            Ingredient ing = new Ingredient(IngrNameTextBox.Text, k, UnitMeasureText.Text);

        SqlDataSource4.InsertParameters["Ingredient_name"].DefaultValue = IngrNameTextBox.Text;
        SqlDataSource4.InsertParameters["Ingredient_measure"].DefaultValue = UnitMeasureText.Text;
        SqlDataSource4.InsertParameters["Ingredieent_quantity"].DefaultValue = QuantityTextBox.Text;
        SqlDataSource4.Insert();

        IngrNameTextBox.Text = "";
        QuantityTextBox.Text = "";
        UnitMeasureText.Text = "";

        DataList1.DataBind();
    }
}