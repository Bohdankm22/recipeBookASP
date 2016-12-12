<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <h3>Login</h3>
    <div >
        <asp:Login ID="Login1" runat="server" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.2em" ForeColor="#333333" Height="164px" Width="600px" OnAuthenticate="Login1_Authenticate">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.2em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="1.2em" />
            <TitleTextStyle Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            <LoginButtonStyle CssClass="btn-info" />
        </asp:Login>
    </div>

    <%-- (c) Author Bohdan Sharipov. All rights reserved --%>
</asp:Content>

