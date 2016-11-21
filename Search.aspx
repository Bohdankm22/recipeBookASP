<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content id="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <br />
        <asp:Label runat="server" Text="Submited By"/>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Recipe_submited_by" DataValueField="Recipe_submited_by" CssClass="dropdown"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT [Recipe_submited_by] FROM [recipe]"></asp:SqlDataSource>
        

        <asp:Label runat="server" Text="Category"/>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="recipe_category" DataValueField="recipe_category" CssClass="dropdown"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT distinct [recipe_category] FROM [recipe]"></asp:SqlDataSource>
    

        <asp:Label runat="server" Text="Ingridient"/>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ingredient_name" DataValueField="Ingredient_name" CssClass="dropdown"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT [Ingredient_name] FROM [ingredient]"></asp:SqlDataSource>
    
        
    
    
   
    
    
    
    
    </div>
</asp:Content>