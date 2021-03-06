﻿<%@ Page Title="CookBook" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%-- (c) Author Bohdan Sharipov. All rights reserved --%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li><a runat="server" href="~/Setup.aspx">Setup</a></li>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Cookbook</h1>
        <p class="lead">Add your recipes, take a look at other recipes. Share your knowladge and get some.</p>
    </div>

    <%-- (c) Author Bohdan Sharipov. All rights reserved --%>

    <div class="row">
        <div class="col-md-4">
            <h2>Cooking recipes</h2>
            <p>
                Any kind of cooking recipes are available here. 
            </p>
        </div>
        <h1>Description</h1>
        <p>
            Cookbook is ONE place to store and organize the recipes you find and tear out of magazines, bookmark online, store on faded recipe cards – in a format that can be carried & used directly in the kitchen. 
        </p>

    </div>

</asp:Content>
