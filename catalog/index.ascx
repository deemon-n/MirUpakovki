<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="catalog_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<div class="filter-catalog">
    <div class="filter-item">
        <asp:DropDownList Visible="false" ID="ddlCat" AutoPostBack="true" Width="330" OnSelectedIndexChanged="ddlCat_Change" runat="server"></asp:DropDownList><asp:DropDownList Width="330" ID="ddlCatChild" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlChildCat_Change"></asp:DropDownList><asp:DropDownList Width="330" ID="ddlCatChildChild" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlChildChildCat_Change"></asp:DropDownList><asp:TextBox ID="tbSearchProduct" CssClass="nbl btnSearchProduct2level" runat="server"></asp:TextBox><asp:Button ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click" CssClass="btn-send btn-find btnSearchProduct" Text="ПОИСК" />
    </div>    
</div>

<div class="wrapper-catalog">

<iwc:xsltlistview runat="server" id="xlvChildCategory" stylesheetlocation="~/xsl/childCats.xsl"/>

<div class="clear"></div>
 
<asp:PlaceHolder ID="phSortProd" EnableViewState="false" Visible="false" runat="server">
    <div class="filter-item">
        <span class="sortbyspan">Сортировка по:</span> <asp:DropDownList ID="ddlSort" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSort_Change">         
                                                            <asp:ListItem Text="Популярность" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Цена" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
    </div>
</asp:PlaceHolder>

<div class="clear"></div>

<iwc:xsltpagedview runat="server" id="xpvProducts" CountPerPage="16" stylesheetlocation="~/xsl/products.xsl"></iwc:xsltpagedview>

<%--    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>--%>
    
    <div class="clearfix"></div>
    
    <%--<div class="more-prod">Загрузить еще</div>--%>
    
    <br /><br />
    
</div>