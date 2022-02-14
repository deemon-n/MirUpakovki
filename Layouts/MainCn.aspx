<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainCn.aspx.cs" Inherits="MirUpakLayoutCn"
    ValidateRequest="false" %>

<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Schema" TagPrefix="cc1" %>
<%@ Register Assembly="Ideal.WebTruth" Namespace="Ideal.WebTruth.Controls" TagPrefix="iwwt" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js">
<!--<![endif]-->
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=1040, initial-scale=1">
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <!--[if lt IE 7]>
        <p class="browsehappy">You are using <strong>outdated</strong> browser. Please, <a href="http://browsehappy.com/">update browser</a>.</p>
    <![endif]-->

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/bgpos.js"></script>     
    <script type="text/javascript" src="<%=AppPath %>/js/jquery.fancybox.js"></script>     
    <script type="text/javascript" src="<%=AppPath %>/js/jquery.datepick.js"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/jquery.datepick.ru.js"></script>
    <link rel="stylesheet" href="<%=AppPath %>/css/ui.datepick.css" type="text/css" />
    <link rel="stylesheet" href="<%=AppPath %>/css/redmond.datepick.css" type="text/css" />
    <script src="<%=AppPath %>/js/mu.js" type="text/javascript"></script>
    
    <form id="muen" runat="server">
    
        <div id="topleft">
            <div><a href="<%=AppPath %>/en/"><img src="<%=AppPath %>/ii/logoen.png" /></a><br /></div>
            <div class="lang">
                <a href="<%=AppPath %>/"><img src="<%=AppPath %>/ii/ru.png" alt="Russian version" /></a>&nbsp;<a href="<%=AppPath %>/">Russian version</a>
                <a href="<%=AppPath %>/en/"><img src="<%=AppPath %>/ii/en.png" alt="English version" /></a>&nbsp;<a href="<%=AppPath %>/en/">English version</a>
            </div>
        </div>
        <div id="toprght">
            <div class="topmenu"><a href="<%=AppPath %>/cn/about/">關於我們</a></div>
            <div class="topmenu wide"><a href="<%=AppPath %>/cn/suppliers/">为潜在供应商/合作伙伴提供的信息</a></div>
            <div class="topmenu"><a href="<%=AppPath %>/cn/contacts/">聯繫方式</a></div>
        </div>
        
        <div class="clear"></div>
        
        <div id="content">
            <cc1:container id="contDefault" runat="server" />
            <div class="clear"></div>
            <div id="foobar"></div>
            <div id="foo">
                <div class="col">
                    <div><a href="<%=AppPath %>/cn/about/">關於我們</a></div>
                </div>
                <div class="col">
                    <div><a href="<%=AppPath %>/cn/suppliers/">为潜在供应商/合作伙伴提供的信息</a></div>
                </div>
                <div class="col">
                    <div><a href="<%=AppPath %>/cn/contacts/">聯繫方式</a></div>
                </div>
                
                <div>&copy; <%=DateTime.Now.Year %> 在“The World of Package”</div>
                <div>办公地址 156009, Russia, Kostroma, Ubileynaya str., 24</div>
                <div>电话号码 +7 (4942) 440-888</div>
                <div style="margin-top: 20px;">
                    <a href="https://www.facebook.com/gk.mirupakovki" target="_blank"><img src="<%=AppPath %>/ii/ic-fcb.png" /></a>
                    <a href="http://vk.com/gk.mirupakovki"><img src="<%=AppPath %>/ii/ic-vko.png" /></a>
                    <a href="https://twitter.com/Mir_upakovki" target="_blank"><img src="<%=AppPath %>/ii/ic-twi.png" /></a>
                </div>
            </div>
            
        </div>
    
    </form>
    
    <iwwt:webtruthcollector runat="server" id="iwwtStats" />

<script> 
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new
Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) 
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-55089613-1', 'auto');
  ga('send', 'pageview');
</script>

</body>
</html>
