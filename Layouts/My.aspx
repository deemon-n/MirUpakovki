<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My.aspx.cs" Inherits="MyLayout" ValidateRequest="false" %>

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
        <div id="content">
            <div id="topleft1">
                <div><a href="<%=AppPath %>/"><img src="<%=AppPath %>/ii/logos.png" /></a></div>
            </div>
            <div id="topleft2">
                <div><strong>Сегодня</strong>: <%=DateTime.Now.ToString("dddd") %>, <%=DateTime.Now.ToShortDateString() %></div>
                <div>Удачного дня!</div>
            </div>
            <div id="toprght1">
                <div class="larger"><%=Customer.Name %></div>
                <div class="larger">ТЕКУЩАЯ СУММА ЗАДОЛЖЕННОСТИ &ndash; <%=Customer.Debt.ToString("n0") %> <span class="rur">p<span>уб.</span></span></div>
            </div>        
            
            <div class="clear"></div>
            <div style="float:left;">&larr; <a href="<%=AppPath %>/index.aspx">Перейти на основной сайт</a></div>
            <div style="float:right;">№ договора: <%=Customer.AgreementNumber %> от <%=Customer.AgreementDate.ToShortDateString() %> (<a href="<%=Customer.AgreementUrl %>">скачать договор</a>) &nbsp; Срок действия: <%=Customer.AgreementFinish.ToShortDateString() %></div>
            <div class="clear"></div>
            
            <div id="ourmanager">
                <a href="<%=AppPath %>/i/mgr/<%=MuManager.Photo.LargeName %>" class="fancy" norel="1">
                <div id="mgr1">
                    <img id="mmask" src="<%=AppPath %>/ii/mgrmask.png" />
                    <img id="mface" src="<%=AppPath %>/i/mgr/<%=MuManager.Photo.PreviewName %>" />
                </div>
                </a>
                <div id="mgr2">
                    <div class="larger">ВАШ МЕНЕДЖЕР</div>
                    <div><%=MuManager.Name %></div>
                    <div><%=MuManager.LastName %></div>
                </div>
                <div id="mgr3">
                    <div class="strong">Телефон:</div>
                    <div><%=MuManager.Phone %></div>
                    <div><%=MuManager.Mobile %></div>
                </div>
                <div id="mgr4">
                    <div class="strong">Email:</div>
                    <div><a style="color:#fff;" href="mailto:<%=MuManager.Email %>"><%=MuManager.Email.Replace("@", " @") %></a></div>
                </div>
                <div id="mgr5">
                    <div><a href="#reqs" class="fancy" style="text-decoration:none; border-bottom: dotted 1px #666;" norel="1">Реквизиты компании поставщика</a></div>
                    <div style="margin-top: 7px;"><input type="button" value="СВЯЗАТЬСЯ" style="color:#fff; background-color:#159ae1; border:solid 1px #fff; width:200px; height: 32px;" onclick="$('#contactsClicker').click(); return false;" /></div>
                    <a id="contactsClicker" class="fancy" style="VISIBILITY: hidden" rel="contacts" norel="1" href="#fform">click me</a>
                </div>
            </div>
        
            <iwc:contenttitle id="ContTitle" runat="server" titleformat="<h1>{0}</h1>" />
            <div class="clear"></div>            
            <cc1:container id="contDefault" runat="server" />            
            <div class="clear"></div>            
            <div id="foobar"></div>            
            <div id="foo">
                <div style="float:right">&larr; <a href="<%=AppPath %>/index.aspx">Перейти на основной сайт</a></div>                <div>&copy; <%=DateTime.Now.Year %> Группа компаний «Мир упаковки»</div>                <div>Личный кабинет</div>
            </div>
        </div>
    </form>
    
    <div style="display:none;">
        <div id="reqs">
            <asp:Literal ID="ltReqs" runat="server" EnableViewState="false" />
        </div>
    </div>
    
    <div style="DISPLAY: none">
        <div id="fform" style="HEIGHT: 600px; FONT-FAMILY: ClearSans; WIDTH: 600px">
        <h2>НАПИСАТЬ НАМ</h2>
        <table cellspacing="0" cellpadding="5" border="0">
            <tbody>
                <tr>
                    <td>&nbsp;</td>
                    <td>Оставьте свои контактные данные и сообщение, и в ближайшее время с вами свяжется наш менеджер.</td>
                </tr>
                <tr>
                    <td valign="middle">
                    <div style="COLOR: #666">Ваше имя</div>
                    </td>
                    <td valign="middle"><input id="name" style="FONT-SIZE: 16px; BORDER-TOP: #666 1px solid; BORDER-RIGHT: #666 1px solid; WIDTH: 400px; BORDER-BOTTOM: #666 1px solid; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; PADDING-LEFT: 5px; BORDER-LEFT: #666 1px solid; PADDING-RIGHT: 5px" /> </td>
                </tr>
                <tr>
                    <td valign="middle">
                    <div style="COLOR: #666">Электронная почта</div>
                    </td>
                    <td valign="middle"><input id="email" style="FONT-SIZE: 16px; BORDER-TOP: #666 1px solid; BORDER-RIGHT: #666 1px solid; WIDTH: 400px; BORDER-BOTTOM: #666 1px solid; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; PADDING-LEFT: 5px; BORDER-LEFT: #666 1px solid; PADDING-RIGHT: 5px" /> </td>
                </tr>
                <tr>
                    <td valign="top">
                    <div style="COLOR: #666">Сообщение</div>
                    </td>
                    <td valign="middle"><textarea id="msg" style="HEIGHT: 300px; WIDTH: 400px"></textarea></td>
                </tr>
                <tr>
                    <td valign="top">&nbsp;</td>
                    <td valign="middle"><input style="HEIGHT: 32px; WIDTH: 150px; COLOR: #fff; TEXT-ALIGN: center; BACKGROUND-COLOR: #159ae1" type="button" value="НАПИСАТЬ НАМ" id="csend" /></td>
                </tr>
            </tbody>
        </table>
        </div>
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