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
                <asp:TemplateField HeaderText="Name" SortExpression="Recipe_name">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Recipe_name") %>' ID="TextBox1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Recipe" ControlToValidate="TextBox1" ErrorMessage="Recipe name is required!" SetFocusOnError="True" Display="Dynamic" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Recipe_name") %>' ID="TextBox1"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Recipe_name") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

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
        
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-hover table-striped" ShowHeader="True" OnEditCommand="DataList1_EditCommand" OnCancelCommand="DataList1_CancelCommand" OnUpdateCommand="DataList1_UpdateCommand" OnDeleteCommand="DtateList1_DeleteCommand">
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
                         <td>
                             Update
                         </td>
                         <td>
                             Delete
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
                        <asp:Label Text='<%# Eval("Ingredient_name") %>' runat="server" ID="Ingredient_nameLabel" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Ingredient_quantity") %>' runat="server" ID="Ingredient_quantityLabel" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Ingredient_measure_unit") %>' runat="server" ID="Ingredient_measure_unitLabel" />
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="LinkButton1" CommandName="edit" >
                                Edit
                        </asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="LinkButton4" CommandName="delete" CommandArgument='<%# Eval("Ingredient_id") %>'>
                                Delete
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
                
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:TextBox Text='<%# Eval("Ingredient_name") %>' runat="server" ID="Ingredient_nameTextBox" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Eval("Ingredient_quantity") %>' runat="server" ID="Ingredient_quantityTextBox" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Eval("Ingredient_measure_unit") %>' runat="server" ID="Ingredient_measure_unitTextBox" />
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="update" CommandArgument='<%# Eval("Ingredient_id") %>'>
                            Save
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="cancel">                            
                            Cancel
                        </asp:LinkButton>
                    </td>
                    <td></td>
                </tr>
            </EditItemTemplate>

        </asp:DataList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="selectRecipeIngredients" SelectCommandType="StoredProcedure" DeleteCommand="delete from Ingredient_recipe where recipe_id=@recipe_id and ingredient_id=@Ingredient_id;" UpdateCommand="updateRecipeIngredient" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" DefaultValue="null" Name="recipe_id"></asp:QueryStringParameter>
                <asp:Parameter Name="Ingredient_id" Type="Int32" ConvertEmptyStringToNull="true"></asp:Parameter>
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" Name="recipe_id" DefaultValue="null"></asp:QueryStringParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" DefaultValue="null" Name="Recipe_Id"></asp:QueryStringParameter>
                <asp:Parameter Name="Ingredient_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Ingredient_measure_unit" Type="String"></asp:Parameter>
                <asp:Parameter Name="Ingredient_quantity" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="Ingredient_name" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>


    </div>
</asp:Content>

