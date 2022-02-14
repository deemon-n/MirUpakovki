<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main2.aspx.cs" ValidateRequest="false" Inherits="layouts_Main2" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Schema" TagPrefix="cc1" %>
<%@ Register Assembly="Ideal.WebTruth" Namespace="Ideal.WebTruth.Controls" TagPrefix="iwwt" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html lang="ru" class="lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html lang="ru" class="lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html lang="ru" class="lt-ie9"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="ru">
<!--<![endif]-->
<head id="Head" runat="server">
	<meta charset="utf-8" />
	<meta name="description" content="��� ��������" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<%--<meta name="viewport" content="width=1140">--%>
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
    <link rel="manifest" href="/favicon/site.webmanifest">
    <link rel="mask-icon" href="/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    <meta name="yandex-verification" content="640f7e61d8e44989" />

    <title runat="server"></title>

    <script charset="UTF-8" src="//cdn.sendpulse.com/js/push/ff8995695be76010c1378fa43bbbfc02_0.js" async></script>
</head>

    <link rel="shortcut icon" href="<%=AppPath %>/favicon.ico" />
    <link rel="stylesheet" href="<%=AppPath %>/js/bootstrap/bootstrap-grid-3.3.1.min.css" />
    <%--<link rel="stylesheet" href="<%=AppPath %>/js/font-awesome-4.2.0/css/font-awesome.min.css" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    
    <link href="<%=AppPath %>/bootstrap-3.3.5-dist/css/bootstrap.css" rel="stylesheet"/>      
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/bootstrap-3.3.5-dist/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="<%=AppPath %>/js/owl-carousel/owl.carousel.css" />
    <link rel="stylesheet" href="<%=AppPath %>/css/fonts.css?v=1.1" />
    <link rel="stylesheet" href="<%=AppPath %>/css/mu2.css?v=1.57" />
    <link rel="stylesheet" href="<%=AppPath %>/css/media.css?v=1.14" />

<body>
<form id="mu2" runat="server">
<%--<div class="fix-block">
 <div class="menu-fix">
    <div><a href="#"><img src="<%=AppPath %>/ii/rm1.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm2.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm3.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm4.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm5.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm6.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm7.png" alt="" /></a></div>
 </div>
 <div class="cat-fix">
    <div><a href="#">������� ��������</a></div>
    <div><a href="#">������������ ��������</a></div>
    <div><a href="#">������ ��� HORECA</a></div>
    <div><a href="#">�������� ������</a></div>
    <div><a href="#">������ ��� ������</a></div>
    <div><a href="#">������������� ������������ �����������</a></div>
    
    <div class="msg-fix msgfix">
    <div id="close-fix"></div>
        <div>
            <img id="fix-konsult" src="<%=AppPath %>/ii/maryanaro.png" alt="" />
            <div id="fix-konsult-name">����� ��������</div>
            <div id="fix-konsult-our">��� �����������</div>
        </div>
        <div id="fix-message">
            <img id="Img1" src="<%=AppPath %>/ii/message.png" alt="" />
        </div>
        <div id="fix-form">
            ���� � ��� ���� �������, ��������� �� �������� 8(4942)440-888 ��� �������� ���� ���������� ������ � �� �������� � ���� � ��������� �����.
            <div id="fix-input">
                <input type="text" placeholder="������� �������">
                <img id="Img2" src="<%=AppPath %>/ii/fix-send.png" alt="" />
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    
 </div> 
</div>--%>

<div id="main">

<div class="right_panel">	

<div class="right_panel_body">

    <div class="close-right_panel"><a href="javascript:void(0);"><img class="close_right_panel" src="<%=AppPath %>/ii/rm1.png" alt="" /></a></div>
    
    <div class="right-menu">
        <div class="item-right-menu rm2"><a href="<%=AppPath %>/catalog/cart.aspx">�������</a></div>
        <div class="item-right-menu rm3"><a href="<%=AppPath %>/my/">������ �������</a></div>
        <div class="item-right-menu rm4"><a href="<%=AppPath %>/about/">� ��������</a></div>
        <div class="item-right-menu rm12"><a href="<%=AppPath %>/tm/">����������� �������� �����</a></div>
        <div class="item-right-menu rm5"><a href="<%=AppPath %>/news/">�������</a></div>
        <div class="item-right-menu rm6"><a href="<%=AppPath %>/contacts/">��������</a></div>
        <div class="item-right-menu rm7"><a href="<%=AppPath %>/help/">������</a></div>
        <div class="item-right-menu rm8"><a href="<%=AppPath %>/delivery/">��������</a></div>
        <div class="item-right-menu rm9"><a href="<%=AppPath %>/about/job/">��������</a></div>
        <div class="item-right-menu rm10"><a href="<%=AppPath %>/about/assortment.aspx">�����������</a></div>
        <div class="item-right-menu rm11"><a href="<%=AppPath %>/about/portfolio.aspx">���������</a></div>
    </div>

</div>

<div class="menu-fix">
    <div><a href="javascript:void(0);"><img class="close_right_panel" src="<%=AppPath %>/ii/rm1.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm2.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm3.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm4.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm5.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm6.png" alt="" /></a></div>
    <div><a href="#"><img src="<%=AppPath %>/ii/rm7.png" alt="" /></a></div>
 </div>
<%-- <div class="cat-fix">
    <div><a href="#">������� ��������</a></div>
    <div><a href="#">������������ ��������</a></div>
    <div><a href="#">������ ��� HORECA</a></div>
    <div><a href="#">�������� ������</a></div>
    <div><a href="#">������ ��� ������</a></div>
    <div><a href="#">������������� ������������ �����������</a></div>
 </div>--%>
</div>


<div id="header">
    <div class="container">
    <div class="container-block">        
        <div class="row row-desktop">
         <div class="col-md-8">
            <div class="header-menu">
                <span class="plink nav-item" data-role="sidebarTrigger"><span class="nav-hamburgerIcon"></span></span>
            </div>
            <div class="header-logo"><a href="<%=AppPath %>/index.aspx"><img src="<%=AppPath %>/ii/logo.jpg" alt="��� ��������" /></a></div>
            <div class="header-search">
                <asp:TextBox ID="tbSearchHeader" CssClass="btnSearchHeader" runat="server" Text="����� ������"></asp:TextBox><asp:Button ID="btnSearchHeader" runat="server" OnClick="btnSearchHeader_Click" CssClass="btnSearchHeader" Text="�����" />
            </div>            
         </div>
         <div class="col-md-4">
             <div class="header-phone">
                <div class="gilroy-font">8 (4942) 440-888</div>
                <div><a class="header_recall" href="javascript:recall_header();">�������� �������� ������</a></div>
             </div>
             <div class="header-cart">
                <div class="header-cart-count">0</div>
                <a href="<%=AppPath %>/catalog/cart.aspx"><img src="<%=AppPath %>/ii/cart-header.png" alt="�������" /></a>
                <div class="cart-descr">
                    <a href="<%=AppPath %>/catalog/cart.aspx">�������</a><br />
                    <span><span class="header-cart-price">0</span> ���.</span>
                </div>
             </div>             
         </div>
         <div class="clearfix"></div>
        </div>
        
        <div class="row row-mobile">
            <div class="col-xs-6">
                <div class="m-logo">
                <a href="<%=AppPath %>/index.aspx"><img src="<%=AppPath %>/ii/logo.jpg" alt="��� ��������" /></a>
                </div>
            </div>
            <div class="col-xs-6">                
                <div class="m-gilroy-font">8 (4942) 440-888</div>
                <div class="m-recall"><a class="m-header_recall" href="javascript:recall_header();">�������� ������</a></div>
            </div>
        </div>
        <div class="row row-mobile row-mobile-menu-search-cart">
            <div class="col-xs-2 text-left">
                <span class="plink nav-item" data-role="sidebarTrigger"><span class="nav-hamburgerIcon"></span></span>
            </div>
            <div class="col-xs-8 text-center" style="padding-left:0; padding-right:0;">
                <div class="m-header-search">
                    <asp:TextBox ID="tbMSearchHeader" CssClass="m-tbSearchHeader" runat="server" Text="����� ������"></asp:TextBox><asp:ImageButton ID="imgBtnMHeader" CssClass="m-btnSearchHeader" OnClick="btnSearchHeader_Click" runat="server" />
                </div>
            </div>
            <div class="col-xs-2 text-right">
                <div class="m-header-cart">
                    <div class="header-cart-count m-header-cart-count">0</div>
                    <a href="<%=AppPath %>/catalog/cart.aspx">
                        <img src="<%=AppPath %>/ii/cart-header.png" alt="�������" /></a>                    
                </div>
            </div>
        </div>
        
        <div class="row row-mobile row-tablet-menu-search-cart">
            <div class="col-xs-1 text-left">
                <span class="plink nav-item" data-role="sidebarTrigger"><span class="nav-hamburgerIcon"></span></span>
            </div>
            <div class="col-xs-7 text-center" style="padding-left:0; padding-right:0;">
                <div class="tablet-header-search">
                    <asp:TextBox ID="tbTabletSearchHeader" CssClass="tablet-tbSearchHeader" runat="server" Text="����� ������"></asp:TextBox><asp:ImageButton ID="imgBtnTabletHeader" CssClass="tablet-btnSearchHeader" OnClick="btnSearchHeader_Click" runat="server" />
                </div>
            </div>
            <div class="col-xs-4 text-right">
                <div class="tablet-header-cart">
                    <div class="header-cart-count tablet-header-cart-count">0</div>
                    <a href="<%=AppPath %>/catalog/cart.aspx">
                        <img src="<%=AppPath %>/ii/cart-header-tablet.png" alt="�������" />
                        �������
                        <span class="tablet-price-cart"><span class="header-cart-price">0</span> ���.</span>
                    </a>
                </div>
            </div>
        </div>
             
    </div>
    </div>
</div>

<div class="clearfix"></div>

<div id="menu-sub-header">
    <div class="container">
        <div class="container-block">
            <div class="row">
            <div class="col-md-12">
            <div class="menu-sub-header-flex">
                <div class="item-mnu"><a href="<%=AppPath %>/catalog/cart.aspx"><img src="<%=AppPath %>/ii/rm2.png" alt="�������" /> �������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/my/"><img src="<%=AppPath %>/ii/rm3.png" alt="�������" /> ������ �������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/about/"><img src="<%=AppPath %>/ii/rm4.png" alt="�������" /> � ��������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/news/"><img src="<%=AppPath %>/ii/rm5.png" alt="�������" /> �������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/contacts/"><img src="<%=AppPath %>/ii/rm6.png" alt="�������" /> ��������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/help/"><img src="<%=AppPath %>/ii/rm7.png" alt="�������" /> ������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/delivery/"><img src="<%=AppPath %>/ii/rm8.png" alt="�������" /> ��������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/about/job/"><img src="<%=AppPath %>/ii/rm9.png" alt="�������" /> ��������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/about/assortment.aspx"><img src="<%=AppPath %>/ii/rm10.png" alt="�������" /> �����������</a></div>
                <div class="item-mnu"><a href="<%=AppPath %>/about/portfolio.aspx"><img src="<%=AppPath %>/ii/rm11.png" alt="�������" /> ���������</a></div>
                </div>
            </div>         
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>

<div id="sub-header">
    <div class="container container-phone">
    <div class="container-block">
    
<%--���� ���������� �� ������ �����--%>
<%--<div class="masthead">
    <ul class="nav nav-justified">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Projects</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Downloads</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
</div>--%>
<%--���� ���������� �� ������ ����� �����--%>

<%--<header>
        <div class="col-md-3">
            <a href="<%=AppPath %>/index.aspx"><img src="<%=AppPath %>/ii/logo_new.png" alt="��� ��������" /></a>
        </div>
        <div class="col-md-4 text-center">
            <div class="phone">
                <i class="fa fa-phone phm" aria-hidden="true"></i> +7 (4942) 440-888</div>
        </div>
        <div class="col-md-5">
            <div id="header-form">
                <input type="text" placeholder="���">
                <input type="text" placeholder="�������">
                <a class="btn-send" href="#">������ ������</a>
            </div>            
        </div>
        <div class="clearfix"></div>
</header> --%> 
            
        <div id="top-menu">
            <div class="item-top-menu-flex">
           <div class="t-item-top-menu-flex">                
                <a class="a-font-sale" href="<%=AppPath %>/catalog/sale.aspx"><img src="<%=AppPath %>/ii/menu_sale.png" alt="����������" /><br />
                <span class="menu-name font-sale">SALE</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/3/"><img src="<%=AppPath %>/ii/menu1.png" alt="������ ��� �����" /><br />
                <span class="menu-name">������<br /> ��� �����</span></a>
                </div>
            </div>
           <%--<div class="item-top-menu-flex">
           <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/1/"><img src="<%=AppPath %>/ii/menu2.png" alt="������ �������" /><br />
                <span class="menu-name">������<br /> �������</span></a>
                </div>
            </div>--%>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/2/"><img src="<%=AppPath %>/ii/menu3.png" alt="������� �����" /><br />
                <span class="menu-name">�������<br />�����</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
                <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/4/">
                <img src="<%=AppPath %>/ii/menu4.png" alt="������ ��� �����" /><br />
                    <span class="menu-name">������<br />��� �����</span>
                    </a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/5/"><img src="<%=AppPath %>/ii/menu5.png" alt="���������� ��������, ��������" /><br />
                <span class="menu-name">����������<br />��������, ��������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/6/"><img src="<%=AppPath %>/ii/menu6.png" alt="������ �����������" /><br />
                <span class="menu-name">������<br />�����������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/7/"><img src="<%=AppPath %>/ii/menu7.png" alt="������������ ��������" /><br />
                <span class="menu-name">������������<br />��������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/8/"><img src="<%=AppPath %>/ii/menu8.png" alt="������ ��� ���� � ������" /><br />
                <span class="menu-name">������<br />��� ���� � ������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/9/"><img src="<%=AppPath %>/ii/menu9.png" alt="�������� ������" /><br />
                <span class="menu-name">��������<br />������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/10/"><img src="<%=AppPath %>/ii/menu10.png" alt="�������� ��� ������� �����������" /><br />
                <span class="menu-name">��������<br />��� ������� �����������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/11/"><img src="<%=AppPath %>/ii/menu11.png" alt="�������� ��� �������" /><br />
                <span class="menu-name">��������<br />��� �������</span></a>
                </div>
            </div>
            <div class="item-top-menu-flex">
            <div class="t-item-top-menu-flex">                
                <a href="<%=AppPath %>/catalog/12/"><img src="<%=AppPath %>/ii/menu12.png" alt="������������� ������" /><br />
                <span class="menu-name">�������������<br />������</span></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        
        <div class="top-mmenu">
           
           <div class="row no-mrgn">
            <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/sale.aspx"><img class="img-response" src="<%=AppPath %>/ii/mmenu2_sale.gif" alt="SALE" /></a></div>
            <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/3/"><img class="img-response" src="<%=AppPath %>/ii/mmenu1.gif" alt="������ ��� �����" /></a></div>
           <%--<div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/1/"><img class="img-response" src="<%=AppPath %>/ii/mmenu2.gif" alt="������" /></a></div>--%>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/2/"><img class="img-response" src="<%=AppPath %>/ii/mmenu3.gif" alt="������� �����" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/4/"><img class="img-response" src="<%=AppPath %>/ii/mmenu4.gif" alt="������ ��� �����" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/6/"><img class="img-response" src="<%=AppPath %>/ii/mmenu5.gif" alt="������ ����������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/5/"><img class="img-response" src="<%=AppPath %>/ii/mmenu6.gif" alt="���������� ��������, ��������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/7/"><img class="img-response" src="<%=AppPath %>/ii/mmenu7.gif" alt="������������ ��������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/8/"><img class="img-response" src="<%=AppPath %>/ii/mmenu8.gif" alt="������ ��� ������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/10/"><img class="img-response" src="<%=AppPath %>/ii/mmenu9.gif" alt="�������� ��� ������� �����������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/9/"><img class="img-response" src="<%=AppPath %>/ii/mmenu10.gif" alt="�������� ������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/11/"><img class="img-response" src="<%=AppPath %>/ii/mmenu11.gif" alt="�������� ��� ���������" /></a></div>
           <div class="col-xs-3 no-brd"><a href="<%=AppPath %>/catalog/12/"><img class="img-response" src="<%=AppPath %>/ii/mmenu12.gif" alt="������������� ������" /></a></div>
           </div>
           
        </div>
        
        <div class="top-tabmenu">
            <div class="row no-mrgn">
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/sale.aspx"><img class="img-response" src="<%=AppPath %>/ii/mmenu2_sale.gif" alt="������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/3/"><img class="img-response" src="<%=AppPath %>/ii/mmenu1.gif" alt="������ ��� �����" /></a></div>
               <%--<div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/1/"><img class="img-response" src="<%=AppPath %>/ii/mmenu2.gif" alt="������" /></a></div>--%>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/2/"><img class="img-response" src="<%=AppPath %>/ii/mmenu3.gif" alt="������� �����" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/4/"><img class="img-response" src="<%=AppPath %>/ii/mmenu4.gif" alt="������ ��� �����" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/11/"><img class="img-response" src="<%=AppPath %>/ii/mmenu11.gif" alt="�������� ��� ���������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/12/"><img class="img-response" src="<%=AppPath %>/ii/mmenu12.gif" alt="������������� ������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/6/"><img class="img-response" src="<%=AppPath %>/ii/mmenu5.gif" alt="������ ����������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/5/"><img class="img-response" src="<%=AppPath %>/ii/mmenu6.gif" alt="���������� ��������, ��������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/7/"><img class="img-response" src="<%=AppPath %>/ii/mmenu7.gif" alt="������������ ��������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/8/"><img class="img-response" src="<%=AppPath %>/ii/mmenu8.gif" alt="������ ��� ������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/10/"><img class="img-response" src="<%=AppPath %>/ii/mmenu9.gif" alt="�������� ��� ������� �����������" /></a></div>
               <div class="col-xs-2 no-brd"><a href="<%=AppPath %>/catalog/9/"><img class="img-response" src="<%=AppPath %>/ii/mmenu10.gif" alt="�������� ������" /></a></div>                              
           </div>
        </div>
        
        <div class="clearfix"></div>
    </div>
    </div>
    <div class="clearfix"></div>
</div>

<div class="clearfix"></div>

<asp:PlaceHolder ID="phSubHeaderCatalog" EnableViewState="false" Visible="false" runat="server">
    <div class="container">
    <div class="container-block office-block">        
            <asp:PlaceHolder ID="phCatOffice" EnableViewState="false" Visible="false" runat="server">           
                <a class="subHeaderCatalog-office" href="https://www.office-zakaz.ru/" target="_blank"><img class="subHeaderCatalogimg" src="<%=AppPath %>/ii/cat-office.jpg" alt="������� � ������� ����-�����"></a>            
            </asp:PlaceHolder>
        <div class="subHeaderCatalog">
            <asp:Image ID="imgCatalogSubHeader" CssClass="img-response" runat="server" />                        
        </div>
    </div>
    </div>
</asp:PlaceHolder>	

<div class="container">
<div class="container-block">    
        <iwc:navigator id="navMain" runat="server" rootname="�������" cssclass="navMain" partdivider="<i class='fa fa-long-arrow-right fan' aria-hidden='true'></i>" />
        <iwc:contenttitle visible="true" id="ContTitle" runat="server" titleformat="<h1 class='main-title'>{0}</h1>" />
        <cc1:container id="contDefault" runat="server"></cc1:container>
        
        <div class="separ"></div>
        <div class="title-contant">����� ������?</div>
        <div class="row">
        <div class="col-md-4">
            <div class="help-title">����� ������ � ������ ������</div>
            <div class="help-tel gilroy-font">+7 (4942) 440-888</div>
            <div class="help-descr"></div>
            <div class="help-form">
                <input type="text" name="helpName" placeholder="������� ���">
                <input type="text" name="helpPhone" placeholder="������� �������">
                <div class="btn-send call-call">�������� ������</div>
            </div>
        </div>
        <div class="col-md-4">
        <div class="help-title">����������� �� ��������</div>        
        <div class="help-descr">����������� �� ���� �������� � ����������� ��������� ���������� � �������� � ������.</div>
        <div class="help-form" style="margin-top:20px;">            
            <input type="text" name="mailMail" placeholder="������� E-mail">
            <div class="btn-send call-mail" style="margin-top:18px;">����������� �� ��������</div>
        </div>
        </div>
        <div class="col-md-4">
        <div class="help-title">�� ���-�� ���������� ��� � ��� ���� ���������?</div>        
        <div class="help-descr">��� ��������� �������� ����� ������ �������� ���� �����. ��� ����� ����� ���� ������!</div>
        <div class="help-form" style="margin-top:79px;">
            <div class="btn-send call-complaint" style="margin-top:39px;">������ � ����������</div>
        </div>
        </div>
        </div>       
</div> 
</div>

<div class="container">
<div class="container-block">
    <div class="row">    
        <div class="col-md-12">
            <div class="lang-version">
                <span>
                <a href="<%=AppPath %>/en/"><img src="<%=AppPath %>/ii/en.png" alt="English version" /></a>&nbsp;<a href="<%=AppPath %>/en/">English version</a> 
                </span>
                <span>
                <a href="<%=AppPath %>/cn/"><img src="<%=AppPath %>/ii/cn.png" alt="Chinese version" /></a>&nbsp;<a href="<%=AppPath %>/cn/">Chinese version</a>
                </span>
            </div>
        </div>   
    </div>
</div>
</div>

<footer>
    <div class="container">
    <div class="container-block">
        <div class="row">
        <div class="col-md-3">
            <div><a href="<%=AppPath %>/">�������</a></div>
            <div><a href="<%=AppPath %>/about/">� ���</a></div>
            <div><a href="<%=AppPath %>/suppliers/">���� ����������</a></div>
            <div><a href="<%=AppPath %>/policy/">�������� � ��������� ��������� ������������ ������</a></div>
            <div><a href="<%=AppPath %>/delivery/">���������</a></div>
        </div>
        <div class="col-md-3">
            <div><a href="<%=AppPath %>/about/black/">������ ������</a></div>
            <div><a href="<%=AppPath %>/ved/">���</a></div>
            <div><a href="<%=AppPath %>/potential/">������������� �����������</a></div>
            <div><a href="<%=AppPath %>/about/job/">��������</a></div>
            <div><a href="<%=AppPath %>/news/">�������</a></div>
            <div><a href="<%=AppPath %>/contacts/">��������</a></div>
            <div><a href="<%=AppPath %>/my/">������ �������</a></div>
        </div>
        <div class="col-md-3">
            <div><a href="<%=AppPath %>/catalog/1/">������ ��� �����</a></div>
            <div><a href="<%=AppPath %>/catalog/2/">������ �������</a></div>
            <div><a href="<%=AppPath %>/catalog/3/">������� �����</a></div>
            <div><a href="<%=AppPath %>/catalog/4/">������ ��� �����</a></div>
            <div><a href="<%=AppPath %>/catalog/5/">���������� ��������. ��������</a></div>
            <div><a href="<%=AppPath %>/catalog/6/">������ �����������</a></div>
            <div><a href="<%=AppPath %>/catalog/7/">������������ ��������</a></div>
            <div><a href="<%=AppPath %>/catalog/8/">������ ��� ���� � ������</a></div>
            <div><a href="<%=AppPath %>/catalog/9/">�������� ������</a></div>
            <div><a href="<%=AppPath %>/catalog/10/">�������� ��� ������� �����������</a></div>
        </div>
        <div class="col-md-3">
            <div class="titlefooter">����������� �� ���. ����</div>
            <div class="social-footer">                
                <a target="_blank" href="https://vk.com/mir.upakovki"><img src="<%=AppPath %>/ii/vk_green.jpg" alt="vk" /></a>
                <a target="_blank" href="https://www.instagram.com/mir_upakovki/"><img src="<%=AppPath %>/ii/insta_green.jpg" alt="insta" /></a>
            </div>
            <div class="titlefooter gray gilroy-font">
                2017 ������ �������� "��� ��������"<br />
                156009, �. ��������, ��. ���������, 24<br />
                ���.: +7 (4942) 440-888
            </div>  
            <div class="ya_informer">
                <!-- Yandex.Metrika informer -->
                <a href="https://metrika.yandex.ru/stat/?id=46567563&amp;from=informer"
                target="_blank" rel="nofollow"><img src="https://metrika-informer.com/informer/46567563/3_1_FFFFFFFF_EFEFEFFF_0_uniques"
                style="width:88px; height:31px; border:0;" alt="������.�������" title="������.�������: ������ �� ������� (���������, ������ � ���������� ����������)" class="ym-advanced-informer" data-cid="46567563" data-lang="ru" /></a>
                <!-- /Yandex.Metrika informer -->          
            </div>
        </div>
        <div class="clearfix"></div>
        </div>
    </div>   
    </div>
    <div class="clearfix"></div> 
</footer>                   
    
<div class="clearfix"></div>    
</div><%--main--%>

	<!--[if lt IE 9]>
	<script src="<%=AppPath %>/js/html5shiv/es5-shim.min.js"></script>
	<script src="<%=AppPath %>/js/html5shiv/html5shiv.min.js"></script>
	<script src="<%=AppPath %>/js/html5shiv/html5shiv-printshiv.min.js"></script>
	<script src="<%=AppPath %>/js/respond/respond.min.js"></script>
	<![endif]-->
	<script src="<%=AppPath %>/js/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=AppPath %>/js/jquery-mousewheel/jquery.mousewheel.min.js"></script>	
	<script src="<%=AppPath %>/js/owl-carousel/owl.carousel.min.js"></script>	
	
	<%--<link rel="stylesheet" href="<%=AppPath %>/js/OwlCarousel2/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=AppPath %>/js/OwlCarousel2/dist/assets/owl.theme.default.min.css">
    <script src="<%=AppPath %>/js/OwlCarousel2/dist/owl.carousel.min.js"></script>--%>
	
	<script src="<%=AppPath %>/js/holder.js"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/maskedinput.js"></script>
    <%--ScrollUp--%>
    <link rel="stylesheet" href="<%=AppPath %>/js/ScrollUp/css/themes/image.css">			
    <script type="text/javascript" src="<%=AppPath %>/js/ScrollUp/lib/jquery.easing.min.js"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/ScrollUp/src/jquery.scrollUp.js"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/ScrollUp/initial.js"></script>
    <%--ScrollUp END--%>   
    
    <%--MENU--%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/superfish/1.7.7/js/superfish.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.5.3/core/js/jquery.mmenu.min.all.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/superfish/1.7.7/css/superfish.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/superfish/1.7.7/css/megafish.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.5.3/core/css/jquery.mmenu.all.css">
	<%--MENU END--%>
	
	<script src="<%=AppPath %>/js/special/uhpv-full.min.js?v=1.1" type="text/javascript"></script>
    <script src="<%=AppPath %>/js/special/initial.js" type="text/javascript"></script>
    <link href="<%=AppPath %>/js/special/special.css" rel="stylesheet" />
    
    <script type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/jBox.js"></script>
    <link href="/js/jBox.css" rel="stylesheet">
    
    <!-- cookie -->
    <script src="//yandex.st/jquery/cookie/1.0/jquery.cookie.min.js"></script>    
    
    <%--Add the slick--%>
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/js/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/js/slick/slick-theme.css"/>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/slick/slick.min.js"></script>
	
	<script src="<%=AppPath %>/js/common.js?v=1.39"></script>
	
<%--����� �������� � �������--%>	
<div class="wrapper_popup cart_done text-center">
    <div class="title">������� ������</div>
    <div class="description">����� �������� � �������!</div><br />
    <div class="col-md-6 text-center">
        <div class="btn-ref-cart btn-green">������� � �������</div>
    </div>
    <div class="col-md-6 text-center">
        <div class="btn-close btn-green">���������� �������</div>
    </div>    
    <div class="clearfix"></div>
    <div style="height:20px;"></div>
</div>

<%--������ � �����������--%>
<div class="wrapper_popup block-complaint text-center">
    <div class="title">������ � �����������</div>
    <div class="description">
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">�������</div>
            <input class="gilroy-font" type="text" name="firstnamecomplaint" id="firstnamecomplaint" />
        </div>
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">�������</div>            
            <input class="gilroy-font" type="text" name="phonecomplaint" id="phonecomplaint" />
        </div>
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">���</div>            
            <input class="gilroy-font" type="text" name="lastnamecomplaint" id="lastnamecomplaint" />
        </div>
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">E-mail</div>            
            <input class="gilroy-font" type="text" name="mailcomplaint" id="mailcomplaint" />
        </div>
        <div class="col-md-12 text-left">
            <textarea class="gilroy-font" name="infocomplaint" id="infocomplaint"></textarea>
        </div>
        <div class="col-md-12 text-left">
            <div class="btn-send-green send-complaint">���������</div>
            <br />
        </div>
    </div>
    <div class="thanks hide">���� ������ �������. �� ���������� �� � �������� � ���� � ��������� �����.<br />������� �� ���������!</div>
</div>

<%--�������� ������--%>
<div class="wrapper_popup block-design text-center">
    <div class="title">�������� ������</div>
    <div class="description">
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">�������</div>
            <input class="gilroy-font" type="text" name="firstnamedesign" id="firstnamedesign" />
        </div>
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">�������</div>            
            <input class="gilroy-font" type="text" name="phonedesign" id="phonedesign" />
        </div>
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">���</div>            
            <input class="gilroy-font" type="text" name="lastnamedesign" id="lastnamedesign" />
        </div>
        <div class="col-md-6 text-left"><div class="popup-form-attr-name">E-mail</div>            
            <input class="gilroy-font" type="text" name="maildesign" id="maildesign" />
        </div>
        <div class="col-md-12 text-left">
            <br />
            <div class="btn-send-green send-design">���������</div>
            <br />
        </div>
    </div>
    <div class="thanks hide">���� ������ �������. ��� ��������� �������� � ���� � ��������� �����.</div>
</div>	

<div class="wrapper_popup help_done text-center">
    <div class="title">�������� ������</div>
    <div class="description">��� �������� �������� � ���� � ��������� �����!</div>
    <div class="clearfix"></div>
    <div style="height:20px;"></div>
</div>

<div class="wrapper_popup mail_done text-center">
    <div class="title">�������� �� ��������</div>
    <div class="description">�������� ���������!<br />���! ������ �� ������ ������ �������� ���������� � ����� ������� � ������.</div>    
    <div class="clearfix"></div>
    <div style="height:20px;"></div>
</div>

<asp:PlaceHolder ID="phPopupFoo" EnableViewState="false" Visible="false" runat="server">
<div class="popup-foo <%--show-popup-foo--%>">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper-popup-foo">
                    <div class="popup-descr">
                        ���������<br />���������� ����������� �������
                    </div>
                    <div class="popup-form">
                        <input type="text" name="popup-mail" placeholder="���������� e-mail" />
                        <div class="btn-popup-form">��������������</div>
                    </div>

                    <div class="close-popup-foo"><img src="/ii/close-popup-foo.jpg" alt="�������" /></div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:PlaceHolder>

</form>

<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter46567563 = new Ya.Metrika({
                    id:46567563,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true,
                    ecommerce:"dataLayer"
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://cdn.jsdelivr.net/npm/yandex-metrica-watch/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/46567563" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'> (function(){ var widget_id = 'gx7Y3Dlapb';var d=document;var w=window;function l(){var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true;s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();
</script>
<!-- {/literal} END JIVOSITE CODE -->
</body>
</html>