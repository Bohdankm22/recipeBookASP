<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IngridientItem.ascx.cs" Inherits="IngridientItem" %>

<p>
    <asp:Label ID="IngrNameLabel" runat="server" Text="Ingredient Name"></asp:Label>
    <asp:TextBox ID="IngrNameTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingredient Name is required!" ControlToValidate="IngrNameTextBox"></asp:RequiredFieldValidator>
</p>
<p>
    <asp:Label ID="QuantityLabel" runat="server" Text="Quantity"></asp:Label>
    <asp:TextBox ID="QuantityTextBox" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="QuantityTextBox" ValidationExpression=""></asp:RegularExpressionValidator>
</p>
<p>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
</p>
