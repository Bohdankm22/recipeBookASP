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
    public string Description { get; set; }

    public Recipe(string name, string description)
    {
        Name = name;
        Description = description;
    }
}