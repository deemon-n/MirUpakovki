<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sale.ascx.cs" Inherits="catalog_sale" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>


<div class="container">
    <div class="container-block office-block">                    
        <div class="subHeaderCatalog" style="width: 100%;">
            <img id="imgCatalogSubHeader" class="img-response" src="/i/u/Rasprodazha.jpg">
        </div>
    </div>
</div>

<%--<iwc:contentbox id="cbSale" runat="server" code="Sale" />--%>

<div class="wrapper-catalog">
    <div class="row">
        <iwc:xsltpagedview runat="server" id="xpvProducts" stylesheetlocation="~/xsl/products.xsl"></iwc:xsltpagedview>
    </div>
</div>
<br />