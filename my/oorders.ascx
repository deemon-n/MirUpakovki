<%@ Control Language="C#" AutoEventWireup="true" CodeFile="oorders.ascx.cs" Inherits="my_oorders" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<iwc:xsltlistview runat="server" id="xlvOrders" stylesheetlocation="~/xsl/orders.xsl"/>
<p>ศาฮรฮ: <%=Total.ToString("n2") %> <span class="rur">p<span>๓แ.</span></span></p>