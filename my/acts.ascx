<%@ Control Language="C#" AutoEventWireup="true" CodeFile="acts.ascx.cs" Inherits="my_acts" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Src="daterange.ascx" TagName="daterange" TagPrefix="uc1" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<uc1:daterange id="dr" runat="server"/>
<asp:Literal ID="ltActs" runat="server" EnableViewState="false" />