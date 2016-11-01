using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Ingridient that required for recipe
/// </summary>
[Serializable] 
public class Ingredient
{
    public string Name { get; set; }
    public double Quantity { get; set; }
    public string UnitOfMeasure { get; set; }

    public Ingredient(string Name, double Quantity, string UnitOfMeasure)
    {
        this.Name = Name;
        this.Quantity = Quantity;
        this.UnitOfMeasure = UnitOfMeasure;
    }
}