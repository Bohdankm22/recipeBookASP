using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListOfIngr : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void IngredientButton_Click(object sender, EventArgs e)
    {
        if (LimitIngredients.IsValid)
        {
            //Ingredient ing = new Ingredient(IngrNameTextBox.Text, Double.Parse(QuantityTextBox.Text), UnitMeasureText.Text);
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
    }

}