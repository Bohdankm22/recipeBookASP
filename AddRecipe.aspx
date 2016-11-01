<%@ Page Title="Add your Recipe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

<%@ Register src="ListOfIngr.ascx" tagname="ListOfIngr" tagprefix="uc1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <br />
        <div>
            <p>
                <asp:Label ID="RecipeNameLabel" runat="server" Text="Recipe Name"></asp:Label>
                <asp:TextBox ID="RecipeNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Recipe" ControlToValidate="RecipeNameTextBox" ErrorMessage="Recipe name is required!" SetFocusOnError="True" Display="Dynamic" />
            </p>
            <p>
                <asp:Label ID="SubmitedByLabel" runat="server" Text="Submited By"></asp:Label>
                <asp:TextBox ID="SubmitedByTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Recipe" ErrorMessage="Please fill Submited By field" ControlToValidate="SubmitedByTextBox" SetFocusOnError="True" Display="Dynamic" />
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Recipe" ErrorMessage="Number of Servings is required" ControlToValidate="NumberOfServingsTextBox" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>

            <p>
                <asp:Label ID="RecipeDescriptionLabel" runat="server" Text="Recipe Description"></asp:Label>
                <asp:TextBox ID="RecipeDescriptionTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Recipe" ErrorMessage="Please fill the Description" ControlToValidate="RecipeDescriptionTextBox" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>
            <br />

            <uc1:ListOfIngr ID="ListOfIngr1" runat="server" />
            
            <p>
                <asp:Button ID="ResetButton" runat="server" Text="Reset" CausesValidation="False" OnClientClick="resetButtonClick" />
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" ValidationGroup="Recipe" />
            </p>
        </div>
    </div>
</asp:Content>
