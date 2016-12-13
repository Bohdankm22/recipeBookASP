<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PickRecipe.aspx.cs" Inherits="PickRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="jumbotron">
        <br />
        <h2 class="modal-title">Pick Recipe</h2>
        <br />

        <%-- (c) Author Bohdan Sharipov. All rights reserved --%>


        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="917px" DataSourceID="SqlDataSource1" CssClass="table table-hover" AutoGenerateRows="False" DataKeyNames="recipe_id">
            <Fields>
                <asp:BoundField DataField="Recipe_id" HeaderText="Recipe_id" SortExpression="Recipe_id"></asp:BoundField>
                <asp:BoundField DataField="Recipe_name" HeaderText="Recipe_name" SortExpression="Recipe_name"></asp:BoundField>
                <asp:BoundField DataField="Recipe_submited_by" HeaderText="Recipe_submited_by" SortExpression="Recipe_submited_by"></asp:BoundField>
                <asp:BoundField DataField="recipe_category" HeaderText="recipe_category" SortExpression="recipe_category" />
                <asp:BoundField DataField="Recipe_prep_time" HeaderText="Recipe_prep_time" SortExpression="Recipe_prep_time" />
                <asp:BoundField DataField="Recipe_servings_number" HeaderText="Recipe_servings_number" SortExpression="Recipe_servings_number" />
                <asp:BoundField DataField="Recipe_description" HeaderText="Recipe_description" SortExpression="Recipe_description" />
            </Fields>

        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="pickRecipeDetails" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <asp:Button ID="Btn2" runat="server" Text="Generate another" CssClass="btn btn-info" OnClick="Btn2_Click" />
        <asp:Button ID="btn1" runat="server" Text="Go to details" CssClass="btn btn-success" OnClick="btn1_Click" />
        
    </div>
</asp:Content>

