<%@ Control Language="C#" AutoEventWireup="true" CodeFile="catalog.ascx.cs" Inherits="about_catalog" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<div id="content-catalog" style="width:980px; margin: 0 auto;">

<asp:Literal ID="ltTop" runat="server" EnableViewState="false" />

<div class="clear"></div>

<div id="block-catalog">
<iwc:xsltlistview runat="server" id="xlvChildCategory" stylesheetlocation="~/xsl/childCats.xsl"/>
</div>

<div class="clear"></div>
        
<iwc:xsltlistview runat="server" id="xpvProducts" stylesheetlocation="~/xsl/products.xsl" />

<asp:PlaceHolder ID="phBottom" runat="server">

<div class="clear"></div>

</div>