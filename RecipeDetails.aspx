<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecipeDetails.aspx.cs" Inherits="RecipeDetails" %>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h2><%: Title %></h2>

        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" CssClass="table"></asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="selectRecipeDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="RecipeId" DefaultValue="null" Name="recipe_id" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
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

