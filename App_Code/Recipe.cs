using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Recipe
/// </summary>
public class Recipe
{
    public string Name { get; set; }
    public string SubmitedBy { get; set; }
    public string Category { get; set; }
    public double PreparationTime { get; set; }
    public int ServingsNumber { get; set; }
    public string Description { get; set; }
    public List<Ingredient> IngredientsList { get; set; }

    public Recipe (string Name, string SubmitedBy, string Category, 
        double PreparationTime, int ServingsNumber, string Description,
        List<Ingredient> IngredientsList)
    {
        this.Name = Name;
        this.SubmitedBy = SubmitedBy;
        this.Category = Category;
        this.PreparationTime = PreparationTime;
        this.ServingsNumber = ServingsNumber;
        this.Description = Description;
        this.IngredientsList = IngredientsList;
    }
}