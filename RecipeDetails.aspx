﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecipeDetails.aspx.cs" Inherits="RecipeDetails" %>

<%-- (c) Author Bohdan Sharipov. All rights reserved --%>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h2><%: Title %></h2>

        <a href="Recipes.aspx" class="label label-info">&#8592; Back to Recipes Page&nbsp;&nbsp;&nbsp;</a>
        <asp:Label ID="Label1" runat="server" Text="Successfully Deleted" CssClass="label label-success" Visible="false"></asp:Label>
        <br />
        <br />
      
<%-- (c) Author Bohdan Sharipov. All rights reserved --%>
  

        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="917px" DataSourceID="SqlDataSource1" CssClass="table table-hover" AutoGenerateRows="False" DataKeyNames="recipe_id" AutoGenerateDeleteButton="True" OnItemDeleted="afterDeleting">
            <Fields>
                <asp:BoundField DataField="Recipe_name" HeaderText="Name" SortExpression="Recipe_name"></asp:BoundField>
                <asp:BoundField DataField="Recipe_submited_by" HeaderText="Submited by" SortExpression="Recipe_submited_by" ReadOnly="True" />
                <asp:BoundField DataField="Recipe_prep_time" HeaderText="Preparation time" SortExpression="Recipe_prep_time" />
                <asp:BoundField DataField="Recipe_servings_number" HeaderText="Servings number" SortExpression="Recipe_servings_number" />
                <asp:BoundField DataField="Recipe_description" HeaderText="Description" SortExpression="Recipe_description" />
                              
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <asp:Label ID="label1" runat="server" Text='<%# Bind("recipe_category") %>'  />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataField="Recipe_category" DataSourceID="SqlDataSource3" DataTextField="recipe_category" DataValueField="recipe_category" SelectedValue='<%# Bind("recipe_category") %>' AppendDataBoundItems="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CookBookConnectionString %>" SelectCommand="SELECT distinct [recipe_category] FROM [recipe]"></asp:SqlDataSource>                   
                        <br />
                        <asp:Label runat="server" Text="Add category"></asp:Label>
                        <asp:TextBox ID="categoryTextBox" runat="server"></asp:TextBox>
                        <asp:Button ID="categoryButton" runat="server" text="Add" OnClick="Unnamed3_Click"/>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
            </Fields>     
            
        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="selectRecipeDetails" SelectCommandType="StoredProcedure" DeleteCommand="deleteRecipe" DeleteCommandType="StoredProcedure" UpdateCommand="update_recipe" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="recipe_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" Name="recipe_id" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Recipe_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Recipe_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Recipe_prep_time" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="Recipe_servings_number" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Recipe_category" Type="String"></asp:Parameter>
                <asp:Parameter Name="Recipe_description" Type="String"></asp:Parameter>
            </UpdateParameters>
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

