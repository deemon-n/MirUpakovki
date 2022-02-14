<%@ Control Language="C#" AutoEventWireup="true" CodeFile="order-details.ascx.cs" Inherits="my_orderdetails" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<iwc:xsltlistview runat="server" id="xlvOrderItems" stylesheetlocation="~/xsl/orderitems.xsl"/>