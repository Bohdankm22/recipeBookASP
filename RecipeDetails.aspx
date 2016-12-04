﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecipeDetails.aspx.cs" Inherits="RecipeDetails" %>

<%-- (c) Author Bohdan Sharipov. All rights reserved --%>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h2><%: Title %></h2>

        <a href="Recipes.aspx" class="label label-info">&#8592; Back to Recipes Page&nbsp;&nbsp;&nbsp;</a>
        <asp:Label ID="Label1" runat="server" Text="Successfully Deleted" CssClass="label label-success" Visible="false"></asp:Label>
      
<%-- (c) Author Bohdan Sharipov. All rights reserved --%>
  

        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" CssClass="table table-hover" AutoGenerateRows="False" DataKeyNames="recipe_id" AutoGenerateDeleteButton="True">
            <Fields>
                <asp:BoundField DataField="Recipe_id" HeaderText="Id" ReadOnly="True" SortExpression="Recipe_id"></asp:BoundField>
                <asp:BoundField DataField="Recipe_name" HeaderText="Name" SortExpression="Recipe_name" />
                <asp:BoundField DataField="Recipe_submited_by" HeaderText="Submited By" SortExpression="Recipe_submited_by" ReadOnly="True" />
                <asp:BoundField DataField="recipe_category" HeaderText="Category" SortExpression="recipe_category" />
                <asp:BoundField DataField="Recipe_prep_time" HeaderText="Preparation time" SortExpression="Recipe_prep_time" />
                <asp:BoundField DataField="Recipe_servings_number" HeaderText="Servings" SortExpression="Recipe_servings_number" />
                <asp:BoundField DataField="Recipe_description" HeaderText="Description" SortExpression="Recipe_description"></asp:BoundField>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>                
            </Fields>     
        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="selectRecipeDetails" SelectCommandType="StoredProcedure" DeleteCommand="deleteRecipe" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="recipe_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" DefaultValue="0" Name="recipe_id" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-hover table-striped" ShowHeader="True">
            <HeaderTemplate>
                 <table class="table-bordered">
                     <thead>
                         <td>
                             Ingredient name
                         </td>
                         <td>
                             Ingredient quantity
                         </td>
                         <td>
                             Unit of measure
                         </td>
                     </thead>
            </HeaderTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            
<%-- (c) Author Bohdan Sharipov. All rights reserved --%>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label Text='<%# Eval("Ingredient_name") %>' runat="server" ID="Ingredient_nameLabel" /><br />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Ingredient_quantity") %>' runat="server" ID="Ingredient_quantityLabel" /><br />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Ingredient_measure_unit") %>' runat="server" ID="Ingredient_measure_unitLabel" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="selectRecipeIngredients" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" Name="recipe_id" DefaultValue="null"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>


    </div>
</asp:Content>

