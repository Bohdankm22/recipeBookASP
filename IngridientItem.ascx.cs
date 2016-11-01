using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IngridientItem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SetIDs(string name, string text1, string quantity, string text2, string label3, string text3)
    {
        IngrNameLabel.ID = name;
        IngrNameTextBox.ID = text1;
        QuantityLabel.ID = quantity;
        QuantityTextBox.ID = text2;
        Label3.ID = label3;
        TextBox3.ID = text3;
    }

}