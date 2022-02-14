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

<div style="font-family: ClearSansLight; font-size: 28px; float: left; width: 450px; margin-right:40px; text-align: right; text-transform: uppercase;">����������<br />� �������� �������<br /></div>
<div style="font-family: ClearSansLight; font-size: 17px; float: left; width: 450px;">
������� �������� ����������� ����������,<br />������������ �������, ������� �����<br />� ������� ������</div><div style="height: 40px; overflow:auto; clear: both;">&nbsp;</div><div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-food.png);"><h2 style="font-size: 28px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/1/">������� ��������</a></h2>    <div class="column">        <div><a href="/catalog/20/">������ �����������</a></div>        <div><a href="/catalog/21/">������� ���</a></div>        <div><a href="/catalog/22/">��������� ������</a></div>        <div><a href="/catalog/23/">����������</a></div>        <div><a href="/catalog/24/">�������� ��������</a></div>    </div>    <div class="column">        <div><a href="/catalog/25/">������ ��� ����</a></div>        <div><a href="/catalog/26/">��������, �����</a></div>        <div><a href="/catalog/27/">��������������� ���������</a></div>        <div><a href="/catalog/28/">���������������� �����</a></div>    </div></div><div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-corp.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/4/">������������� ������������ �����������</a></h2>    <div class="column">        <div><a href="/catalog/46/">������������� ������</a></div>        <div><a href="/catalog/47/">������������ ������ ��� �����</a></div>        <div><a href="/catalog/48/">������������ ������ ��� �����</a></div>        <div><a href="/catalog/49/">������� �����</a></div>        <div><a href="/catalog/50/">������</a></div>    </div>    <div class="column">        <div><a href="/catalog/65/">������� ����-�����</a></div>        <div><a href="/catalog/51/">������� ������</a></div>        <div><a href="/catalog/52/">���. ������� � ��������� ���������</a></div>    </div></div><div class="bghover catfull" style="background-image: url(<%=AppPath %>/ii/cat-prom.png);"><h2 style="font-size: 28px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/2/">������������ ��������</a></h2>    <div class="column">        <div><a href="/catalog/29/">����� ��������</a></div>        <div><a href="/catalog/30/">��������</a></div>        <div><a href="/catalog/31/">������� �����</a></div>        <div><a href="/catalog/32/">������� ���������</a></div>    </div>    <div class="column">        <div><a href="/catalog/33/">������������ � ����������</a></div>        <div><a href="/catalog/34/">�����</a></div>        <div><a href="/catalog/35/">����� ���</a></div>    </div>    <div class="column">        <div><a href="/catalog/36/">����������� �����</a></div>        <div><a href="/catalog/37/">������ �����</a></div>    </div></div><div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-horeca.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-align: left;" class="nomargin thin">    <a href="/catalog/3/">������ ��� HoReCa</a></h2>    <div class="column">        <div><a href="/catalog/38/">������</a></div>        <div><a href="/catalog/61/">������-�����</a></div>        <div><a href="/catalog/39/">������ ���������</a></div>        <div><a href="/catalog/45/">����� ��� ������</a></div>    </div>    <div class="column">        <div><a href="/catalog/44/">���������� ��� ����� � ����������</a></div>        <div><a href="/catalog/42/">�������-�������������� ��������� � ����������</a></div>        <div><a href="/catalog/40/">������� � ������� �����</a></div>    </div></div><a href="<%=MirUpak.Model.Variables.BannerLink1 %>"><img src="<%=AppPath %>/ii/banner1.jpg" class="bghover catban" /></a><a href="<%=MirUpak.Model.Variables.BannerLink2 %>"><img src="<%=AppPath %>/ii/banner2.jpg" class="bghover catban" /></a><div class="bghover catquot" style="background-image: url(<%=AppPath %>/ii/cat-season.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/5/">�������� ������</a></h2>    <div class="column">        <div><a href="/catalog/55/">���������� ��������� � ����</a></div>        <div><a href="/catalog/56/">���������� ��������</a></div>        <div><a href="/catalog/63/">��������</a></div>    </div></div><div class="bghover catquot" style="background-image: url(<%=AppPath %>/ii/cat-vac.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/6/">������ ��� ������</a></h2>    <div class="column">        <div><a href="/catalog/58/">������ �����������</a></div>        <div><a href="/catalog/59/">������ ��� ����</a></div>        <div><a href="/catalog/60/">������ ��� �������</a></div>    </div></div><div class="clear"></div><div id="tm">    <div style="font-family: ClearSansBold; font-size: 30px; font-weight: bold; text-align: center; padding: 20px; padding-top:40px;">����������� �������� �����</div>    <div style="float:left; height:300px; line-height:300px; width:62px; padding-left: 40px;"><img src="<%=AppPath %>/ii/tmleft.png" style="cursor: pointer;" onclick="javascript:tmsPrev();" /></div>    <div style="float:left; width:676px; padding-left:50px; padding-right:50px;">        <div align="center">            <div number="0" class="tmsel sel">JOHN PACK</div>            <div number="1" class="tmsel">��������</div>            <div number="2" class="tmsel">GREEN WOOD</div>            <div number="3" class="tmsel">PRISMA</div>        </div>                <div id="tms">            <div id="tmsv">                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-jp.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">JOHN PACK.</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">������� ����������� ��������</div>                    <div>�������� ����� ���� �������� � 2013 �., �� ��� ������ ��������� ������� � ����� �����������, �� ���� ������ ��������� ��������  ��������, �������� ���� � ��������������� �������.</div>                    <a href="/catalog/7/" style="text-decoration:none;"><div class="inspect">������������ � ����������</div></a>                </div>                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-ra.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">��������.</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">������� �����!</div>                    <div>�������� �����, �������� � 2006 ����. ������� ����� �������� ���������� ���� ���������� �� �������������� ������������ � ������������ ������������ ����������. ������� �� ��������� �������� �� �����������, ����������� � ���������� ������ ������� ������� � ��������� ��������������� �������� ����� ���������, � ��������������� ��������� � ������������ �������.</div>                    <a href="/catalog/8/" style="text-decoration:none;"><div class="inspect">������������ � ����������</div></a>                </div>                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-gw.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">GREEN WOOD</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">����� ������� � ��������</div>                    <div>�������� ����� �Green Wood� ����� � ���� � 2014 �., ������������ ���� ��� ������, ���������� ��������� ��� ��� � �������, ��� �������� ������� ��� ����������� ���� � ��������. ����������� ����������� ���� � �������� ������� �� �������� ������������ ��������, ��� ��������� ����������� �������� ����� � ���������� ��������� ������������.</div>                    <a href="/catalog/9/" style="text-decoration:none;"><div class="inspect">������������ � ����������</div></a>                </div>                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-pr.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">PRISMA</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">������������ ������</div>                    <div>�������� ����� �PRISMA� ���������������� � 2014 ���� ��� ����� ������� ������������� ����������, ��� ��������������. ���� �������������� ��� ��������� � ����������. � ����� �� ���������� ��� � ���.</div>                </div>            </div>        </div>    </div>    <div style="float:left; height:300px; line-height:300px; width:62px; padding-right: 40px;"><img src="<%=AppPath %>/ii/tmrght.png" style="cursor: pointer;" onclick="javascript:tmsNext();" /></div></div><div class="clear"></div><h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">17 ��� ����������� ������</h2><img src="<%=AppPath %>/ii/achbar.png" /><div id="achs">    <div class="col">�������� ���� �������� ����� ���� ������������� � 2000 ���� � ���������� ������������� ����� � ������.</div>    <div class="col">����������� ����� ����� �������� 20 �������, � ���������� ���� � 500 ������������.</div>    <div class="col">�� ���� �������� ������� ����� �� ���� ������������, ������� ��������� ��������� ����������� ��������� ����. �������� ������������ ����� �������� �����.</div>    <div class="col">������ ������������ ������� ����������� ������. ��� ����������� ����� ��������� � ����� ���. �������� ������������ ����������� ��� ������������ �������.</div>    <div class="col">�� ���� �������� ������� � ������ �������� ����������� ������� ��� ����� ������� ���������� ����������� � ��������� ����������.</div>    <div class="col">������� ��������� ��������� �� ���� �������� ��������� 5500�2 . �������� � ������ ����������� ���������.</div></div><div class="clear"></div><h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">������ �� ������</h2><img src="<%=AppPath %>/ii/best1.png" class="best bghover" /><img src="<%=AppPath %>/ii/best2.png" class="best bghover" /><img src="<%=AppPath %>/ii/best3.png" class="best bghover" /><img src="<%=AppPath %>/ii/best4.png" class="best bghover" /><img src="<%=AppPath %>/ii/best5.png" class="best bghover" /><img src="<%=AppPath %>/ii/best6.png" class="best bghover" /><div class="clear"></div><h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">������ ����� ��������</h2><div id="face">    <img src="<%=AppPath %>/ii/faceframe.png" id="frame" />    <img src="<%=AppPath %>/ii/face-igor.jpg" class="face" />    <img src="<%=AppPath %>/ii/face-marina.jpg" class="face" />    <img src="<%=AppPath %>/ii/face-sergey.jpg" class="face" />    <div class="name">������� �����</div>    <div class="name">�������� ������</div>    <div class="name">����� ������</div>    <div class="org">��� �������������</div>    <div class="org">��� ������</div>    <div class="org">��� �� ������� ����</div></div><div id="ftext">    <div class="ftext">        <p>���� ��������� ������������� ������ �������� ���� �������� �� ������������� �������������� ������� �����������, ������ ����� � ������ � ��������� �������� �� ������� ������ ��� ����� ������������.</p>        <p>���� ������� �������� � ����������, ������� ���� � ��������� ������� � ������������ ��������. �������� ������������� ��������� ����� ������ �������, ������������ � �� ��������. ��������� � ������������ �� ������� ����������� �������� � � ����������� ������ ��� �������. ��������� �� ������������ � �������������.</p>        <p><em>��� &laquo;����-������&raquo;</em></p>    </div>    <div class="ftext">        <p>� ������� �������� ���� �������� ����������� � ������� �������� ����� ���� ���������. ���� �������, ��� ����� ������������� ����������� ��� ��� ��������� �� ����������.</p>        <p>������������ � ������� �������� �� ���� ������ � ������ �������� ���� ��������. ��� ��� ������ ������������ �����, �� ������� ����� �� ���������� �������� ����� ��������. � ��� ����, ��� ��� ��������� �������, ������ ������ ����� ���� ��������. ��������� ����� � ������� ������ ������������� ����������� � ������� ���� ������ � ��������� ����. �� �������� ������ �������� ������, ��� ��� ��� ����������� ��� ������ � ������������ � ��������������� ���� ��������. ���������� � ��������������.</p>        <p><em>��� &laquo;���������&raquo;</em></p>    </div>    <div class="ftext">        <p>���� ������������� �������� ���� �������� �� ���������� � ������������ ������! �� ������������ �� ���������� ������ ��� � ����������� ��������� � ������������ � ������� ��������� �������� ��� ����� ��������� � ������ �����������.</p>        <p>������ ��� �� � ��������� ��� �������� ���, � �������, ��� ��, ��������� ������� � ����, ������� �� �������� ����������, �� ����� ���� � ������ ������. � ���� ������ �� ������� ��������������, ������� ��� ���������� �������� ���� ��������, ������������� �������� � �������� ����������, � �������� ���� ������ ���������� �������, �� ������� ������������ � ����������� � ��� ���� ���� �� ����� ������!</p>        <p>������� ���!</p>        <p><em>��� &laquo;�������&raquo;</em></p>    </div></div><div id="facesel"></div><div class="clear"></div><div id="recall">    <div class="larger" style="color: #fff; margin-bottom: 20px;">�������� �������? �� ��� ����������!</div>    <div id="reform">        <input id="name" style="width:320px; margin-right:20px;" class="defvalue" defvalue="���" />        <input id="phone" style="width:320px; margin-right:20px;" class="defvalue" defvalue="�������" />        <input id="send" style="width:200px; background-color: #fff; color: #06a6b4; height: 32px; padding:0px;" type="button" value="���������" />    </div>    <div id="resent">        �������! �� �������� ���� ���������!    </div></div>--%>

<br />