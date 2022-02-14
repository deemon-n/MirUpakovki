<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item.ascx.cs" Inherits="catalog_item" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<style type="text/css">
    .main-title
    {
        display:none;
    }
</style>

<div class="clearfix"></div>

<%--<asp:PlaceHolder ID="phSubHeaderCatalog" EnableViewState="false" runat="server">
    <div class="container-block">
        <div class="subHeaderCatalog">    
            <asp:Image ID="imgCatalogSubHeader" runat="server" />
            <asp:PlaceHolder ID="phCatOffice" EnableViewState="false" Visible="false" runat="server">
            <div class="subHeaderCatalog-office">                
                <a href="https://www.office-zakaz.ru/" target="_blank"><img src="<%=AppPath %>/ii/cat-office.jpg" alt="Перейти в каталог офис-заказ"></a>
            </div>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:PlaceHolder>--%>

<div class="filter-catalog">
    <div class="filter-item">
        <asp:DropDownList ID="ddlCat" AutoPostBack="true" Width="330" OnSelectedIndexChanged="ddlCat_Change" runat="server" Visible="false"></asp:DropDownList><asp:DropDownList Visible="false" CssClass="nbl" Width="330" ID="ddlCatChild" runat="server"></asp:DropDownList><asp:TextBox ID="tbSearchProduct" CssClass="inputforitemprod" runat="server"></asp:TextBox><asp:Button ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click" CssClass="btn-send btn-find btnSearchProduct" Text="ПОИСК" />
    </div>
</div>

<div class="forwardcatalog"><a onclick="javascript:history.back(); return false;">&larr; вернуться назад</a></div>

<div class="prod-item-descr">
    <div class="row">
        <div class="col-md-4 text-left">
            <%--<img src="<%=AppPath %>/ii/prod-img.png" alt="" />--%>
            <asp:Literal ID="ltImgMain" EnableViewState="false" runat="server"></asp:Literal>
            <div class="row">
            <asp:Literal ID="ltImgExt" EnableViewState="false" runat="server"></asp:Literal>
                <%--<div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>
                <div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>
                <div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>
                <div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>--%>
            </div>
        </div>
        <div class="col-md-8 text-right">
            <div class="title-prod"><asp:Literal ID="ltName" EnableViewState="false" runat="server"></asp:Literal></div>
            <div class="manufact-prod"></div>
            <div class="code-prod code-prod-item">Код: <asp:Literal ID="ltCode" EnableViewState="false" runat="server"></asp:Literal></div>
             <div class="cart-add-prod cart-add-prod-item">
            
               <div class="catalog-price">
               <div class="catalog-add catalog-add-item">
                <a href="javascript:void(0);" class="add-item isProdItem" pid="<%= pidStr %>">
                  <img src="<%=AppPath %>/ii/add_cart_new.jpg" alt="" />
                </a>
                </div>
                <div class="price-cart price-cart-item-item">
                    <asp:Literal ID="ltPrice" EnableViewState="false" runat="server"></asp:Literal>
                </div>                                
                <div class="count-cart count-cart-item-item">
                <input type="text" class="count count-input" value="1" />
              <!--<div class="count">1</div>-->
                  <div class="plus-count">
                    <img src="<%=AppPath %>/ii/plus.png" alt="" />
                  </div>
                  <div class="minus-count">
                    <img src="<%=AppPath %>/ii/minus.png" alt="" />
                  </div>
                </div>                
                  <% if (Product.Favorite) { %>
                  <div class="fav-cart fav-cart-item-item fav-item favorite" pid="<%= pidStr %>">
                    <img src="<%=AppPath %>/ii/fav_cart_fill.png" alt="" />
                  </div>
                  <% } else {%>
                  <div class="fav-cart fav-cart-item-item fav-item" pid="<%= pidStr %>">
                    <img src="<%=AppPath %>/ii/fav_cart.png" alt="" />
                  </div>
                  <% }%>               
              <div class="clearfix"></div>
            </div>
            
            <div class="descr-prod">
                <asp:Literal ID="ltDescr" EnableViewState="false" runat="server"></asp:Literal>                
                <div class="clearfix"></div>
           </div>            
        </div>
        </div>
</div>

<div class="title-contant prod-title-contant">Избранное</div>
<br />
<div class="wrapper-catalog">
    <div class="">
    <div class="row">
    <div class="sider_container">
        <%--<div class="next_button3">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/next.png" alt="" />
        </div>
        <div class="prev_button3">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/prev.png" alt="" />
        </div>--%>
        <div class="slick_slider3">
        
            <iwc:xsltlistview runat="server" id="xpvProductsTop" stylesheetlocation="~/xsl/productsSliderFavorit.xsl" />  
        </div>
        <div class="clearfix"></div>
    </div>  
    </div>    
    </div>
    
    <div class="clearfix"></div>
</div>
<br />