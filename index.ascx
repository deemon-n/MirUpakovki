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

<div class="title-contant">Распродажа</div>
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

<div class="title-contant">Специальное предложение</div>

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
                   <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
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
                        1 299 руб.
                    </div>           
                    <div class="clearfix"></div>
                   </div>
                   <div class="catalog-add">            
                    <a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add_cart.png" alt="" /></a>
                   </div>
                   <div class="discl-cart">
                    Цена может быть снижена в зависимости от объема покупки
                   </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="catalog-item catalog-item-nmb">
                   <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
                   <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
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
                        1 299 руб.
                    </div>           
                    <div class="clearfix"></div>
                   </div>
                   <div class="catalog-add">            
                    <a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add_cart.png" alt="" /></a>
                   </div>
                   <div class="discl-cart">
                    Цена может быть снижена в зависимости от объема покупки
                   </div>
                </div>
            </div>--%>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</div>

<div class="clearfix"></div>

<div class="title-contant">Топ продаж</div>
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
                hintContent: "Компания 'Мир упаковки'",
                balloonContent: "<p style='text-align:left;margin-bottom:20px;'><img style='float:left;width:40px; padding-right:7px;' src='/ii/logo_map.png' /><b>Выставочный зал компании<br />'Мир упаковки'</b></p><p><b>г.Кострома, ул.Юбилейная, д.24</b></p><div style='clear:both;'></div>Режим работы:<br />Пн-пт: 09:00-18:00<br />Сб: 09:00-14:00<br />Вс: выходной<p><a href='tel:+74942440888'>+7 (4942) 440-888</a></p>"
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

<div style="font-family: ClearSansLight; font-size: 28px; float: left; width: 450px; margin-right:40px; text-align: right; text-transform: uppercase;">Содействие<br />в развитии бизнеса<br /></div>
<div style="font-family: ClearSansLight; font-size: 17px; float: left; width: 450px;">
Оптовые поставки упаковочных материалов,<br />канцелярских товаров, бытовой химии<br />и офисной бумаги</div><div style="height: 40px; overflow:auto; clear: both;">&nbsp;</div><div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-food.png);"><h2 style="font-size: 28px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/1/">Пищевая упаковка</a></h2>    <div class="column">        <div><a href="/catalog/20/">Посуда одноразовая</a></div>        <div><a href="/catalog/21/">Бутылки ПЭТ</a></div>        <div><a href="/catalog/22/">Вакуумные пакеты</a></div>        <div><a href="/catalog/23/">Контейнеры</a></div>        <div><a href="/catalog/24/">Молочная упаковка</a></div>    </div>    <div class="column">        <div><a href="/catalog/25/">Пакеты для сыра</a></div>        <div><a href="/catalog/26/">Подложки, лотки</a></div>        <div><a href="/catalog/27/">Полиграфическая продукция</a></div>        <div><a href="/catalog/28/">Полипропиленовые ведра</a></div>    </div></div><div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-corp.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/4/">Корпоративное обслуживание организаций</a></h2>    <div class="column">        <div><a href="/catalog/46/">Хозяйственные товары</a></div>        <div><a href="/catalog/47/">Канцелярские товары для офиса</a></div>        <div><a href="/catalog/48/">Канцелярские товары для школы</a></div>        <div><a href="/catalog/49/">Бытовая химия</a></div>        <div><a href="/catalog/50/">Бумага</a></div>    </div>    <div class="column">        <div><a href="/catalog/65/">Каталог офис-заказ</a></div>        <div><a href="/catalog/51/">Офисная мебель</a></div>        <div><a href="/catalog/52/">Орг. техника и расходные материалы</a></div>    </div></div><div class="bghover catfull" style="background-image: url(<%=AppPath %>/ii/cat-prom.png);"><h2 style="font-size: 28px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/2/">промышленная упаковка</a></h2>    <div class="column">        <div><a href="/catalog/29/">Гофра упаковка</a></div>        <div><a href="/catalog/30/">Грипперы</a></div>        <div><a href="/catalog/31/">Клейкие ленты</a></div>        <div><a href="/catalog/32/">Коробки картонные</a></div>    </div>    <div class="column">        <div><a href="/catalog/33/">Оборудование и инструмент</a></div>        <div><a href="/catalog/34/">Плёнка</a></div>        <div><a href="/catalog/35/">Плёнка ПВХ</a></div>    </div>    <div class="column">        <div><a href="/catalog/36/">Специальные ленты</a></div>        <div><a href="/catalog/37/">Стретч плёнка</a></div>    </div></div><div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-horeca.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-align: left;" class="nomargin thin">    <a href="/catalog/3/">ТОВАРЫ ДЛЯ HoReCa</a></h2>    <div class="column">        <div><a href="/catalog/38/">Пакеты</a></div>        <div><a href="/catalog/61/">Этикет-лента</a></div>        <div><a href="/catalog/39/">Этикет пистолеты</a></div>        <div><a href="/catalog/45/">Сетка для овощей</a></div>    </div>    <div class="column">        <div><a href="/catalog/44/">Аксессуары для баров и ресторанов</a></div>        <div><a href="/catalog/42/">Бумажно-гигиентическая продукция и диспенсеры</a></div>        <div><a href="/catalog/40/">Ценники и чековая лента</a></div>    </div></div><a href="<%=MirUpak.Model.Variables.BannerLink1 %>"><img src="<%=AppPath %>/ii/banner1.jpg" class="bghover catban" /></a><a href="<%=MirUpak.Model.Variables.BannerLink2 %>"><img src="<%=AppPath %>/ii/banner2.jpg" class="bghover catban" /></a><div class="bghover catquot" style="background-image: url(<%=AppPath %>/ii/cat-season.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/5/">Сезонные товары</a></h2>    <div class="column">        <div><a href="/catalog/55/">Новогодние украшения и елки</a></div>        <div><a href="/catalog/56/">Новогодняя упаковка</a></div>        <div><a href="/catalog/63/">Открытки</a></div>    </div></div><div class="bghover catquot" style="background-image: url(<%=AppPath %>/ii/cat-vac.png);"><h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin">    <a href="/catalog/6/">товары для отдыха</a></h2>    <div class="column">        <div><a href="/catalog/58/">Мебель пластиковая</a></div>        <div><a href="/catalog/59/">Товары для дома</a></div>        <div><a href="/catalog/60/">Товары для пикника</a></div>    </div></div><div class="clear"></div><div id="tm">    <div style="font-family: ClearSansBold; font-size: 30px; font-weight: bold; text-align: center; padding: 20px; padding-top:40px;">СОБСТВЕННЫЕ ТОРГОВЫЕ МАРКИ</div>    <div style="float:left; height:300px; line-height:300px; width:62px; padding-left: 40px;"><img src="<%=AppPath %>/ii/tmleft.png" style="cursor: pointer;" onclick="javascript:tmsPrev();" /></div>    <div style="float:left; width:676px; padding-left:50px; padding-right:50px;">        <div align="center">            <div number="0" class="tmsel sel">JOHN PACK</div>            <div number="1" class="tmsel">РАЗГУЛЯЙ</div>            <div number="2" class="tmsel">GREEN WOOD</div>            <div number="3" class="tmsel">PRISMA</div>        </div>                <div id="tms">            <div id="tmsv">                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-jp.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">JOHN PACK.</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">ЭКСПЕРТ СОВРЕМЕННОЙ УПАКОВКИ</div>                    <div>Торговая марка была основана в 2013 г., но уже прочно завоевала доверие у своих покупателей, за счет своего неизменно высокого  качества, отличной цены и запоминающегося дизайна.</div>                    <a href="/catalog/7/" style="text-decoration:none;"><div class="inspect">ОЗНАКОМИТЬСЯ С ПРОДУКЦИЕЙ</div></a>                </div>                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-ra.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">РАЗГУЛЯЙ.</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">УДАЧНЫЙ ОТДЫХ!</div>                    <div>Торговая марка, созданна в 2006 году. Главной целью процесса разработки была ориентация на удовлетворение эстетических и практических потребностей покупателя. Сегодня ТМ «Разгуляй» занимает на костромском, ярославском и ивановском рынках прочные позиции и благодаря непревзойдённому качеству своей продукции, её привлекательной стоимости и современному дизайну.</div>                    <a href="/catalog/8/" style="text-decoration:none;"><div class="inspect">ОЗНАКОМИТЬСЯ С ПРОДУКЦИЕЙ</div></a>                </div>                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-gw.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">GREEN WOOD</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">Залог чистоты и комфорта</div>                    <div>Торговая марка «Green Wood» вышла в свет в 2014 г., позиционируя себя как товары, призванные содержать ваш дом в чистоте, что является залогом для поддержания уюта и комфорта. Оптимальное соотношение цены и качества товаров не оставило равнодушными клиентов, что постоянно стимулирует развитие марки и расширение торгового ассортимента.</div>                    <a href="/catalog/9/" style="text-decoration:none;"><div class="inspect">ОЗНАКОМИТЬСЯ С ПРОДУКЦИЕЙ</div></a>                </div>                <div class="tm">                    <img src="<%=AppPath %>/ii/logo-pr.png" style="float: left; margin-right: 20px;" />                    <div style="font-family: ClearSansLight; font-size: 28px;">PRISMA</div>                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">Профессионал оценит</div>                    <div>Торговая Марка «PRISMA» зарегистрирована в 2014 году как марка товаров промышленного назначения, для профессионалов. Весь ассортиментный ряд находится в разработке. И скоро мы познакомим Вас с ним.</div>                </div>            </div>        </div>    </div>    <div style="float:left; height:300px; line-height:300px; width:62px; padding-right: 40px;"><img src="<%=AppPath %>/ii/tmrght.png" style="cursor: pointer;" onclick="javascript:tmsNext();" /></div></div><div class="clear"></div><h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">17 лет безупречной работы</h2><img src="<%=AppPath %>/ii/achbar.png" /><div id="achs">    <div class="col">Компания «Мир Упаковки» начал свое существование в 2000 году с небольшого арендованного офиса и склада.</div>    <div class="col">Численность штата фирмы достигла 20 человек, а клиентская база – 500 контрагентов.</div>    <div class="col">ГК «Мир Упаковки» сменила адрес на ныне существующий, отметив новоселье открытием просторного торгового зала. Началось формирование парка грузовых машин.</div>    <div class="col">Начато производство наборов одноразовой посуды. Был сформирован отдел логистики и отдел ВЭД. Запущено производство контейнеров для кондитерских изделий.</div>    <div class="col">ГК «Мир Упаковки» внесена в «Книгу рекордов Костромской области» как самый крупный реализатор упаковочных и расходных материалов.</div>    <div class="col">Площадь складских помещений ГК «Мир Упаковки» достигает 5500м2 . Запущена в работу собственная котельная.</div></div><div class="clear"></div><h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">почему мы лучшие</h2><img src="<%=AppPath %>/ii/best1.png" class="best bghover" /><img src="<%=AppPath %>/ii/best2.png" class="best bghover" /><img src="<%=AppPath %>/ii/best3.png" class="best bghover" /><img src="<%=AppPath %>/ii/best4.png" class="best bghover" /><img src="<%=AppPath %>/ii/best5.png" class="best bghover" /><img src="<%=AppPath %>/ii/best6.png" class="best bghover" /><div class="clear"></div><h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">отзывы наших клиентов</h2><div id="face">    <img src="<%=AppPath %>/ii/faceframe.png" id="frame" />    <img src="<%=AppPath %>/ii/face-igor.jpg" class="face" />    <img src="<%=AppPath %>/ii/face-marina.jpg" class="face" />    <img src="<%=AppPath %>/ii/face-sergey.jpg" class="face" />    <div class="name">никитин павел</div>    <div class="name">смирнова марина</div>    <div class="name">ивлев сергей</div>    <div class="org">ООО «Промпоставка»</div>    <div class="org">ОАО «Весна»</div>    <div class="org">ООО ТГ «Высшая Лига»</div></div><div id="ftext">    <div class="ftext">        <p>Хочу высказать благодарность Группе компаний «Мир упаковки» за своевременное предоставление пищевых контейнеров, стрейч плёнки и скотча с логотипом компании по особому заказу для моего производства.</p>        <p>Было приятно общаться с менеджером, знающим толк в специфике пищевой и промышленной упаковки. Получили действительно несколько очень ценных советов, прислушались и не пожалели. Претензий к обслуживанию со стороны сотрудников компании и к полученному товару нет никаких. Благодарю за порядочность и оперативность.</p>        <p><em>ООО &laquo;Агро-сервис&raquo;</em></p>    </div>    <div class="ftext">        <p>С Группой компании «Мир упаковки» сотрудничаю с момента открытия своей сети магазинов. Хочу сказать, что таких ответственных поставщиков мне еще встречать не доводилось.</p>        <p>Промышленную и пищевую упаковку мы берём только у Группы компаний «Мир упаковки». Ибо это всегда качественный товар, за который потом не приходится краснеть перед клиентом. А для меня, как для владелицы бизнеса, каждый клиент имеет свою ценность. Последний заказ – большая партия нестандартных контейнеров и пакетов типа «майка» с логотипом сети. За задержку сроков получили скидку, что ещё раз подтвердило мое мнение о порядочности и ответственности этой компании. Рекомендую к сотрудничеству.</p>        <p><em>ООО &laquo;Милктрейд&raquo;</em></p>    </div>    <div class="ftext">        <p>Хочу поблагодарить компанию «Мир упаковки» за стабильную и качественную работу! Мы сталкивались на протяжении многих лет с постоянными перебоями и неудобствами в покупке различной упаковки для наших магазинов у других поставщиков.</p>        <p>Сейчас это всё я вспоминаю как страшный сон, и понимаю, что та, копеечная разница в цене, которую мы пытались сэкономить, не стоит даже и грамма нервов. А если учесть те условия сотрудничества, которые нам предложила компания «Мир упаковки», бесперебойную доставку и приятных менеджеров, с которыми даже просто поговорить приятно, то никакой альтернативы и конкурентов у вас даже быть не может ребята!</p>        <p>Спасибо Вам!</p>        <p><em>ООО &laquo;Рубикон&raquo;</em></p>    </div></div><div id="facesel"></div><div class="clear"></div><div id="recall">    <div class="larger" style="color: #fff; margin-bottom: 20px;">Возникли вопросы? Мы вам перезвоним!</div>    <div id="reform">        <input id="name" style="width:320px; margin-right:20px;" class="defvalue" defvalue="имя" />        <input id="phone" style="width:320px; margin-right:20px;" class="defvalue" defvalue="телефон" />        <input id="send" style="width:200px; background-color: #fff; color: #06a6b4; height: 32px; padding:0px;" type="button" value="ОТПРАВИТЬ" />    </div>    <div id="resent">        Спасибо! Мы получили Ваше сообщение!    </div></div>--%>

<br />