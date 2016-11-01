using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRecipe : PagesParent
{
    protected List<Ingredient> IngredientsList = new List<Ingredient>();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void RecipeSave(object sender, EventArgs e)
    {
        List<Ingredient> IngredientsList = new List<Ingredient>();
        //for (int i = 0; i < ListOfIngr1.MyListBox.Items.Count; i++)
        //{
        //    //IngredientsList.Add(new Ingredient());
        //}
        ((List<Recipe>)Application["RecipesList"]).Add(new Recipe(RecipeNameTextBox.Text, SubmitedByTextBox.Text,
            CategoryTextBox.Text, Double.Parse(CookingTimeTextBox.Text), int.Parse(NumberOfServingsTextBox.Text), 
            RecipeDescriptionTextBox.Text, IngredientsList));
    }

    public void resetButtonClick(object sender, EventArgs e)
    {
        //ListOfIngr1.Clean();
    }
}