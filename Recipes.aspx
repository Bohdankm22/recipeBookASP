<%@ Page Title="Recipes List" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Recipes" %>
<%@ Register TagPrefix="rc" TagName="RecipeItem" Src="RecipeItem.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="recipe_id" DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped" PageSize="10" onrowcommand="gridViewRowCommand">
       
            <Columns>
                <asp:BoundField DataField="recipe_id" HeaderText="Recipe id" ReadOnly="True" SortExpression="recipe_id"/>
                <asp:ButtonField DataTextField="Recipe_name" CommandName="ShowDetailsView"  HeaderText="Name" SortExpression="Recipe_name" />
                <asp:BoundField DataField="Recipe_submited_by" HeaderText="Submited By" SortExpression="Recipe_submited_by" />
                <asp:BoundField DataField="Recipe_prep_time" HeaderText="Preparation Time" SortExpression="Recipe_prep_time" />
            </Columns>

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CookBookConnectionString %>" SelectCommand="select_all_recipes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
</asp:Content>

