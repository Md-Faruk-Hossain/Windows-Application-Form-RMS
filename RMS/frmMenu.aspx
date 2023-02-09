<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMenu.aspx.cs" Inherits="RMS.frmMenu" %>

<%@ Register Src="~/usreControlMenuInsert.ascx" TagPrefix="uc2" TagName="usreControlMenuInsert" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <uc2:usreControlMenuInsert runat="server" ID="usreControlMenuInsert" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
