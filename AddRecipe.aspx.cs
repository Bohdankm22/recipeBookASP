using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * (c) Author: Bohdan Sharipov
 * All rights reserved.
 */

public partial class AddRecipe : PagesParent
{
    protected List<Ingredient> IngredientsList = new List<Ingredient>();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void RecipeSave(object sender, EventArgs e)
    {
        //List<Ingredient> IngredientsList = new List<Ingredient>();
        //double cookTime = 0.0;
        //try
        //{
        //    cookTime = Double.Parse(CookingTimeTextBox.Text);
        //} catch (Exception)
        //{}
        //int numbOfServ = 0;
        //try
        //{
        //    numbOfServ = int.Parse(NumberOfServingsTextBox.Text);
        //}
        //catch (Exception)
        //{ }

        //List<Recipe> list = ((List<Recipe>)Application["RecipesList"]);
        //list.Add(new Recipe(RecipeNameTextBox.Text, SubmitedByTextBox.Text,
        //    CategoryTextBox.Text, cookTime, numbOfServ,
        //    RecipeDescriptionTextBox.Text, IngredientsList));
        //Application["RecipesList"] = list;

        string cs = ConfigurationManager.ConnectionStrings["CookBookConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("insertRecipe", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.Add(new SqlParameter("@Recipe_name", RecipeNameTextBox.Text));
            cmd.Parameters.Add(new SqlParameter("@Recipe_submited_by", SubmitedByTextBox.Text));
            cmd.Parameters.Add(new SqlParameter("@Recipe_prep_time", Double.Parse(CookingTimeTextBox.Text)));
            cmd.Parameters.Add(new SqlParameter("@Recipe_servings_numb", int.Parse(NumberOfServingsTextBox.Text)));
            cmd.Parameters.Add(new SqlParameter("@Recipe_description", RecipeDescriptionTextBox.Text));
            cmd.Parameters.Add(new SqlParameter("@Recipe_category", CategoryTextBox.Text));
      
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

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