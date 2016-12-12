<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%-- (c) Author Bohdan Sharipov. All rights reserved --%>

<asp:Content id="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <table class="table">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Submited By:"/>
                </td>
                <td>
                    <asp:Label runat="server" Text="Category:"/>
                </td>
                <td>
                    <asp:Label runat="server" Text="Ingridient:"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Recipe_submited_by" DataValueField="Recipe_submited_by" CssClass="dropdown" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Text="All" Enabled="true" Selected="True" Value="%"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="recipe_category" DataValueField="recipe_category" CssClass="dropdown" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Text="All" Enabled="true" Selected="True" Value="%"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ingredient_name" DataValueField="Ingredient_name" CssClass="dropdown" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Text="All" Enabled="true" Selected="True" Value="%"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT distinct [Recipe_submited_by] FROM [recipe]"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT distinct [recipe_category] FROM [recipe]"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT distinct [Ingredient_name] FROM [ingredient]"></asp:SqlDataSource>

<%-- (c) Author Bohdan Sharipov. All rights reserved --%>

        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table table-hover table-striped" onrowcommand="gridViewRowCommand">
            <Columns>
                <asp:BoundField DataField="Recipe_id" HeaderText="Id" ItemStyle-Width="5%"></asp:BoundField>
                <asp:ButtonField DataTextField="Recipe_name" CommandName="ShowDetailsView" HeaderText="Name" ItemStyle-Width="20%"></asp:ButtonField>
                <asp:BoundField DataField="recipe_category" HeaderText="Category" ItemStyle-Width="30%" ></asp:BoundField>
                <asp:BoundField DataField="Recipe_submited_by" HeaderText="Submited By" ItemStyle-Width="15%" ></asp:BoundField>
                <asp:BoundField DataField="Recipe_prep_time" HeaderText="Preparation time" ItemStyle-Width="20%" ></asp:BoundField>
                <asp:BoundField DataField="Recipe_servings_number" HeaderText="Servings" ItemStyle-Width="10%" ></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="searchRecipes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="submited_by" Type="String"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="category" Type="String"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" Name="ingredient_name" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <asp:Button ID="generateJSON" runat="server" Text="Download JSON file" CssClass="btn-default" OnClick="generateJSON_Click" />

    <%-- (c) Author Bohdan Sharipov. All rights reserved --%>

</asp:Content>

