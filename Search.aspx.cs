using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * (c) Author: Bohdan Sharipov
 * All rights reserved.
 */
public partial class Search : PagesParent
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void gridViewRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ShowDetailsView")
        {
            GridView1.SelectRow(Convert.ToInt32(e.CommandArgument));
            GridViewRow gvr = GridView1.SelectedRow;
            string text = gvr.Cells[0].Text;
            Console.WriteLine("There is a method" + gvr.Cells[0].Text);
            Response.Redirect("RecipeDetails.aspx?RecipeId=" + gvr.Cells[0].Text);
        }
        Console.WriteLine("There is a method");
    }




    protected void generateJSON_Click(object sender, EventArgs e)
    {
        DataView view = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
        DataTable dt = view.ToTable();

        GridView GridView2 = new GridView();
        GridView2.AllowPaging = false;
        GridView2.DataSource = dt;
        GridView2.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition",
            "attachment;filename=DataTable.doc");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-word ";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView2.RenderControl(hw);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
}