<%@ Control Language="C#" AutoEventWireup="true" CodeFile="orders.ascx.cs" Inherits="my_orders" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Src="daterange.ascx" TagName="daterange" TagPrefix="uc1" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<asp:PlaceHolder ID="phState" runat="server" />
<uc1:daterange id="dr" runat="server"/>
<iwc:xsltlistview runat="server" id="xlvOrders" stylesheetlocation="~/xsl/orders.xsl"/>