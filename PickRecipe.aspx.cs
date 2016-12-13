using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PickRecipe : PagesParent
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //  SqlDataSource1.SelectParameters["recipe_id"].DefaultValue = "1";
    }




    protected void btn1_Click(object sender, EventArgs e)
    {
        int recipeId = Int32.Parse(DetailsView1.Rows[0].Cells[1].Text);
        Response.Redirect("RecipeDetails.aspx?RecipeId=" + recipeId);
    }

    protected void Btn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pickrecipe.aspx");
    }
}