<%@ Control Language="C#" AutoEventWireup="true" CodeFile="assortment.ascx.cs" Inherits="about_assortment" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<div style="width: 980px; margin: 0 auto;" class="assort">

    <div style="height: 40px; overflow: auto; clear: both;">&nbsp;</div>

    <div style="font-family: ClearSansLight; font-size: 28px; float: left; width: 450px; margin-right: 40px; text-align: right; text-transform: uppercase;">
        Содействие<br />
        в развитии бизнеса<br />
    </div>
    <div style="font-family: ClearSansLight; font-size: 17px; float: left; width: 450px;">
        Оптовые поставки упаковочных материалов,<br />
        канцелярских товаров, бытовой химии<br />
        и офисной бумаги
    </div>
    <div style="height: 40px; overflow: auto; clear: both;">&nbsp;</div>
    <div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-food.png);">
        <h2 style="font-size: 28px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin"><a href="/about/catalog.aspx?cid=10">Пищевая упаковка</a></h2>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=6">Посуда одноразовая</a></div>
            <div><a href="/about/catalog.aspx?cid=82">Бутылки ПЭТ</a></div>
            <div><a href="/about/catalog.aspx?cid=115">Вакуумные пакеты</a></div>
            <div><a href="/about/catalog.aspx?cid=79">Контейнеры</a></div>
            <div><a href="/about/catalog.aspx?cid=83">Молочная упаковка</a></div>
        </div>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=117">Пакеты для сыра</a></div>
            <div><a href="/about/catalog.aspx?cid=114">Подложки, лотки</a></div>
            <div><a href="/about/catalog.aspx?cid=116">Полиграфическая продукция</a></div>
            <div><a href="/about/catalog.aspx?cid=80">Полипропиленовые ведра</a></div>
        </div>
    </div>
    <div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-corp.png);">
        <h2 style="font-size: 16px; margin-bottom: 10px; text-transform: uppercase; text-align: left;" class="nomargin thin"><a href="#">Корпоративное обслуживание организаций</a></h2>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=12">Хозяйственные товары</a></div>
            <div><a href="/about/catalog.aspx?cid=3">Канцелярские товары для офиса</a></div>
            <div><a href="/about/catalog.aspx?cid=4">Канцелярские товары для школы</a></div>
            <div><a href="/about/catalog.aspx?cid=2">Бытовая химия</a></div>
            <div><a href="/about/catalog.aspx?cid=1">Бумага</a></div>
        </div>
        <div class="column">
            <div><a href="https://www.office-zakaz.ru/" target="_blank">Каталог офис-заказ</a></div>
            <div><a href="/cat-office/">Офисная мебель</a></div>
            <div><a href="/about/catalog.aspx?cid=39">Орг. техника и расходные материалы</a></div>
        </div>
    </div>
    <div class="bghover catfull" style="background-image: url(<%=AppPath %>/ii/cat-prom.png);">
        <h2 style="font-size: 28px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin"><a href="/about/catalog.aspx?cid=7">промышленная упаковка</a></h2>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=73">Гофра упаковка</a></div>
            <div><a href="/about/catalog.aspx?cid=74">Грипперы</a></div>
            <div><a href="/about/catalog.aspx?cid=71">Клейкие ленты</a></div>
            <div><a href="/about/catalog.aspx?cid=81">Коробки картонные</a></div>
        </div>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=39">Оборудование и инструмент</a></div>
            <div><a href="/about/catalog.aspx?cid=113">Плёнка</a></div>
            <div><a href="/about/catalog.aspx?cid=72">Плёнка ПВХ</a></div>
        </div>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=70">Специальные ленты</a></div>
            <div><a href="/about/catalog.aspx?cid=75">Стретч плёнка</a></div>
        </div>
    </div>
    <div class="bghover cathalf" style="background-image: url(<%=AppPath %>/ii/cat-horeca.png);">
        <h2 style="font-size: 17px; margin-bottom: 15px; text-align: left;" class="nomargin thin"><a href="/about/catalog.aspx?cid=11">ТОВАРЫ ДЛЯ HoReCa</a></h2>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=84">Пакеты</a></div>
            <div><a href="/about/catalog.aspx?cid=89">Этикет-лента</a></div>
            <div><a href="/about/catalog.aspx?cid=89">Этикет пистолеты</a></div>
            <div><a href="/about/catalog.aspx?cid=92">Сетка для овощей</a></div>
        </div>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=65">Аксессуары для баров и ресторанов</a></div>
            <div><a href="/about/catalog.aspx?cid=31">Бумажно-гигиентическая продукция и диспенсеры</a></div>
            <div><a href="/about/catalog.aspx?cid=91">Ценники и чековая лента</a></div>
        </div>
    </div>
    <%--<a href="/news/a143a9ce-6ea3-4617-8e10-98a6cf8a294b.aspx"><img src="<%=AppPath %>/ii/banner1.jpg" class="bghover catban" /></a><a href="/news/2bf90e8e-643c-4c34-bba2-1dd4d2cef4a9.aspx"><img src="<%=AppPath %>/ii/banner2.jpg" class="bghover catban" /></a>--%>
    <div class="bghover catquot" style="background-image: url(<%=AppPath %>/ii/cat-season.png);">
        <h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin"><a href="/about/catalog.aspx?cid=9">Сезонные товары</a></h2>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=78">Новогодние украшения и елки</a></div>
            <div><a href="/about/catalog.aspx?cid=77">Новогодняя упаковка</a></div>
            <div><a href="/about/catalog.aspx?cid=76">Открытки</a></div>
        </div>
    </div>
    <div class="bghover catquot" style="background-image: url(<%=AppPath %>/ii/cat-vac.png);">
        <h2 style="font-size: 17px; margin-bottom: 15px; text-transform: uppercase; text-align: left;" class="nomargin thin"><a href="/about/catalog.aspx?cid=8">товары для отдыха</a></h2>
        <div class="column">
            <div><a href="/about/catalog.aspx?cid=118">Мебель пластиковая</a></div>
            <div><a href="/about/catalog.aspx?cid=12">Товары для дома</a></div>
            <div><a href="/about/catalog.aspx?cid=8">Товары для пикника</a></div>
        </div>
    </div>
    <div class="clear"></div>

    </div>  

<div id="tm">
    <div style="font-family: ClearSansBold; font-size: 30px; font-weight: bold; text-align: center; padding: 20px; padding-top: 40px;">СОБСТВЕННЫЕ ТОРГОВЫЕ МАРКИ</div>

    <div style="float: left; height: 300px; line-height: 300px; width: 62px; padding-left: 40px;">
        <img onclick="javascript:tmsPrev();" src="/ii/tmleft.png" style="cursor: pointer;" /></div>

    <div style="float: left; padding-left: 50px; width: 980px;">
        <div align="center">
            <div class="tmsel sel" number="0">JOHN PACK</div>

            <div class="tmsel" number="1">РАЗГУЛЯЙ</div>

            <div class="tmsel" number="2">GREEN WOOD</div>

            <div class="tmsel" number="3">PRISMA</div>

            <div class="tmsel" number="4">WORLDPACK</div>
        </div>

        <div id="tms">
            <div id="tmsv">
                <div class="tm">
                    <img src="/ii/logo-jp.png" style="float: left; margin-right: 20px;" />
                    <div style="font-family: ClearSansLight; font-size: 28px;">JOHN PACK.</div>

                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">ЭКСПЕРТ СОВРЕМЕННОЙ УПАКОВКИ</div>

                    <div>Торговая марка была основана в 2013 г., но уже прочно завоевала доверие у своих покупателей, за счет своего неизменно высокого качества, отличной цены и запоминающегося дизайна.</div>

                    <div class="inspect"><a href="/catalog/7/" style="text-decoration: none;">ОЗНАКОМИТЬСЯ С ПРОДУКЦИЕЙ</a></div>
                </div>

                <div class="tm">
                    <img src="/ii/logo-ra.png" style="float: left; margin-right: 20px;" />
                    <div style="font-family: ClearSansLight; font-size: 28px;">РАЗГУЛЯЙ.</div>

                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">УДАЧНЫЙ ОТДЫХ!</div>

                    <div>Торговая марка, созданна в 2006 году. Главной целью процесса разработки была ориентация на удовлетворение эстетических и практических потребностей покупателя. Сегодня ТМ &laquo;Разгуляй&raquo; занимает на костромском, ярославском и ивановском рынках прочные позиции и благодаря непревзойдённому качеству своей продукции, её привлекательной стоимости и современному дизайну.</div>

                    <div class="inspect"><a href="/catalog/8/" style="text-decoration: none;">ОЗНАКОМИТЬСЯ С ПРОДУКЦИЕЙ</a></div>
                </div>

                <div class="tm">
                    <img src="/ii/logo-gw.png" style="float: left; margin-right: 20px;" />
                    <div style="font-family: ClearSansLight; font-size: 28px;">GREEN WOOD</div>

                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">Залог чистоты и комфорта</div>

                    <div>Торговая марка &laquo;Green Wood&raquo; вышла в свет в 2014 г., позиционируя себя как товары, призванные содержать ваш дом в чистоте, что является залогом для поддержания уюта и комфорта. Оптимальное соотношение цены и качества товаров не оставило равнодушными клиентов, что постоянно стимулирует развитие марки и расширение торгового ассортимента.</div>

                    <div class="inspect"><a href="/catalog/9/" style="text-decoration: none;">ОЗНАКОМИТЬСЯ С ПРОДУКЦИЕЙ</a></div>
                </div>

                <div class="tm">
                    <img src="/ii/logo-pr.png" style="float: left; margin-right: 20px;" />
                    <div style="font-family: ClearSansLight; font-size: 28px;">PRISMA</div>

                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">Профессионал оценит</div>

                    <div>Торговая Марка &laquo;PRISMA&raquo; - это товары высочайшего качества. В 2017 году мы выпустили фольгу алюминиевую и пленку под собственной торговой маркой.</div>
                </div>

                <div class="tm">
                    <img src="/ii/WP.png" style="float: left; margin-right: 20px;" />
                    <div style="font-family: ClearSansLight; font-size: 28px;">WORLDPACK</div>

                    <div style="font-family: ClearSansLight; font-size: 28px; margin-bottom: 10px;">Больше, чем просто упаковка</div>

                    <div>&laquo;WORLDPACK&raquo; занимается разработкой индивидуальной брендированной ювелирной упаковки. Упаковки, которая продает.</div>
                </div>
            </div>
        </div>
    </div>

    <div style="float: left; height: 300px; line-height: 300px; width: 62px; padding-right: 40px;">
        <img onclick="javascript:tmsNext();" src="/ii/tmrght.png" style="cursor: pointer;" /></div>
</div>


<div class="clear"></div><br />

<div style="width: 980px; margin: 0 auto;" class="assort">

    <h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">19 лет безупречной работы</h2>
    <img src="<%=AppPath %>/ii/achbar_new.png" alt="" />
    <%--<div id="achs">    <div class="col">Компания «Мир Упаковки» начал свое существование в 2000 году с небольшого арендованного офиса и склада.</div>    <div class="col">Численность штата фирмы достигла 20 человек, а клиентская база – 500 контрагентов.</div>    <div class="col">ГК «Мир Упаковки» сменила адрес на ныне существующий, отметив новоселье открытием просторного торгового зала. Началось формирование парка грузовых машин.</div>    <div class="col">Начато производство наборов одноразовой посуды. Был сформирован отдел логистики и отдел ВЭД. Запущено производство контейнеров для кондитерских изделий.</div>    <div class="col">ГК «Мир Упаковки» внесена в «Книгу рекордов Костромской области» как самый крупный реализатор упаковочных и расходных материалов.</div>    <div class="col">Площадь складских помещений ГК «Мир Упаковки» достигает 5500м2 . Запущена в работу собственная котельная.</div></div>--%>
    <div class="clear"></div>
    <br />
    <h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">почему мы лучшие</h2>
    <img src="<%=AppPath %>/ii/best1.png" class="best bghover" />
    <img src="<%=AppPath %>/ii/best2.png" class="best bghover" />
    <img src="<%=AppPath %>/ii/best3.png" class="best bghover" />
    <img src="<%=AppPath %>/ii/best4.png" class="best bghover" />
    <img src="<%=AppPath %>/ii/best5.png" class="best bghover" />
    <img src="<%=AppPath %>/ii/best6.png" class="best bghover" />
    <div class="clear"></div>
    <br />
    <h2 style="font-size: 28px; text-transform: uppercase; text-align: center;">отзывы наших клиентов</h2>
    <div id="face">
        <img src="<%=AppPath %>/ii/faceframe.png" id="frame" />
        <img src="<%=AppPath %>/ii/face-igor.jpg" class="face" />
        <img src="<%=AppPath %>/ii/face-marina.jpg" class="face" />
        <img src="<%=AppPath %>/ii/face-sergey.jpg" class="face" />
        <div class="name">никитин павел</div>
        <div class="name">смирнова марина</div>
        <div class="name">ивлев сергей</div>
        <div class="org">ООО «Промпоставка»</div>
        <div class="org">ОАО «Весна»</div>
        <div class="org">ООО ТГ «Высшая Лига»</div>
    </div>
    <div id="ftext">
        <div class="ftext">
            <p>Хочу высказать благодарность Группе компаний «Мир упаковки» за своевременное предоставление пищевых контейнеров, стрейч плёнки и скотча с логотипом компании по особому заказу для моего производства.</p>
            <p>Было приятно общаться с менеджером, знающим толк в специфике пищевой и промышленной упаковки. Получили действительно несколько очень ценных советов, прислушались и не пожалели. Претензий к обслуживанию со стороны сотрудников компании и к полученному товару нет никаких. Благодарю за порядочность и оперативность.</p>
            <p><em>ООО &laquo;Агро-сервис&raquo;</em></p>
        </div>
        <div class="ftext">
            <p>С Группой компании «Мир упаковки» сотрудничаю с момента открытия своей сети магазинов. Хочу сказать, что таких ответственных поставщиков мне еще встречать не доводилось.</p>
            <p>Промышленную и пищевую упаковку мы берём только у Группы компаний «Мир упаковки». Ибо это всегда качественный товар, за который потом не приходится краснеть перед клиентом. А для меня, как для владелицы бизнеса, каждый клиент имеет свою ценность. Последний заказ – большая партия нестандартных контейнеров и пакетов типа «майка» с логотипом сети. За задержку сроков получили скидку, что ещё раз подтвердило мое мнение о порядочности и ответственности этой компании. Рекомендую к сотрудничеству.</p>
            <p><em>ООО &laquo;Милктрейд&raquo;</em></p>
        </div>
        <div class="ftext">
            <p>Хочу поблагодарить компанию «Мир упаковки» за стабильную и качественную работу! Мы сталкивались на протяжении многих лет с постоянными перебоями и неудобствами в покупке различной упаковки для наших магазинов у других поставщиков.</p>
            <p>Сейчас это всё я вспоминаю как страшный сон, и понимаю, что та, копеечная разница в цене, которую мы пытались сэкономить, не стоит даже и грамма нервов. А если учесть те условия сотрудничества, которые нам предложила компания «Мир упаковки», бесперебойную доставку и приятных менеджеров, с которыми даже просто поговорить приятно, то никакой альтернативы и конкурентов у вас даже быть не может ребята!</p>
            <p>Спасибо Вам!</p>
            <p><em>ООО &laquo;Рубикон&raquo;</em></p>
        </div>
    </div>
    <div id="facesel">
    </div>
    <div class="clear"></div>
    <div id="recall">
        <div class="larger" style="color: #fff; margin-bottom: 20px;">Возникли вопросы? Мы вам перезвоним!</div>
        <div id="reform">
            <input id="name" style="width: 320px; margin-right: 20px;" class="defvalue" defvalue="имя" />
            <input id="phone" style="width: 320px; margin-right: 20px;" class="defvalue" defvalue="телефон" />
            <input id="send" style="width: 200px; background-color: #fff; color: #06a6b4; height: 32px; padding: 0px;" type="button" value="ОТПРАВИТЬ" />
        </div>
        <div id="resent">
            Спасибо! Мы получили Ваше сообщение!   
        </div>
    </div>

</div>

<div class="clearfix"></div>

<div class="lang lang-assort">
    <a href="/en/">
        <img src="<%=AppPath %>/ii/en.png" alt="English version"></a>&nbsp;<a href="/en/">English version</a>&nbsp;&nbsp;&nbsp;
    <a href="/cn/">
        <img src="<%=AppPath %>/ii/cn.png" alt="Chinese version"></a>&nbsp;<a href="/cn/">Chinese version</a>
</div>

<div style="height: 40px;"></div>
