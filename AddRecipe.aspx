<%@ Page Title="Add your Recipe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <br />
        <div style="width: 800px">
            <p>
                <asp:Label ID="RecipeNameLabel" runat="server" Text="Recipe Name"></asp:Label>
                <asp:TextBox ID="RecipeNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RecipeNameTextBox" ErrorMessage="Recipe name is required!" SetFocusOnError="True" Display="Dynamic" />
            </p>
            <p>
                <asp:Label ID="SubmitedByLabel" runat="server" Text="Submited By"></asp:Label>
                <asp:TextBox ID="SubmitedByTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please fill Submited By field" ControlToValidate="SubmitedByTextBox" SetFocusOnError="True" Display="Dynamic" />
            </p>
            <p>
                <asp:Label ID="CategoryLabel" runat="server" Text="Category"></asp:Label>
                <asp:TextBox ID="CategoryTextBox" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="CookingTimeLabel" runat="server" Text="Prepare/Cooking Time"></asp:Label>
                <asp:TextBox ID="CookingTimeTextBox" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="NumberOfServingsLabel" runat="server" Text="Number of Servings"></asp:Label>
                <asp:TextBox ID="NumberOfServingsTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Number of Servings is required" ControlToValidate="NumberOfServingsTextBox" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>

            <p>
                <asp:Label ID="RecipeDescriptionLabel" runat="server" Text="Recipe Description"></asp:Label>
                <asp:TextBox ID="RecipeDescriptionTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please fill the Description" ControlToValidate="RecipeDescriptionTextBox" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>

            <p>
                Ingredients:
                <asp:ListBox ID="MyListBox" runat="server"></asp:ListBox>
            </p>

            <asp:Panel ID="MyPanel" runat="server" GroupingText="Add ingredient" BorderColor="Black" BorderWidth="2">
                <p>
                    <asp:Label ID="IngrNameLabel" runat="server" Text="Ingredient Name"></asp:Label>
                    <asp:TextBox ID="IngrNameTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingredient Name is required!" ControlToValidate="IngrNameTextBox" ValidationGroup="Ingred"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <asp:Label ID="QuantityLabel" runat="server" Text="Quantity"></asp:Label>
                    <asp:TextBox ID="QuantityTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="QuantityTextBox" ValidationExpression="[0-9]*\.?[0-9]+" ValidationGroup="Ingred"></asp:RegularExpressionValidator>
                </p>
                <p>
                    <asp:Label ID="Label3" runat="server" Text="Units of measure"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="IngredientButton" runat="server" ValidationGroup="Ingred" OnClick="IngredientButton_Click" Text="Add"/>
                    <asp:CustomValidator ID="LimitIngredients" runat="server" ControlToValidate="IngrNameTextBox" ErrorMessage="You can only add 15 ingredients" ValidationGroup="Ingred" OnServerValidate="LimitIngredients_ServerValidate"></asp:CustomValidator>
                </p>
            </asp:Panel>

            <p>
                <asp:Button ID="ResetButton" runat="server" Text="Reset" CausesValidation="False" OnClientClick="this.form.reset();return false;" />
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
            </p>
        </div>
    </div>
</asp:Content>
