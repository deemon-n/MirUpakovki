<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="MirUpakLayout"
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
<body <%=BodyClass%>>
    <!--[if lt IE 7]>
        <p class="browsehappy">Вы пользуетесь <strong>устаревшим</strong> браузером. Пожалуйста, <a href="http://browsehappy.com/">обновите браузер</a>.</p>
    <![endif]-->

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/bgpos.js"></script>     
    <script type="text/javascript" src="<%=AppPath %>/js/jquery.fancybox.js"></script>     
    <script type="text/javascript" src="<%=AppPath %>/js/jquery.datepick.js"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/jquery.datepick.ru.js"></script>
    <link rel="stylesheet" href="<%=AppPath %>/css/ui.datepick.css" type="text/css" />
    <link rel="stylesheet" href="<%=AppPath %>/css/redmond.datepick.css" type="text/css" />
    <script src="<%=AppPath %>/js/mu.js" type="text/javascript"></script>
    
    <form id="mu" runat="server">
    
        <div id="topleft">
            <div><a href="<%=AppPath %>/"><img src="<%=AppPath %>/ii/logo<%=Bl%>.png" /></a><br /></div>
            <div class="lang">
                <a href="<%=AppPath %>/en/"><img src="<%=AppPath %>/ii/en.png" alt="English version" /></a>&nbsp;<a href="<%=AppPath %>/en/">English version</a>
                <a href="<%=AppPath %>/cn/"><img src="<%=AppPath %>/ii/cn.png" alt="Chinese version" /></a>&nbsp;<a href="<%=AppPath %>/cn/">Chinese version</a>
            </div>
        </div>
        <div id="toprght">
            <div class="topmenu"><a href="<%=AppPath %>/about/" id="menu1" class="pmenu">О компании &#x25be;</a></div>
            <div class="topmenu"><a href="<%=AppPath %>/news/">Новости</a></div>
            <div class="topmenu"><a href="<%=AppPath %>/contacts/">Контакты</a></div>
            <% if (Ideal.Wision.Identity.Manager.IsAuthenticated) { %>
            <div class="topmenu"><a href="<%=AppPath %>/my/">Личный кабинет</a></div>
            <% } else { %>
            <div class="topmenu"><a href="#login" class="fancy" rel="login" norel="1">Личный кабинет</a></div>
            <% } %>
        </div>
        
        <div class="clear"></div>
        
        <div id="content">
            <asp:PlaceHolder ID="phCats" runat="server" Visible="false">
                <div id="cats">
                    <asp:Literal ID="ltCats" runat="server" EnableViewState="false" />
                </div>
            </asp:PlaceHolder>
            <div id="nav"><iwc:navigator id="navMain" runat="server" rootname="Главная" partdivider="&nbsp;<span class='small'>&gt;</span>&nbsp;" /></div>
            <iwc:contenttitle id="ContTitle" runat="server" titleformat="<h1>{0}</h1>" />
            
            <div class="clear"></div>
            
            <cc1:container id="contDefault" runat="server" />
            
            <div class="clear"></div>
            
            <div id="foobar"></div>
            
            <div id="foo">
                <div class="col">
                    <div><a href="/catalog/1/index.aspx">Пищевая упаковка</a></div>                    <div><a href="/catalog/4/index.aspx">Корпоративное обслуживание организаций</a></div>                    <div><a href="/catalog/2/index.aspx">Промышленная упаковка</a></div>                    <div><a href="/catalog/3/index.aspx">Товары для HoReCa</a></div>                    <div><a href="/catalog/5/index.aspx">Сезонные товары</a></div>                    <div><a href="/catalog/6/index.aspx">Товары для отдыха</a></div>
                </div>
                <div class="col">
                    <div><a href="/about/black/index.aspx">Черный список</a></div>                    <div><a href="/about/ved/index.aspx">ВЭД</a></div>                    <div><a href="/about/potential/index.aspx">Потенциальным поставщикам</a></div>                    <div><a href="/about/job/index.aspx">Вакансии</a></div>                    <div><a href="/news/index.aspx">Новости</a></div>                    <div><a href="/contacts/index.aspx">Контакты</a></div>                    <div><a href="/my/index.aspx">Личный кабинет</a></div>
                </div>
                <div class="col">
                    <div><a href="/index.aspx">Главная</a></div>                    <div><a href="/about/index.aspx">О нас</a></div>                    <div><a href="/about/suppliers/index.aspx">Наши поставщики</a></div>                    <div><a href="/about/partners/index.aspx">Наши партнёры</a></div>                    <div><a href="/about/log/index.aspx">Логистика</a></div>
                </div>
                                <div>&copy; <%=DateTime.Now.Year %> Группа компаний «Мир упаковки»</div>                <div>156009, г. Кострома, ул. Юбилейная, 24</div>
                <div>тел.: +7 (4942) 440-888</div>
                <div style="margin-top: 20px;">
                    <a href="https://www.facebook.com/gk.mirupakovki" target="_blank"><img src="<%=AppPath %>/ii/ic-fcb.png" /></a>
                    <a href="http://vk.com/gk.mirupakovki"><img src="<%=AppPath %>/ii/ic-vko.png" /></a>
                    <a href="https://twitter.com/Mir_upakovki" target="_blank"><img src="<%=AppPath %>/ii/ic-twi.png" /></a>
                </div>
            </div>
            
        </div>
        
        <div style="display:none;">
            <div id="login">
            <table align="center" cellpadding="10" cellspacing="0" border="0" runat="server" id="tabLogin" enableviewstate="false">
	            <tr>
		            <td colspan="3">
			            <div style="font-size: 30px; letter-spacing: 1px; font-family: ClearSansThin; font-weight: 300;">ЛИЧНЫЙ КАБИНЕТ</div>
		            </td>
	            </tr>
	            <tr>
		            <td>Электронная &nbsp; &nbsp; <br />почта</td>
		            <td><asp:TextBox runat="server" ID="tbEmail" EnableViewState="false" style="height: 40px; border: solid 1px #999; font-size: 32px;" /></td>
		            <td><asp:RequiredFieldValidator runat="server" ID="rfvLogin" ControlToValidate="tbEmail" ErrorMessage="***" ValidationGroup="login" /></td>
					
	            </tr>
	            <tr>
	                <td>Пароль</td>
		            <td><asp:TextBox runat="server" ID="tbPassword" EnableViewState="false" TextMode="Password" style="height: 40px; border: solid 1px #999; font-size: 32px;" /></td>
		            <td><asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="tbPassword" ErrorMessage="***" CssClass="validator" ValidationGroup="login" /></td>
	            </tr>
	            <tr>
	                <td></td>
	                <td colspan="2">
	                    <asp:Button runat="server" id="btnLogin" CssClass="button" text="ВОЙТИ" onclick="btnLogin_Click" ValidationGroup="login" style="color:#fff; background-color:#159ae1; border-width:0px; width:200px; height: 32px; " />
	                </td>
	            </tr>
	            <tr>
	                <td></td>
	                <td colspan="2">
	                    <a href="<%=Ideal.Wision.Schema.Urls.IdentityRemindPassword%>">Восстановить пароль</a>
	                </td>
	            </tr>
            </table>
            </div>
        </div>
    
    </form>
    
    <div id="menu2" class="pmenu">
        <div><a href="<%=AppPath %>/about/">О нас</a></div>        <div><a href="<%=AppPath %>/about/suppliers/">Наши поставщики</a></div>        <div><a href="<%=AppPath %>/about/partners/">Наши партнёры</a></div>        <div><a href="<%=AppPath %>/about/log/">Логистика</a></div>        <div><a href="<%=AppPath %>/about/black/">Черный список</a></div>        <div><a href="<%=AppPath %>/about/ved/">ВЭД</a></div>        <div><a href="<%=AppPath %>/about/potential/">Потенциальным поставщикам</a></div>
        <div><a href="<%=AppPath %>/about/job/index.aspx">Вакансии</a></div>
    </div>
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
