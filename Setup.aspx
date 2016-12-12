<%@ Page Title="Theme choosing" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="Setup" %>

<%-- (c) Author Bohdan Sharipov. All rights reserved --%>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Choose your theme</h3>
    <p>
        <asp:RadioButton runat="server" ID="DarkTheme" GroupName="Theme" Text="Dark" Checked="True" />
        <asp:RadioButton runat="server" ID="LightTheme" GroupName="Theme" Text="Light"/>
    </p>
    <p>
        <asp:Button ID="ThemeBut" runat="server" Text="Set" OnClick="Unnamed1_Click" />
    </p>

    <%-- (c) Author Bohdan Sharipov. All rights reserved --%>

</asp:Content>

