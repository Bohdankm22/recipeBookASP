<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Recipes" %>
<%@ Register TagPrefix="rc" TagName="RecipeItem" Src="RecipeItem.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
    
        <asp:ListView runat="server" ID="ListView1">
          <LayoutTemplate>
            <table runat="server" id="table1" style="border:medium; border-color:black" border="1">
                <tr>
                    <td style="width: 250px;">
                        <span><b>Name</b></span>
                    </td>
                    <td>
                        <span><b>Description</b></span>
                    </td>
                </tr>
              <tr runat="server" id="itemPlaceholder" ></tr>
            </table>
          </LayoutTemplate>
          <ItemTemplate>
            <tr runat="server">
              <td runat="server" style="width: 250px;">
                <%-- Data-bound content. --%>
                <asp:Label ID="NameLabel" runat="server" Text='<%#Eval("Name") %>' />
              </td>
              <td runat="server">
                <asp:Label ID="Label2" runat="server" Text='<%#Eval("Description") %>' />
              </td>
            </tr>
          </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

