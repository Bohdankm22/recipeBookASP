using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/*
 * (c) Author: Bohdan Sharipov
 * All rights reserved.
 */

public partial class AddRecipe : PagesParent
{

    protected void Page_Load(object sender, EventArgs e)
    {
        SubmitedByTextBox.Text = User.Identity.Name;
    }

    protected void RecipeSave(object sender, EventArgs e)
    {
        List<Ingredient> ingreList = ListOfIngr.getIngredientsList();

        string cs = ConfigurationManager.ConnectionStrings["CookBookConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("insertRecipe", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter retval = new SqlParameter("RetVal", SqlDbType.Int);
            retval.Direction = ParameterDirection.ReturnValue;
            
            cmd.Parameters.Add(new SqlParameter("@Recipe_name", RecipeNameTextBox.Text));
            cmd.Parameters.Add(new SqlParameter("@Recipe_submited_by", SubmitedByTextBox.Text));
            if (CookingTimeTextBox.Text != "" && CookingTimeTextBox.Text != null) {
                cmd.Parameters.Add(new SqlParameter("@Recipe_prep_time", Double.Parse(CookingTimeTextBox.Text)));
            } else
            {
                cmd.Parameters.Add(new SqlParameter("@Recipe_prep_time", DBNull.Value));
            }         
            cmd.Parameters.Add(new SqlParameter("@Recipe_servings_numb", int.Parse(NumberOfServingsTextBox.Text)));
            cmd.Parameters.Add(new SqlParameter("@Recipe_description", RecipeDescriptionTextBox.Text));
            if (CategoryTextBox.Text != "" && CategoryTextBox.Text != null)
            {
                cmd.Parameters.Add(new SqlParameter("@Recipe_category", CategoryTextBox.Text));
            } else
            {
                cmd.Parameters.Add(new SqlParameter("@Recipe_category", DBNull.Value));
            }
            
            cmd.Parameters.Add(retval);

            con.Open();
            cmd.ExecuteNonQuery();
            int recipeId = (int) retval.Value;

            for (int i = 0; i < ingreList.Count; i++)
            {
                Ingredient ingred = ingreList[i];
                SqlCommand ingredientSave = new SqlCommand("insert_ingredient", con);
                ingredientSave.CommandType = CommandType.StoredProcedure;
                ingredientSave.Parameters.Add(new SqlParameter("@Recipe_id", recipeId));
                ingredientSave.Parameters.Add(new SqlParameter("@Ingredient_name", ingred.Name));
                if (ingred.UnitOfMeasure != "" && ingred.UnitOfMeasure != null)
                {
                    ingredientSave.Parameters.Add(new SqlParameter("@Ingredient_measure", ingred.UnitOfMeasure));
                } else
                {
                    ingredientSave.Parameters.Add(new SqlParameter("@Ingredient_measure", DBNull.Value));
                }       
                ingredientSave.Parameters.Add(new SqlParameter("@Ingredieent_quantity", ingred.Quantity));
                ingredientSave.ExecuteNonQuery();
            }
            con.Close();
        }
        ListOfIngr1.Clean();
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