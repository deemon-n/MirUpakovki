<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="about_black_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<style type="text/css">
 body {background-color:#000 !important; color: #fff !important;}
 #main, #sub-header, footer {background-color:#000 !important; color: #fff !important;}
 #sub-header a, footer a {color: #fff;}
</style>

<p>¬ данный список попадают компании, не выполнившие услови€ по договорам и имеющие большие задолженности по оплате.</p>


<div class="clearfix"></div>

<iwc:contentbox runat="server" id="cbBlack" Code="Black" />

<div class="clearfix"></div>

<div id="blackeyes">
    <img class="eye" id="eyel" alt="" src="<%=AppPath %>/ii/eye.png" />
    <img class="eye" id="eyer" alt="" src="<%=AppPath %>/ii/eye.png" />
</div>

<div class="clearfix"></div>


<%--<script type="text/ecmascript">
$(document).ready( function() {
    $(window).mousemove(bodyMouseMove);
    $("#eyel").css( {top: 105, left: 55 } );
    $("#eyer").css( {top: 105, left: 315 } );
} ) ;

function bodyMouseMove(ev)
{
    bodyMouseMoveEx(ev, 65, 120, "#eyel");
    bodyMouseMoveEx(ev, 305, 120, "#eyer");
}

var radius = 70;
function bodyMouseMoveEx(ev, deltaX, deltaY, eye)
{
    var x = 0; var y = 0;
    var wwidth = $(window).width();
    var wheight = $(window).height();
    var pos = $("#blackeyes").position();
    var centerX = pos.left + deltaX;
    var centerY = pos.top + deltaY;
    if (ev.pageX <= centerX)
        x = deltaX - radius + (radius * ev.pageX / centerX);
    else
        x = deltaX + (radius * (ev.pageX - centerX) / (wwidth - centerX));
    if (ev.pageY <= centerY)
        y = deltaY - radius + (radius * ev.pageY / centerY);
    else
        y = deltaY + (radius * (ev.pageY - centerY) / (wheight - centerY));
    if (y < 100) y = 100;
    if (y > 180) y = 180;
        
    $(eye).css( {top: y, left: x } );
}
</script>--%>
