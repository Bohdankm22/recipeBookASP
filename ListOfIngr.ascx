﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListOfIngr.ascx.cs" Inherits="ListOfIngr" %>

<!-- (c) Author Bohdan Sharipov. All rights reserved -->

<p>
    Ingredients:
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ListBox ID="MyListBox" runat="server" Height="101px" Width="503px"></asp:ListBox>
</p>

<asp:Panel ID="MyPanel" runat="server" GroupingText="Add ingredient" BorderColor="Black" BorderWidth="2">
    <p>
        <asp:Label ID="IngrNameLabel" runat="server" Text="Ingredient Name"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="IngrNameTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingredient Name is required!" ControlToValidate="IngrNameTextBox" ValidationGroup="Ingred"></asp:RequiredFieldValidator>
    </p>
    
<!-- (c) Author Bohdan Sharipov. All rights reserved -->

    <p>
        <asp:Label ID="QuantityLabel" runat="server" Text="Quantity"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="QuantityTextBox" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="QuantityTextBox" ValidationExpression="[0-9]*\.?[0-9]+" ValidationGroup="Ingred"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="UnitMeasureLabel" runat="server" Text="Units of measure"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="UnitMeasureText" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:CustomValidator ID="LimitIngredients" runat="server" ControlToValidate="IngrNameTextBox" ErrorMessage="You can only add 15 ingredients" ValidationGroup="Ingred" OnServerValidate="LimitIngredients_ServerValidate"></asp:CustomValidator>
        <asp:Button ID="IngredientButton" runat="server" ValidationGroup="Ingred" OnClick="IngredientButton_Click" Text="Add" />
    </p>
</asp:Panel>
<br />

<!-- (c) Author Bohdan Sharipov. All rights reserved -->
