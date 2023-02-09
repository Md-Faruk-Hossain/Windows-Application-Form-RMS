<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmReportingItem.aspx.cs" Inherits="RMS.frmReportingItem" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Report</h2>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"  Height="1202px" ReportSourceID="CrystalReportSource1"  ToolPanelWidth="200px" Width="1104px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="ItemReporting.rpt">
        </Report>
       
    </CR:CrystalReportSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
