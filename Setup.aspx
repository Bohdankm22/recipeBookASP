<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="Setup" %>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Choose your theme</h3>
    <p>
        <asp:RadioButton runat="server" ID="DarkTheme" GroupName="Theme" Text="Dark"/>
        <asp:RadioButton runat="server" ID="LightTheme" GroupName="Theme" Text="Light"/>
    </p>
    <p>
        <asp:Button runat="server" Text="Set" OnClick="Unnamed1_Click" />
    </p>
</asp:Content>

