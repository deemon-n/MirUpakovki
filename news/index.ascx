<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="news_index" %>

<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<iwc:xsltlistview runat="server" id="xlvNews" stylesheetlocation="~/xsl/news.xsl"></iwc:xsltlistview>

<div class="clearfix"></div>

<div style="height:50px;"></div>