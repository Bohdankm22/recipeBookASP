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
        List<Ingredient> IngredientsList = new List<Ingredient>();
        for (int i = 0; i < MyListBox.Items.Count; i++)
        {
            //IngredientsList.Add(new Ingredient());
        }
        ((List<Recipe>)Application["RecipesList"]).Add(new Recipe(RecipeNameTextBox.Text, SubmitedByTextBox.Text,
            CategoryTextBox.Text, Double.Parse(CookingTimeTextBox.Text), int.Parse(NumberOfServingsTextBox.Text), 
            RecipeDescriptionTextBox.Text, IngredientsList));
    }



    protected void IngredientButton_Click(object sender, EventArgs e)
    {
        if (LimitIngredients.IsValid)
        {
            Ingredient ing = new Ingredient(IngrNameTextBox.Text, Double.Parse(QuantityTextBox.Text), TextBox3.Text);
            MyListBox.Items.Add(String.Format("Ingredient {0}: {1} {2}{3}", MyListBox.Items.Count + 1, IngrNameTextBox.Text, QuantityTextBox.Text, TextBox3.Text));
            IngrNameTextBox.Text = "";
            QuantityTextBox.Text = "";
            TextBox3.Text = "";
        }
    }

    protected void LimitIngredients_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = MyListBox.Items.Count >= 15 ? false : true;
    }
}