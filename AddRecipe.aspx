<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <br />
        <div style="width: 800px">
            <p>
                <asp:Label ID="RecipeLabelName" runat="server" Text="Recipe Name"/>
                <input type="text" runat="server" id="RecipeInputName" style="position: absolute; left: 400px; "/></p>
            <br />
            <p>
                <asp:Label ID="Label2" runat="server" Text="Recipe description"/>
                &nbsp;</p>
            <p>&nbsp;</p>
            <p><textarea runat="server" id="RecipeInputDescription" style="position: absolute; left: 400px; top: 310px; height: 66px; width: 200px;" /></p>
            <p>&nbsp;</p>
            <p>
                <asp:Button ID="RecipeSaveButton" Text="Save recipe" runat="server" OnClick="RecipeSave"/>
            </p>
            <br />
            <p>
                <asp:Label ID="SuccessfullySaved" runat="server" ForeColor="#00CC00" />
            </p>
        </div>
    </div>
</asp:Content>