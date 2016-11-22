<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content id="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>

        <asp:Label runat="server" Text="Submited By"/>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Recipe_submited_by" DataValueField="Recipe_submited_by" CssClass="dropdown" AppendDataBoundItems="True" AutoPostBack="True">
            <asp:ListItem Text="All" Enabled="true" Selected="True" Value="%"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT [Recipe_submited_by] FROM [recipe]"></asp:SqlDataSource>
        

        <asp:Label runat="server" Text="Category"/>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="recipe_category" DataValueField="recipe_category" CssClass="dropdown" AppendDataBoundItems="True" AutoPostBack="True">
            <asp:ListItem Text="All" Enabled="true" Selected="True" Value="%"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT distinct [recipe_category] FROM [recipe]"></asp:SqlDataSource>
    

        <asp:Label runat="server" Text="Ingridient"/>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ingredient_name" DataValueField="Ingredient_name" CssClass="dropdown" AppendDataBoundItems="True" AutoPostBack="True">
            <asp:ListItem Text="All" Enabled="true" Selected="True" Value="%"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:CookBookConnectionString %>' SelectCommand="SELECT [Ingredient_name] FROM [ingredient]"></asp:SqlDataSource>

        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table-bordered" onrowcommand="gridViewRowCommand">
            <Columns>
                <asp:BoundField DataField="Recipe_id" HeaderText="Id" ItemStyle-Width="5%"></asp:BoundField>
                <asp:BoundField DataField="Recipe_name" HeaderText="Name" ItemStyle-Width="20%"></asp:BoundField>
                <asp:BoundField DataField="recipe_category" HeaderText="Category" ItemStyle-Width="30%" ></asp:BoundField>
                <asp:BoundField DataField="Recipe_submited_by" HeaderText="Submited By" ItemStyle-Width="15%" ></asp:BoundField>
                <asp:BoundField DataField="Recipe_prep_time" HeaderText="Preparation time" ItemStyle-Width="20%" ></asp:BoundField>
                <asp:BoundField DataField="Recipe_servings_number" HeaderText="Servings" ItemStyle-Width="10%" ></asp:BoundField>

                <asp:ButtonField CommandName="ShowDetailsView" Text="Details" ></asp:ButtonField>
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
</asp:Content>