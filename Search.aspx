<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content id="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <br />
        <asp:Label runat="server" Text="Search"/>
        <input id="searchLine" runat="server" />
        <asp:Button runat="server" id="searchRec" onClick="searchRecipes" Text="Search recipes"/>
        <br/>
        <br/>

        <asp:ListView runat="server" ID="ListView1" style="margin-right: 416px">
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