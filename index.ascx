<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<div class="sider_container">
    <%--<div class="next_button">
        <i class="fa fa-angle-right"></i>
    </div>
    <div class="prev_button">
        <i class="fa fa-angle-left"></i>
    </div>--%>
    <div class="slick_slider">
        <asp:Literal ID="ltSlider" EnableViewState="false" runat="server"></asp:Literal>        
    </div>
</div>

<div class="clearfix"></div>

<div class="title-contant">����������</div>
<div class="wrapper-catalog">
    <div class="row">
    <div class="sider_container">
        <%--<div class="next_button3">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/next.png" alt="" />
        </div>
        <div class="prev_button3">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/prev.png" alt="" />
        </div>--%>
        <div class="slick_slider3">        
            <iwc:xsltlistview runat="server" id="xpvSliderProductsSale" stylesheetlocation="~/xsl/productsSlider.xsl" />  
        </div>
        <div class="clearfix"></div>
    </div>      
    </div>
    
    <div class="clearfix"></div>
</div>

<div class="clearfix"></div>

<div class="title-contant">����������� �����������</div>

<div class="wrapper-catalog">
<div class="row">
    <div class="sider_container">
        <%--<div class="next_button2">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/next.png" alt="" />
        </div>
        <div class="prev_button2">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/prev.png" alt="" />
        </div>--%>
        <div class="slick_slider2">
            
            <iwc:xsltlistview runat="server" id="xpvSliderProductsSpec" stylesheetlocation="~/xsl/productsSliderSpec.xsl" />  
            <%--<div class="col-md-3">
                <div class="catalog-item catalog-item-nmb">
                   <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
                   <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">����������� ������������ �������</a></div>
                   <div class="catalog-manufact">Brauberg</div>           
                   <div class="catalog-price">                       
                    <div class="fav-cart">
                        <a href="#"><img src="<%=AppPath %>/ii/fav_cart.png" alt="" /></a>
                    </div>
                    <div class="count-cart">                
                        <div class="count">1</div>
                        <div class="plus-count"><img src="<%=AppPath %>/ii/plus.png" alt="" /></div>
                        <div class="minus-count"><img src="<%=AppPath %>/ii/minus.png" alt="" /></div>
                    </div>
                    <div class="price-cart">
                        1 299 ���.
                    </div>           
                    <div class="clearfix"></div>
                   </div>
                   <div class="catalog-add">            
                    <a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add_cart.png" alt="" /></a>
                   </div>
                   <div class="discl-cart">
                    ���� ����� ���� ������� � ����������� �� ������ �������
                   </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="catalog-item catalog-item-nmb">
                   <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
                   <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">����������� ������������ �������</a></div>
                   <div class="catalog-manufact">Brauberg</div>           
                   <div class="catalog-price">                       
                    <div class="fav-cart">
                        <a href="#"><img src="<%=AppPath %>/ii/fav_cart.png" alt="" /></a>
                    </div>
                    <div class="count-cart">                
                        <div class="count">1</div>
                        <div class="plus-count"><img src="<%=AppPath %>/ii/plus.png" alt="" /></div>
                        <div class="minus-count"><img src="<%=AppPath %>/ii/minus.png" alt="" /></div>
                    </div>
                    <div class="price-cart">
                        1 299 ���.
                    </div>           
                    <div class="clearfix"></div>
                   </div>
                   <div class="catalog-add">            
                    <a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add_cart.png" alt="" /></a>
                   </div>
                   <div class="discl-cart">
                    ���� ����� ���� ������� � ����������� �� ������ �������
                   </div>
                </div>
            </div>--%>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</div>

<div class="clearfix"></div>

<div class="title-contant">��� ������</div>
<div class="wrapper-catalog">
    <div class="row">
    <div class="sider_container">
        <%--<div class="next_button3">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/next.png" alt="" />
        </div>
        <div class="prev_button3">
            <img class="img-slr-btn" src="<%=AppPath %>/ii/prev.png" alt="" />
        </div>--%>
        <div class="slick_slider3">        
            <iwc:xsltlistview runat="server" id="xpvSliderProductsTop" stylesheetlocation="~/xsl/productsSlider.xsl" />  
        </div>
        <div class="clearfix"></div>
    </div>      
    </div>
    
    <div class="clearfix"></div>
</div>

<div class="clearfix"></div>

<div class="index-block-map">
    <script src='http://api-maps.yandex.ru/2.0/?load=package.full&mode=debug&lang=ru-RU' type='text/javascript'></script>
    <script type="text/javascript">
            var map = null;
            ymaps.ready(function () { 

            map = new ymaps.Map("YMapsID", {
                    center: [57.736279, 40.975987],
                    zoom: 12,
                    type: "yandex#map",
                    behaviors: ["default", "scrollZoom"]
                }
            );

            map.controls.add("zoomControl", { left: "10px", top: "0" });
                
            var placemark = new ymaps.Placemark([57.736549, 40.970363],   
            
            {
                hintContent: "�������� '��� ��������'",
                balloonContent: "<p style='text-align:left;margin-bottom:20px;'><img style='float:left;width:40px; padding-right:7px;' src='/ii/logo_map.png' /><b>����������� ��� ��������<br />'��� ��������'</b></p><p><b>�.��������, ��.���������, �.24</b></p><div style='clear:both;'></div>����� ������:<br />��-��: 09:00-18:00<br />��: 09:00-14:00<br />��: ��������<p><a href='tel:+74942440888'>+7 (4942) 440-888</a></p>"
            },{
                iconImageHref: '/ii/logo_map.png',
                iconImageSize: [40, 42],
                iconImageOffset: [-3, -3]
            });
                map.geoObjects.add(placemark);        
        });
    </script>
    <div id="YMapsID" style="height: 350px; width:100%;">&nbsp;</div>
</div>

<div class="clearfix"></div>

<%--<div style="height: 40px; overflow:auto; clear: both;">&nbsp;</div>

<div style="font-family: ClearSansLight; font-size: 28px; float: left; width: 450px; margin-right:40px; text-align: right; text-transform: uppercase;">����������<br />
<div style="font-family: ClearSansLight; font-size: 17px; float: left; width: 450px;">
������� �������� ����������� ����������,<br />

<br />