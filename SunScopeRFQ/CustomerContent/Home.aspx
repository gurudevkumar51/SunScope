<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SunScopeRFQ.CustomerContent.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Welcome" runat="server" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" />
    <hr />
    <asp:Button ID="Button2" runat="server" Text="Go to new enquiry" OnClick="Button2_Click" />
    
</asp:Content>
