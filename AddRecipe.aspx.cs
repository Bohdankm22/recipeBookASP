using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRecipe : System.Web.UI.Page
{
    protected List<Ingredient> IngredientsList = new List<Ingredient>();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void RecipeSave(object sender, EventArgs e)
    {
        
    }



    protected void IngredientButton_Click(object sender, EventArgs e)
    {
        MyListBox.Items.Add(String.Format("Ingredient {0}: {1} {2}{3}", MyListBox.Items.Count + 1, IngrNameTextBox.Text, QuantityTextBox.Text, TextBox3.Text));
        IngrNameTextBox.Text = "";
        QuantityTextBox.Text = "";
        TextBox3.Text = "";
    }
    
}