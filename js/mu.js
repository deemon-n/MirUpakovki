$(document).ready(function() {

$("#menu2").show();
$("#menu2").css("opacity", 0);

$("a.fancy").fancybox(
    {'overlayOpacity' : 0.7,
     'overlayColor' : '#f8fef8',
     "padding" : 5,
     "imageScale" : false, 
			"zoomOpacity" : false,
			"zoomSpeedIn" : 1000,	
			"zoomSpeedOut" : 1000,	
			"zoomSpeedChange" : 1000, 
			"transitionIn" : 'elastic',
			"transitionOut" : 'elastic',
			"overlayShow" : true, 
			"overlayOpacity" : 0.8,	
			"hideOnContentClick" :false,
			"titlePosition" : 'inside',
			"centerOnScroll" : true
    });
	
    $('.t tr:odd').css('backgroundColor','transparent');
    $('.t tr:even').css('backgroundColor','#FEEDD9');
  
    $("a.fancy:not([norel='1'])").attr({ rel: "group" });
    
    $(".bghover").mouseenter(bghEnter);
    $(".bghover").wrap("<div class='bghoverh'></div>");
    $(".bghover").each(function() {
        var th = $(this);
        if (th.outerWidth() > 0) {
            th.parent().css("width", th.outerWidth());
            th.parent().css("height", th.outerHeight());
        }
    } );
    $("img.bghover").load(bghImgFix);
    
    $(".pmenu").mouseenter(pMenuEnter);
    $(".pmenu").mouseleave(pMenuLeave);
    
    $(".baloon").mouseenter(baloonEnter);
    $(".baloon").mouseleave(baloonLeave);
    
    $(".defvalue").each(function() { var th = $(this); th.val(th.attr("defvalue")); th.css("color", "#ccc"); } );
    $(".defvalue").focus(function() { var th = $(this); var val = th.val(); var dval = th.attr("defvalue"); if (val == dval) { th.val(""); } th.css("color", "#fff"); } );
    $(".defvalue").blur(function() { var th = $(this); var val = th.val(); var dval = th.attr("defvalue"); if (val == "") { th.val(dval); th.css("color", "#ccc"); } } );
    
    $(".tmsel").click(tmsClick);
    window.setTimeout(tmsAuto, 7000);
    
    fListInit();
    
    scrollElInit();
    
    $("#send").click(function() {
        $("#reform").slideUp();
        $("#resent").slideDown();
        $.post( "/sendmail.ashx", 
            { "Письмо": "Главная",
              "Имя": $("#name").val(),
              "Телефон": $("#phone").val()
            },
            function() { location.reload(); } 
        );
    } ) ;
    $("#ssend").click(function() {
        $("#reform").slideUp();
        $("#resent").slideDown();
        $.post( "/sendmail.ashx", 
            { "Письмо": "Потенциальным поставщикам",
              "Имя": $("#name").val(),
              "Телефон": $("#phone").val()
            },
            function() { location.reload(); } 
        );
    } ) ;
    $("#csend").click(function() {
        $.post( "/sendmail.ashx", 
            { "Письмо": "Контакты",
              "Имя": $("#name").val(),
              "Email": $("#email").val(),
              "Сообщение": $("#msg").val()
            },
            function() { location.reload(); }
        );
    } ) ;      
    
    $(".datesel").datepick( );
    $(".datesel").datepick('option', {showAnim: 'fadeIn', showSpeed: 'fast'} );
    $(".datesel").datepick('option', { dateFormat: 'dd.mm.yyyy' } );
}); 

function bghImgFix()
{   // image size is available only after load
    var th = $(this);
    th.parent().css("width", th.outerWidth());
    th.parent().css("height", th.outerHeight());
}

function bghEnter()
{
    var bgh = $(this);
    var d = new Date();
    if (d.getTime() - parseInt(bgh.attr("lastMotion")) < 5000) return;
    bgh.attr("lastMotion", d.getTime());
    var animation = Math.floor(Math.random() * 5);    
    var width = bgh.outerWidth();
    var height = bgh.outerHeight();
    if (animation == 0) {
    bgh
        .animate( { "opacity": 0 }, 120, function() {
            $(this).css( { "position" : "absolute", "left": width } ) ; } )
        .animate( { "left": "-="+width, "opacity" : 1 }, 300, function() {
            $(this).css("position", "static") ;
            $(this).attr("inMotion", "0") ;
        } ); } ;
    if (animation == 1) {
    bgh
        .animate( { "opacity": 0 }, 120, function() {
            $(this).css( { "position" : "absolute", "left": (-1 * width) } ) ; } )
        .animate( { "left": "+="+width, "opacity" : 1 }, 300, function() {
            $(this).css("position", "static") ;
            $(this).attr("inMotion", "0") ;
        } ); } ;
    if (animation == 2) {
    bgh
        .animate( { "opacity": 0 }, 120, function() {
            $(this).css( { "position" : "absolute", "top": height } ) ; } )
        .animate( { "top": "-="+height, "opacity" : 1 }, 300, function() {
            $(this).css("position", "static") ;
            $(this).attr("inMotion", "0") ;
        } ); } ;
    if (animation == 3) {
    bgh
        .animate( { "opacity": 0 }, 120, function() {
            $(this).css( { "position" : "absolute", "top": (-1 * height) } ) ; } )
        .animate( { "top": "+="+height, "opacity" : 1 }, 300, function() {
            $(this).css("position", "static") ;
            $(this).attr("inMotion", "0") ;
        } ); } ;
    if (animation == 4) {
    bgh
        .animate( { "opacity": 0 }, 120)
        .animate( { "opacity" : 1 }, 300, function() {
            $(this).attr("inMotion", "0") ;
        } ); } ;
}

var inMenu = false;
function pMenuEnter()
{
    inMenu = true;
    var menu2 = $("#menu2");
    var pos = $("#menu1").position();
    menu2.css("left", pos.left - 20);
    menu2.css("top", pos.top + 30);
    menu2.slideDown(500);
    menu2.animate({"opacity": 1}, 200);
}

function pMenuLeave()
{
    inMenu = false;
    window.setTimeout(pMenuHide, 500);
}

function pMenuHide()
{
    if (inMenu) return;
    var menu2 = $("#menu2");
    menu2.slideUp(400);
    menu2.animate({"opacity": 0}, 500);
}

var fListCount = 0;
var fListCurr = -1;
function fListInit()
{
    fListCount = $("#face .face").length;
    $("#face .face").show();
    $("#face .face").css("opacity", 0);
    $("#face .name").show();
    $("#face .name").css("opacity", 0);
    $("#face .org").show();
    $("#face .org").css("opacity", 0);
    $("#ftext .ftext").show();
    $("#ftext .ftext").css("opacity", 0);
    for (var f = 0; f < fListCount; f++) { $("#facesel").append("<div number='" + f + "' title='#" + (f+1) + "'></div>"); }
    $("#facesel div").click(fListClick);
    fListMove();
}

function fListMove()
{
    var fListNext = fListCurr + 1;
    if (fListNext == fListCount)
        fListNext = 0;
    fListMoveTo(fListNext);
    window.setTimeout(fListMove, 5000);
}

function fListClick()
{
    fListMoveTo(parseInt($(this).attr("number")));
}

function fListMoveTo(next)
{
    var fListNext = next;
    $("#facesel div").removeClass("sel");
    $("#facesel div[number=" + fListNext + "]").addClass("sel");
    if (fListCurr > -1)
    {        
        $("#face .face:eq(" + fListCurr + ")").animate({"opacity": 0}, 500);
        $("#face .name:eq(" + fListCurr + ")").animate({"opacity": 0}, 500);
        $("#face .org:eq(" + fListCurr + ")").animate({"opacity": 0}, 500);
        $("#ftext .ftext:eq(" + fListCurr + ")").animate({"opacity": 0}, 500);
    }
    $("#face .face:eq(" + fListNext + ")").animate({"opacity": 1}, 500);
    $("#face .name:eq(" + fListNext + ")").animate({"opacity": 1}, 500);
    $("#face .org:eq(" + fListNext + ")").animate({"opacity": 1}, 500);
    $("#ftext .ftext:eq(" + fListNext + ")").animate({"opacity": 1}, 500);
    fListCurr = fListNext;
}

var tmsCurr = 0;
function tmsAuto()
{
    tmsNext();
    window.setTimeout(tmsAuto, 7000);
}

function tmsNext()
{
    var tmsNext = tmsCurr + 1;
    if (tmsNext == 4) tmsNext = 0;
    tmsMoveTo(tmsNext);
}

function tmsPrev()
{
    var tmsNext = tmsCurr - 1;
    if (tmsNext == -1) tmsNext = 2;
    tmsMoveTo(tmsNext);
}

function tmsClick()
{
    tmsMoveTo(parseInt($(this).attr("number")));
}

function tmsMoveTo(next)
{
    tmsCurr = next;
    $("#tmsv").animate({left: (-676 * next) }, 500);
    $("#tm").animate({backgroundPosition: (-980 * next) + "px 0px" }, 500);
    $(".tmsel").removeClass("sel");
    $(".tmsel[number=" + next + "]").addClass("sel");
}

function baloonEnter()
{
    var th = $(this);
    var ba = $("<div class='baloonPopup'>" + th.attr("btext") + "</div>");
    th[0].baloon = ba;
    $("body").append(ba);
    var pos = th.position();
    ba.css("left", pos.left - 50);
    ba.css("top", pos.top + 15);
    ba.show();
    ba.animate({"opacity": 0}, 0);
    ba.animate({"opacity": 1}, 400);
}

function baloonLeave()
{
    var th = $(this);
    th[0].baloon.animate( {"opacity": 0}, 400, function() { $(this).remove(); } );
}

function scrollElInit()
{
    $(".scrollh").each(function() {
        var sch = $(this);
        sch[0].scrollElCount = sch.children().length;
        sch[0].scrollElPrev = 0;
        sch.children().addClass("scrolli");
        sch.children(".scrolli").css("opacity", 0);
        sch.children(".scrolli:eq(0)").css("opacity", 1);
        sch.append($("<img src='/ii/scrolll.png' class='scrolll' />"));
        sch.append($("<img src='/ii/scrollr.png' class='scrollr' />"));
        var sdh = $("<div class='scrolldh'></div>");
        sch.append(sdh);
        for (var i = 0; i < sch[0].scrollElCount; i++)
        {
            var sd = $("<div class='scrolld' index='" + i + "'></div>");
            sdh.append(sd);
        }
        sdh.children(".scrolld:eq(0)").addClass("sel");
    } ) ;
    $(".scrolld").click(scrollElClick);
    $(".scrolll").click(scrollElPrev);
    $(".scrollr").click(scrollElNext);
    window.setTimeout(scrollElMove, 5000);
}

function scrollElMove()
{
    $(".scrollh").each(function() {
        var sch = $(this);
        var current = sch[0].scrollElPrev + 1;
        if (current == sch[0].scrollElCount)
            current = 0;
        scrollElTo(sch, current);
    } ) ;
    window.setTimeout(scrollElMove, 5000);
}

function scrollElClick()
{
    var sd = $(this);
    var sdh = sd.parents(".scrollh");
    scrollElTo(sdh, parseInt(sd.attr("index")));
}

function scrollElPrev()
{
    var sd = $(this);
    var sch = sd.parents(".scrollh");
    var current = sch[0].scrollElPrev - 1;
    if (current == -1)
        current = sch[0].scrollElCount - 1;
    scrollElTo(sch, current);
}

function scrollElNext()
{
    var sd = $(this);
    var sch = sd.parents(".scrollh");
    var current = sch[0].scrollElPrev + 1;
    if (current == sch[0].scrollElCount)
        current = 0;
    scrollElTo(sch, current);
}

function scrollElTo(holder, next)
{
    var prev = holder[0].scrollElPrev;
    holder.find(".scrolld").removeClass("sel");
    holder.find(".scrolld:eq(" + next + ")").addClass("sel");
    holder.children(".scrolli:eq(" + prev + ")").animate( { "opacity": 0 }, 500);
    holder.children(".scrolli:eq(" + next + ")").animate( { "opacity": 1 }, 500);
    holder[0].scrollElPrev = next;
}