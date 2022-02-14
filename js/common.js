$(document).ready(function() {

var modal_options = {    
    preventDefault: true,
    fixed: true,
    reposition: true,
    repositionOnOpen: true,
    repositionOnContent: true,
    overlay: true,
    reload: true,
    addClass: "my_modal",
    //closeButton: 'box'
    onClose: function () {
        //this.destroy();
    }
}

var modal_options_call = { 
    animation: {open: 'move:top', close: 'slide:top'},
    preventDefault: true,
    fixed: true,
    reposition: true,
    repositionOnOpen: true,
    repositionOnContent: true,
    overlay: true,
    reload: true,
    addClass: "my_modal",    
    addClass: 'call_form',
    closeButton: 'box',
    onClose: function () {
        //this.destroy();
    }
}

var modal_options_error = {        
        animation:'flip',
        position:{x:'center',y:'center'},
        autoClose:5000,
        onInit:function(){this.options.color="red";}
    }
var modal_options_succes = {
        animation:'flip',
        position:{x:'center',y:'center'},
        autoClose:5000,
        onInit:function(){this.options.color="green";}
    }
    
    
    var myModal = {};   
    
    var content = {};

	$(".auth_buttons").click(function() {
		$(this).next().slideToggle();
	});
	$(".main_mnu_button").click(function() {
		$(".maian_mnu ul").slideToggle();
	});
	$(".mmbf").click(function() {
		$(".fr-menu ul").slideToggle();
	});

	//OWL: http://owlgraphic.com/owlcarousel/
	var owl = $(".carousel");
	owl.owlCarousel({
		items : 1,
		autoHeight : true
	});
	owl.on("mousewheel", ".owl-wrapper", function (e) {
		if (e.deltaY > 0) {
			owl.trigger("owl.prev");
		} else {
			owl.trigger("owl.next");
		}
		e.preventDefault();
	});
	$(".next_button").click(function() {
		owl.trigger("owl.next");
	});
	$(".prev_button").click(function() {
		owl.trigger("owl.prev");
	});  
	
	/*var owl2 = $(".carousel2");
	owl2.owlCarousel({
		items : 5,
		autoHeight : true,
		loop: true
	});
	owl2.on("mousewheel", ".owl-wrapper", function (e) {
		if (e.deltaY > 0) {
			owl2.trigger("owl.prev");
		} else {
			owl2.trigger("owl.next");
		}
		e.preventDefault();
	});
	$(".next_button2").click(function() {
		owl2.trigger("owl.next");
	});
	$(".prev_button2").click(function() {
		owl2.trigger("owl.prev");
	}); 
	
	var owl3 = $(".carousel3");
	owl3.owlCarousel({
		items : 5,
		autoHeight : true,
		loop: true
	});
	owl3.on("mousewheel", ".owl-wrapper", function (e) {
		if (e.deltaY > 0) {
			owl3.trigger("owl.prev");
		} else {
			owl3.trigger("owl.next");
		}
		e.preventDefault();
	});
	$(".next_button3").click(function() {
		owl3.trigger("owl.next");
	});
	$(".prev_button3").click(function() {
		owl3.trigger("owl.prev");
	});*/
	
	/*OWL END*/
	
	$("#close-fix").click(function() {	    
		$(".msgfix").fadeOut();
	}); 
	
	$(".nav-item").click(function() {    
        $(this).toggleClass("is-active");
        
        if ($( window ).width() > 768)
        {
            if ($(this).hasClass("is-active"))
            {
                $("div.right_panel").animate({left:'300px'},500);
                $("div.right_panel").addClass("fxd-pnl");
            }
            else
            {
                $("div.right_panel").animate({left:0},500);    
                $("div.right_panel").removeClass("fxd-pnl");
            }
        }
        else
        {
              $( "#menu-sub-header" ).slideToggle( "slow", function() {
                // Animation complete.
              });
        }
    })
    
    $(".close_right_panel").click(function() {    
        $(".nav-item").removeClass("is-active");
        $("div.right_panel").animate({left:0},500);    
    })
    
    /*right panel*/
	/*$(".nav-item").toggle(function(){
		$("div.right_panel").animate({right:'205px'},500);}, function() {
		$("div.right_panel").animate({right:0},500);
	});*/
	
	$(".plus-count").on('click', function () {
	    var curr_count = $(this).parents('.count-cart').find('.count');
        var count = curr_count.val();
         if ($.isNumeric(count))
         {
            count++;
            curr_count.val(count);
         }                
    })
    $(".minus-count").on('click', function () {
	    var curr_count = $(this).parents('.count-cart').find('.count');
        var count = curr_count.val();
         if ( $.isNumeric(count) && count > 1 )
         {
            count--;
            curr_count.val(count);
         }                
    })
    
    RefreshCartCount();
    
    /*Добавление товара в корзину*/
    var myModalCartDone = {};
    var myModal = {};
    $('.add-item').on('click', function () {        
    
       var pid = $(this).attr("pid");   
       var prodCount = 0;
       
       if ( $(this).hasClass('isProdItem') ) // если это страница подробного описания товара
       {
        prodCount = parseFloat($(this).parent().parent().find('.count-cart').find('.count').val());         
       }
       else
       {
        prodCount = parseFloat($(this).parent().parent().find('.catalog-price').find('.count-cart').find('.count').val());
       }               
          
       if ($.isNumeric(prodCount))
        {
            //alert(prodCount);
        }           
        else
        {
            var prodCount = 1;
            //alert(prodCount);
        }
        
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                url: "/catalog/cart.ashx?pid=" + pid + "&count=" + prodCount,
                //url: "/Web/catalog/cart.ashx?pid=" + pid + "&count=" + prodCount,
                success: function(data) {  
                RefreshCartCount();                               
                //alert(data);
                
                myModal = new jBox('Modal', modal_options_call);           
                content = $('.cart_done');
                myModal.open().setContent(content); 
                myModalCartDone = myModal;
                            
                /*mc_notice = new jBox('Notice', modal_options_succes);
                mc_notice.setContent("Добавлено в корзину!");*/
                
                //window.parent.$.fancybox.close();
                }
        });         
        
    })
    $('.btn-close').on('click', function () {         
        myModalCartDone.close();
    })
    $('.btn-ref-cart').on('click', function () {         
        window.location.href = '/catalog/cart.aspx';
    })
    /*Добавление товара в корзину КОНЕЦ*/
    
    if ( $('.count-cart-item-cur').length )
    {        
        /*$('.count-cart-item-cur').each(function () {
            var count = $(this).attr("value");
            $(this).val(count);
        });*/
        
        $('.plus-count, .minus-count').on('click', function () {
            var count = $(this).parent('.count-cart').find('.count-cart-item-cur').val();
            $(this).parent('.count-cart').find('input.wide').val(count);  
            RefreshCart($(this));          
        });
        
        $(".count-cart-item-cur").keyup(function() {
            RefreshCart($(this));
        });
    }
    
    
    /*Открытие блоков в корзине по мере ввода*/
    if ($(".finish_order_cont").length)
    {
        var foc = $(".finish_order_cont");
        var foc_count = 4; // кол-во проверяемых полей        
        foc.keyup(function() {
            var foc_yes_count = 0;
            foc.each(function(index) {
                if ($(this).val().length > 0)
                    foc_yes_count++                
            });
            if (foc_count == foc_yes_count)
                $(".wso1").removeClass("disabled_foc");
            else
                {
                    $(".wso1").addClass("disabled_foc");
                    $(".wso2").addClass("disabled_foc");
                    $(".wso3").addClass("disabled_foc");
                }
        });                
    }  
    
   $(".choice-delivery").click(function() {  
        $(".choice-delivery").removeClass("active");
        $(this).addClass("active");
        if ($(".choice-delivery").eq(0).hasClass("active"))
        {
            $(".delivery-cart-map").addClass("show").removeClass("hide");
            $(".delivery-cart-form").addClass("hide").removeClass("show");
            $("#ctl04_hfChoiceDelivery").val("1");
        }
        if ($(".choice-delivery").eq(1).hasClass("active"))
        {
            $(".delivery-cart-form").addClass("show").removeClass("hide");
            $(".delivery-cart-map").addClass("hide").removeClass("show");
            $("#ctl04_hfChoiceDelivery").val("2");
        }
        $(".wso2").removeClass("disabled_foc");
    });
    $(".choice-pay").click(function() {  
        $(".choice-pay").removeClass("active");
        $(this).addClass("active");
        if ($(".choice-pay").eq(1).hasClass("active"))
        {
            $(".rekviz-cart").addClass("show").removeClass("hide");
            $("#ctl04_hfChoicePay").val("2");
        }
        else
        {
            $(".rekviz-cart").addClass("hide").removeClass("show");
            $("#ctl04_hfChoicePay").val("1");
        }
        $(".wso3").removeClass("disabled_foc");
    });
    /*Открытие блоков в корзине по мере ввода КОНЕЦ*/     
    
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
    
    if ($("#eyel").length && $("#eyer").length)
    {
        $(window).mousemove(bodyMouseMove);
        $("#eyel").css( {top: 105, left: 55 } );
        $("#eyer").css( {top: 105, left: 315 } );    
    }   
    
    /*$(".datesel").datepick( );
    $(".datesel").datepick('option', {showAnim: 'fadeIn', showSpeed: 'fast'} );
    $(".datesel").datepick('option', { dateFormat: 'dd.mm.yyyy' } );  */
    
    $('.call-complaint').on('click', function () {         
        myModal = new jBox('Modal', modal_options_call);           
        content = $('.block-complaint');
        myModal.open().setContent(content); 
        myModalCartDone = myModal;
    });
    
    $('.send-complaint').on('click', function () {        
        sendComplaint();
    });
    $('.call-call').on('click', function () {        
        sendCall();
    });
    $('.call-mail').on('click', function () {        
        sendMail();
    });
    
    $('.call-design').on('click', function () {         
        myModal = new jBox('Modal', modal_options_call);           
        content = $('.block-design');
        myModal.open().setContent(content); 
        myModalCartDone = myModal;
    });
    $('.send-design').on('click', function () {        
        sendDesign();
    });
    
    //выбор менеджера в корзине
    var coo;
    if ($.cookie('manager') && $('#ctl13_hfEmailAddressSend').length && $('#ctl13_hfNameSend').length)
    {           
        coo = $.cookie('manager');
        var manager = coo.split("|");
        $('#ctl13_hfNameSend').val(manager[0]);
        $('#ctl13_hfEmailAddressSend').val(manager[1]);
        if ($('.descl-total-cart').length)
            $('.descl-total-cart').html("Ваш менеджер:<br /><span class='little-text'>" + manager[0] + "</span>");
    }
        
    $('.set_manager').on('click', function () {        
        myModal = new jBox('Modal', modal_options_call);           
        content = $('.block-manager');
        myModal.open().setContent(content); 
        myModalCartDone = myModal;
    });
    $('.get_manager').on('click', function () {                            
        var email = $("input[name=manager]:checked").val();
        var name = $("input[name=manager]:checked").prop("title");
        if(!!email && !!name) //Not undefined
        {
            $('#ctl13_hfEmailAddressSend').val(email);
            $('#ctl13_hfNameSend').val(name);
            $('.descl-total-cart').html("Ваш менеджер:<br /><span class='little-text'>" + name + "</span>");
            
            $.cookie('manager', name + "|" + email, {
                expires: 1,
                path: '/',
            });
        }
        myModal.close();
    });        
    //выбор менеджера в корзине КОНЕЦ
    
    $('.slick_slider').slick({
        infinite: true,        
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 5000,
        prevArrow: '<div class="prev_button"><i class="fa fa-angle-left"></i></div>',
        nextArrow: '<div class="next_button"><i class="fa fa-angle-right"></i></div>',
        adaptiveHeight: true,
        dots: true
    });
    $('.slick_slider2').slick({
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        /*autoplay: true,
        autoplaySpeed: 5000,*/
        prevArrow: '<div id="prev" class="prev_button2"><img class="img-slr-btn" src="/ii/prev.png" alt="" /></div>',
        nextArrow: '<div id="next" class="next_button2"><img class="img-slr-btn" src="/ii/next.png" alt="" /></div>',                
        responsive: [
            {
              breakpoint: 1190,
              settings: {
                slidesToShow: 4,
                slidesToScroll: 4,                
              }
            },
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3,                
              }
            },
            {
              breakpoint: 660,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1
              }
            }            
        ]
    });
    $('.slick_slider3').slick({
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        /*autoplay: true,
        autoplaySpeed: 5000,*/
        prevArrow: '<div id="prev" class="prev_button3"><img class="img-slr-btn" src="/ii/prev.png" alt="" /></div>',
        nextArrow: '<div id="next" class="next_button3"><img class="img-slr-btn" src="/ii/next.png" alt="" /></div>',
        responsive: [
            {
              breakpoint: 1190,
              settings: {
                slidesToShow: 4,
                slidesToScroll: 4,                
              }
            },
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3,                
              }
            },
            {
              breakpoint: 660,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1
              }
            }
        ]
    });
    
    /*согласие на обаботку данных в корзине*/
    if ($("#agree_cart").length)
    {
        if($("#agree_cart").is(":checked")) {
                $('.btn-order-it').removeAttr('disabled').removeClass("btn-disabled");
        }
        else
        {
            $('.btn-order-it').attr('disabled','disabled').addClass("btn-disabled");
        } 
        $('#agree_cart').change(function() {
            if($(this).is(":checked")) {
                $('.btn-order-it').removeAttr('disabled').removeClass("btn-disabled");
            }
            else
            {
                $('.btn-order-it').attr('disabled','disabled').addClass("btn-disabled");
            }        
        });
    }
    /*согласие на обаботку данных в корзине КОНЕЦ*/
    
    //Добавить в избранное
    $(".fav-cart").click(function() {
        if (!$(this).hasClass("favorite"))
        {
            var pid = $(this).attr("pid");        
            $.ajax({
                    async: true,
                    cache: false,
                    dataType: 'html',
                    reload: false,
                    getData: 'data-ajax',
                    setContent: true,
                    spinner: false,
                    url: "/catalog/favorite.ashx?pid=" + pid + "&type=add",
                    //url: "/Web/catalog/favorite.ashx?pid=" + pid + "&type=add",
                    success: function(data) { 
                        if (data == "1")            
                        {
                            mc_notice = new jBox('Notice', modal_options_succes);
                            mc_notice.setContent("Добавлено в раздел Избранное!");
                        }
                    }
            });
        }
        else
        {
            var pid = $(this).attr("pid");   
            /*if (!$(this).hasClass("favorite"))
            {
               $(this).parents(".catalog-item").parents(".slick-slide").detach();
            }*/
            $.ajax({
                    async: true,
                    cache: false,
                    dataType: 'html',
                    reload: false,
                    getData: 'data-ajax',
                    setContent: true,
                    spinner: false,
                    url: "/catalog/favorite.ashx?pid=" + pid + "&type=del",
                    //url: "/Web/catalog/favorite.ashx?pid=" + pid + "&type=del",
                    success: function(data) { 
                        if (data == "1")            
                        {                        
                            mc_notice = new jBox('Notice', modal_options_succes);
                            mc_notice.setContent("Удалено из раздела Избранное!");
                        }
                    }
            });
        }
        changeFavorite($(this)); 
    });
    
    $(".del_favorite").click(function() {
        var pid = $(this).attr("pid");   
        $(this).parents(".catalog-item").parents(".slick-slide").detach();
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                url: "/catalog/favorite.ashx?pid=" + pid + "&type=del",
                //url: "/Web/catalog/favorite.ashx?pid=" + pid + "&type=del",
                success: function(data) { 
                    if (data == "1")            
                    {                        
                        mc_notice = new jBox('Notice', modal_options_succes);
                        mc_notice.setContent("Удалено из раздела Избранное!");
                    }
                }
        });
    });   
    
    catalogOffice();
    $( window ).resize(function() {
      catalogOffice();
    });

    //popup-catalog
    if ($(".popup-foo").length) {

        // Проверим, есть ли запись в куках о посещении посетителя  
        // Если записи нет - выполняем
        if (!$.cookie('was0')) {
            setTimeout(function () {
                $(".popup-foo").fadeIn();
                // Запомним в куках, что посетитель к нам уже заходил  
                $.cookie('was0', true, {
                    expires: 0.5,
                    path: '/'
                }); 
            }, 60000 /*3000*/);
        } else {
            //alert('0');
        }               
    }

    $(".close-popup-foo").click(function () {
        $(".popup-foo").fadeOut();
    });
    $(".btn-popup-form").click(function () {
        $('.none').removeClass('none');
        if ($('input[name=popup-mail]').val() === '') {
            $('input[name=popup-mail]').addClass('none');
         }        
        else {
            popupSend();
        }
    });
    //popup-catalog КОНЕЦ
     
        
});//READY END

function catalogOffice()
{
    if ($(".subHeaderCatalog").length)
    {
        var shch = $(".subHeaderCatalog").height();                
        $(".subHeaderCatalog").css("width", "100%");
        $(".subHeaderCatalog-office").css("height", shch).css("left", "100%");        
        var shcow = $(".subHeaderCatalogimg").width();
        $(".subHeaderCatalog-office").css("marginLeft", -1 * shcow);
        //console.log(shcow);
        $(".subHeaderCatalog-office").css("right", "0");
        $(".subHeaderCatalog-office").css("top", "0");        
        $(".subHeaderCatalog").css("width", "100%");        
        $(".subHeaderCatalog-office").css("right", "0");
    }
}

function changeFavorite(_this)
{
    _this.toggleClass("favorite");
    _this.toggleClass("del_favorite");
    if (_this.hasClass("favorite"))
    {        
        _this.find("img").attr("src","/ii/fav_cart_fill.png");
    }
    else
    {
        _this.find("img").attr("src","/ii/fav_cart.png");
    }
}

/*(function() {
  $(function() {
    var $body, $overlay, $reduced, $sidebar, $trigger;
    $sidebar = $('@sidebar');
    $reduced = $('@search, @cart, @cart @trigger, @subheader');
    $body = $('body');
    $trigger = $('@sidebarTrigger');
    $overlay = $('@overlay');
    window.showSidebar = function() {
      $sidebar.addClass('is-visible');
      $reduced.addClass('is-reduced');
      $body.addClass('is-locked');
      $trigger.addClass('is-active');
      $(document).on('keyup.closeSidebar', function(e) {
        if (e.keyCode === 27) {
          return hideSidebar();
        }
      });
      return $overlay.on('click.sidebar', function() {
        return hideSidebar();
      });
    };
    window.hideSidebar = function() {
      $sidebar.removeClass('is-visible');
      $reduced.removeClass('is-reduced');
      $body.removeClass('is-locked');
      $trigger.removeClass('is-active');
      $(document).off('keyup.closeSidebar');
      return $overlay.off('click.sidebar');
    };
    return $trigger.on('click', function() {
      if ($trigger.hasClass('is-active')) {
        return hideSidebar();
      } else {
        return showSidebar();
      }
    });
  });

}).call(this);*/

function RefreshCartCount()
{
    $.ajax({
            async: true,
            cache: false,
            dataType: 'html',
            reload: false,
            getData: 'data-ajax',
            setContent: true,
            spinner: false,
            url: "/catalog/cartCount.ashx",
            //url: "/Web/catalog/cartCount.ashx",
            success: function(data) {                 
                var splits = data.split('|');
                $(".header-cart-count").html(splits[0]);
                $(".header-cart-price").html(splits[1]);
            }
     });
}

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
    if (tmsNext == 5) tmsNext = 0;
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
    $("#tm").animate({backgroundPositionX: (-1140 * next) + "px" }, 500);
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

function sendComplaint()
{
    $('.none').removeClass('none');
	if($('input[name=firstnamecomplaint]').val()==''||$('input[name=phonecomplaint]').val()==''||$('input[name=lastnamecomplaint]').val()==''||$('input[name="mailcomplaint]').val()==''||$('textarea[name=infocomplaint]').val()=='') 
	{
		if($('input[name=firstnamecomplaint]').val()=='') {
			$('input[name=firstnamecomplaint]').addClass('none');
		}
		if($('input[name=phonecomplaint]').val()=='') {
			$('input[name=phonecomplaint]').addClass('none');
		}
		if($('input[name=lastnamecomplaint]').val()=='') {
			$('input[name=lastnamecomplaint]').addClass('none');
		}
		if($('input[name=mailcomplaint]').val()=='') {
			$('input[name=mailcomplaint]').addClass('none');
		}
		if($('textarea[name=infocomplaint]').val()=='') {
			$('textarea[name=infocomplaint]').addClass('none');
		}
	}
	else
	{	
	    var firstnamecomplaint = $('input[name=firstnamecomplaint]').val();
	    var phonecomplaint = $('input[name=phonecomplaint]').val();
	    var lastnamecomplaint = $('input[name=lastnamecomplaint]').val();
	    var mailcomplaint = $('input[name=mailcomplaint]').val();
	    var infocomplaint = $('textarea[name=infocomplaint]').val();	    
	    $('.none').removeClass('none');
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                //url: "/Web/feedback.ashx?type=complaint&firstnamecomplaint=" + firstnamecomplaint + "&phonecomplaint=" + phonecomplaint + "&lastnamecomplaint=" + lastnamecomplaint + "&mailcomplaint=" + mailcomplaint + "&infocomplaint=" + infocomplaint,                
                url: "/feedback.ashx?type=complaint&firstnamecomplaint=" + firstnamecomplaint + "&phonecomplaint=" + phonecomplaint + "&lastnamecomplaint=" + lastnamecomplaint + "&mailcomplaint=" + mailcomplaint + "&infocomplaint=" + infocomplaint,                
                success: function(data) {  
                    if (data == "1")               
                    {
                        //alert("В ближайшее время с вами свяжется консультант!");
                        $('input[name=firstnamecomplaint]').val('');
				        $('input[name=phonecomplaint]').val('');
				        $('input[name=lastnamecomplaint]').val('');
				        $('input[name=mailcomplaint]').val('');
				        $('textarea[name=infocomplaint]').val('');
                        $('.block-complaint').find('.thanks').removeClass('hide');
                        $('.block-complaint').find('.description').addClass('hide');
                    }
                    else
                    {
                        alert("Отправка невозможна!");
                    }
                }
        });  
    }    
}

function sendDesign()
{
    $('.none').removeClass('none');
	if($('input[name=firstnamedesign]').val()==''||$('input[name=phonedesign]').val()==''||$('input[name=lastnamedesign]').val()==''||$('input[name="maildesign]').val()=='') 
	{
		if($('input[name=firstnamedesign]').val()=='') {
			$('input[name=firstnamedesign]').addClass('none');
		}
		if($('input[name=phonedesign]').val()=='') {
			$('input[name=phonedesign]').addClass('none');
		}
		if($('input[name=lastnamedesign]').val()=='') {
			$('input[name=lastnamedesign]').addClass('none');
		}
		if($('input[name=maildesign]').val()=='') {
			$('input[name=maildesign]').addClass('none');
		}
	}
	else
	{	
	    var firstnamedesign = $('input[name=firstnamedesign]').val();
	    var phonedesign = $('input[name=phonedesign]').val();
	    var lastnamedesign = $('input[name=lastnamedesign]').val();
	    var maildesign = $('input[name=maildesign]').val();    
	    $('.none').removeClass('none');
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                //url: "/Web/feedback.ashx?type=design&firstnamedesign=" + firstnamedesign + "&phonedesign=" + phonedesign + "&lastnamedesign=" + lastnamedesign + "&maildesign=" + maildesign,                
                url: "/feedback.ashx?type=design&firstnamedesign=" + firstnamedesign + "&phonedesign=" + phonedesign + "&lastnamedesign=" + lastnamedesign + "&maildesign=" + maildesign,                
                success: function(data) {  
                    if (data == "1")               
                    {
                        //alert("В ближайшее время с вами свяжется консультант!");
                        $('input[name=firstnamedesign]').val('');
				        $('input[name=phonedesign]').val('');
				        $('input[name=lastnamedesign]').val('');
				        $('input[name=maildesign]').val('');
                        $('.block-design').find('.thanks').removeClass('hide');
                        $('.block-design').find('.description').addClass('hide');
                    }
                    else
                    {
                        alert("Отправка невозможна!");
                    }
                }
        });  
    }    
}

function sendCall()
{
     $('.none').removeClass('none');
	if($('input[name=helpName]').val()==''||$('input[name=helpPhone]').val()=='') 
	{
		if($('input[name=helpName]').val()=='') {
			$('input[name=helpName]').addClass('none');
		}
		if($('input[name=helpPhone]').val()=='') {
			$('input[name=helpPhone]').addClass('none');
		}		
	}
	else
	{	
	    var modal_options_call = { 
        animation: {open: 'move:top', close: 'slide:top'},
        preventDefault: true,
        fixed: true,
        reposition: true,
        repositionOnOpen: true,
        repositionOnContent: true,
        overlay: true,
        reload: true,
        addClass: "my_modal",    
        addClass: 'call_form',
        closeButton: 'box',
        onClose: function () {
            //this.destroy();
        }
        }
        
	    var helpName = $('input[name=helpName]').val();
	    var helpPhone = $('input[name=helpPhone]').val();	    
	    $('.none').removeClass('none');
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                //url: "/Web/feedback.ashx?type=help&helpName=" + helpName + "&helpPhone=" + helpPhone,               
                url: "/feedback.ashx?type=help&helpName=" + helpName + "&helpPhone=" + helpPhone,               
                success: function(data) {
                    if (data == "1")               
                    {
                        //alert("В ближайшее время с вами свяжется консультант!");
                        $('input[name=helpName]').val('');
				        $('input[name=helpPhone]').val('');	
				        var content = {};
                        var myModalCartDone = {};
                        var myModal = {};
				        myModal = new jBox('Modal', modal_options_call);           
                        content = $('.help_done');
                        myModal.open().setContent(content); 
                        myModalCartDone = myModal;			        
                    }
                    else
                    {
                        alert("Отправка невозможна!");
                    }
                }
        });  
    }  
}

function sendMail()
{
    $('.none').removeClass('none');
	if($('input[name=mailMail]').val()=='') 
	{
		if($('input[name=mailMail]').val()=='') {
			$('input[name=mailMail]').addClass('none');
		}	
	}
	else
	{	
	    var modal_options_call = { 
        animation: {open: 'move:top', close: 'slide:top'},
        preventDefault: true,
        fixed: true,
        reposition: true,
        repositionOnOpen: true,
        repositionOnContent: true,
        overlay: true,
        reload: true,
        addClass: "my_modal",    
        addClass: 'call_form',
        closeButton: 'box',
        onClose: function () {
            //this.destroy();
        }
        }
        
	    var mailMail = $('input[name=mailMail]').val();
	    $('.none').removeClass('none');
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                //url: "/Web/feedback.ashx?type=mail&mailMail=" + mailMail,
                url: "/feedback.ashx?type=mail&mailMail=" + mailMail,
                success: function(data) {  
                    if (data == "1")               
                    {
                        //alert("В ближайшее время с вами свяжется консультант!");
                        $('input[name=mailMail]').val('');                        
                        var content = {};
                        var myModalCartDone = {};
                        var myModal = {};
				        myModal = new jBox('Modal', modal_options_call);           
                        content = $('.mail_done');
                        myModal.open().setContent(content); 
                        myModalCartDone = myModal;			                                
                    }
                    else
                    {
                        alert("Отправка невозможна!");
                    }
                }
        });  
    } 
}

function clearCookieManager()
{
    $.cookie('manager', null);
}

function RefreshCart(_this)
{                
        var curr_count = _this.parents(".quant_inner").find("input.wide");       
        var curr_count_val =  curr_count.val();
        var name_cart = curr_count.attr("name");        
        if ($.isNumeric(curr_count_val))
        {
            //alert(curr_count_val);
            $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                url: "/catalog/cartRefresh.ashx?count=" + curr_count_val + "&name=" + name_cart,
                //url: "/Web/catalog/cartRefresh.ashx?count=" + curr_count_val + "&name=" + name_cart,
                success: function(data) {                 
                    var splits = data.split('|');                    
                    curr_count.val(splits[0]);
                    $(".price-total-cart").html(splits[1]);
                    var cart_id = splits[3];
                    var curr_amount = _this.parents().parents().parents().find(".price-cart-item[pci='" + cart_id + "']");
                    curr_amount.html(splits[2]);
                    RefreshCartCount();
                }
            });                               
        }
}

function recall_header()
{    
    var destination = $(".call-call").offset().top;
    jQuery("html:not(:animated),body:not(:animated)").animate({
      scrollTop: destination
    }, 1000);
    $(".call-call").click();
}

function popupSend() {
    var mail = $('input[name=popup-mail]').val();
    $('.none').removeClass('none');
    $.ajax({
        async: true,
        cache: false,
        dataType: 'html',
        reload: false,
        getData: 'data-ajax',
        setContent: true,
        spinner: false,
        //url: "/Web/feedback.ashx?type=mail&mailMail=" + mailMail,
        url: "/feedback.ashx?type=popup&mail=" + mail,
        success: function (data) {
            if (data == "1") {
                //alert("В ближайшее время с вами свяжется консультант!");
                $('input[name=popup-mail]').val('');
                $(".close-popup-foo").click();
                var content = {};                
                var myModal = {};
                var modal_options_call = {
                    animation: 'flip',
                    addClass: 'popup_form',
                    position: { x: 'center', y: 'center' },
                    autoClose: 5000,                    
                    closeButton: 'box',
                    onInit: function () { this.options.color = "green"; }
                }
                myModal = new jBox('Modal', modal_options_call);
                content = "<p>Ваша заявка отправлена!</p><p>Теперь Вы будете получать обновления первыми!</p>";
                myModal.open().setContent(content);                
            }
            else {
                alert("Отправка невозможна!");
            }
        }
    });
}