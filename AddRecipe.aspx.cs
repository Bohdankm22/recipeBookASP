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
        double cookTime = 0.0;
        try
        {
            cookTime = Double.Parse(CookingTimeTextBox.Text);
        } catch (Exception)
        {}
        int numbOfServ = 0;
        try
        {
            numbOfServ = int.Parse(NumberOfServingsTextBox.Text);
        }
        catch (Exception)
        { }

        List<Recipe> list = ((List<Recipe>)Application["RecipesList"]);
        list.Add(new Recipe(RecipeNameTextBox.Text, SubmitedByTextBox.Text,
            CategoryTextBox.Text, cookTime, numbOfServ,
            RecipeDescriptionTextBox.Text, IngredientsList));
        Application["RecipesList"] = list;
        cleanForm();
    }

    public void cleanForm()
    {
        ListOfIngr1.Clean();
        RecipeNameTextBox.Text = "";
        SubmitedByTextBox.Text = "";
        CategoryTextBox.Text = "";
        CookingTimeTextBox.Text = "";
        NumberOfServingsTextBox.Text = "";
        RecipeDescriptionTextBox.Text = "";
    }

    public void resetButtonClick(object sender, EventArgs e)
    {
        cleanForm();   
    }
}