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

public partial class ListOfIngr : System.Web.UI.UserControl
{
    public static List<Ingredient> ingridientsList = new List<Ingredient>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ingridientsList.Clear();
        }        
    }

    protected void IngredientButton_Click(object sender, EventArgs e)
    {
        if (LimitIngredients.IsValid)
        {
            double k = 0;
            if (QuantityTextBox.Text != null && QuantityTextBox.Text != "")
            {
                k = Double.Parse(QuantityTextBox.Text);
            }
            Ingredient ing = new Ingredient(IngrNameTextBox.Text, k, UnitMeasureText.Text);
            ingridientsList.Add(ing);

            MyListBox.Items.Add(String.Format("Ingredient {0}: {1} {2}{3}", MyListBox.Items.Count + 1, IngrNameTextBox.Text, QuantityTextBox.Text, UnitMeasureText.Text));
            IngrNameTextBox.Text = "";
            QuantityTextBox.Text = "";
            UnitMeasureText.Text = "";
        }
    }

    protected void LimitIngredients_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = MyListBox.Items.Count >= 15 ? false : true;
    }

    public void Clean()
    {
        MyListBox.Items.Clear();
        MyListBox.DataBind();
        ingridientsList.Clear();
    }

    public static List<Ingredient> getIngredientsList()
    {
        return ingridientsList;
    }

}