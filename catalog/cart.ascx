<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cart.ascx.cs" Inherits="cart" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<asp:Panel ID="pnlItems" runat="server" DefaultButton="btnUpdate">

<div class="row">
    <div class="col-md-12">
        <div class="cart-total-count">В вашей корзине товаров: <asp:Literal ID="ltTotalCount" EnableViewState="false" runat="server"></asp:Literal></div>
    </div>                
    <div class="clearfix"></div>

    <div class="col-md-9">
        <asp:Literal ID="ltCart" runat="server" EnableViewState="false" />
<%--<div class="cart-item">
            <div class="row">
                <div class="col-md-2">
                    <img class="img-cart-item" src="<%=AppPath %>/ii/prod-img.png" alt="название">
                </div>
                <div class="col-md-6">
                    <div class="title-cart-item">Трехслойная стирательная резинка</div>
                    <div class="article-cart-item">Код товара: 222446</div>
                    <div class="fav-cart favor-cart-item">Добавить в избранное</div>
                </div>
                <div class="col-md-4">
                    <div class="count-cart-item">
                        <div class="count-cart">
                          <div class="count count-cart-item-cur">1</div>
                          <div class="plus-count">
                            <img src="<%=AppPath %>/ii/plus.png" alt="" />
                          </div>
                          <div class="minus-count">
                            <img src="<%=AppPath %>/ii/minus.png" alt="" />
                          </div>
                        </div>
                    </div>
                    <div class="price-cart-item">1 500 руб.</div>
                    <div class="clearfix"></div>
                    <div class="price-descl-cart-item">Цена может быть снижена в зависимости от объема покупки</div>
                    <div class="del-cart-item">
                        <a href="javascript:this.Page.ClientScript.GetPostBackEventReference(this, "rem" + ci.ID.ToString())"><img src="<%=AppPath %>/ii/del.png" alt="удалить" /></a>
                    </div>
                </div>
            </div>            
        </div>
        <div class="cart-item">
            111
        </div>--%>
    </div>
    <div class="col-md-3">  
        <div class="cart-right-block">
            <div class="title-total-cart">Всего к оплате:</div>
            <div class="price-total-cart"><asp:Literal ID="ltTotalAmount" EnableViewState="false" runat="server"></asp:Literal> руб.</div>
            <div class="btn-total-cart">
                <%--<asp:Button ID="btnUpdate" CssClass="btn-grn" runat="server" Text="Пересчитать" OnClick="btnUpdate_Click" ToolTip="Корзина будет обновлена в соответствии со внесёнными Вами изменениями" />--%>
                <asp:Button ID="btnUpdate" CssClass="btn-grn" runat="server" Text="Пересчитать" OnClick="btnOrder_Click" ToolTip="Сформировать заказ в соответствии с текущей корзиной" />
                <asp:Button ID="btnClean" runat="server" Text="Очистить" CssClass="btn-grn" OnClick="btnClean_Click" ToolTip="Из корзины будут удалены все товары" />                
                <asp:Button ID="btnOrder" runat="server" Text="Оформить заказ" CssClass="btn-grn" Font-Bold="true" OnClick="btnOrder_Click" ToolTip="Сформировать заказ в соответствии с текущей корзиной" />
            </div>
        </div>
        <div class="cart-right-block">
            <div class="descl-total-cart">Вы можете отправить ваш заказа на более точный просчет к нашим менеджерам</div>
            <div class="btn-grn set_manager">Выбрать менеджера</div>
            <div class="wrapper_popup block-manager text-center" style="width:305px;">
                <div class="title">Выбрать менеджера</div>
                <div class="description">
                    <div class="col-md-12 text-left">                   
                        <asp:Literal ID="ltManagerList" EnableViewState="false" runat="server"></asp:Literal>
                        <%--<input type="radio" title="Виноградова Е.А." value="elena_vinogradova@mirupakovki.com" name="manager" id="manager1"/><label for="manager1">Виноградова Елена Александровна</label><br />
                        <input type="radio" title="Смирнов А.В." value="andrey_smirnov@mirupakovki.com" name="manager" id="manager2"/><label for="manager2">Смирнов Андрей Владимирович</label><br />
                        <input type="radio" title="Щербак О.А." value="105@mirupakovki.com" name="manager" id="manager3"/><label for="manager3">Щербак Ольга Александровна</label><br />
                        <input type="radio" title="Желтова Ю.А." value="julia_zheltova@mirupakovki.com" name="manager" id="manager4"/><label for="manager4">Желтова Юлия Александровна</label><br />
                        <input type="radio" title="Бурцева Е.Ю." value="107@mirupakovki.com" name="manager" id="manager5"/><label for="manager5">Бурцева Екатерина Юрьевна</label><br />
                        <input type="radio" title="Грекова О.М." value="olga_grekova@mirupakovki.com" name="manager" id="manager6"/><label for="manager6">Грекова Ольга Михайловна</label><br />
                        <input type="radio" title="Галюкевич А.В." value="110@mirupakovki.com" name="manager" id="manager7"/><label for="manager7">Галюкевич Анна Валерьевна</label>
                        <br />--%><br />
                        <div class="btn-send-green get_manager">Выбрать</div>                        
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div style="height: 20px;">
                </div>
            </div>            
        </div>
    </div>
    <div class="clearfix"></div>    
</div>
<br />
</asp:Panel>

<asp:Panel ID="pnlNoItems" runat="server">
    Ваша корзина пуста
    <br /><br />
</asp:Panel>

<asp:Panel ID="pnlDetails" runat="server" Visible="false" DefaultButton="btnOrderIt">
<div class="cart-total-count">В вашей корзине товаров: <asp:Literal ID="ltTotalCount2" EnableViewState="false" runat="server"></asp:Literal></div>

<div class="row">
    <div class="col-md-12">
        <div class="warpper-send-order">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig1.jpg" alt="" /> Контактная информация</div>
            <div class="wrapper-form-cart">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-cart-item">
                            <div class="title">ФИО<sup class="red">*</sup></div>
                            <div class="input"><asp:TextBox CssClass="finish_order_cont" ID="tbFIO" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbFIO"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-cart-item">
                                <div class="title">Адрес эл. почты<sup class="red">*</sup></div>
                                <div class="input"><asp:TextBox CssClass="finish_order_cont" ID="tbMail" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbMail"></asp:RequiredFieldValidator></div>
                            </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-cart-item">
                            <div class="title">Организация<sup class="red">*</sup></div>
                            <div class="input"><asp:TextBox CssClass="finish_order_cont" ID="tbOrgan" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbOrgan"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-cart-item">
                            <div class="title">Телефон<sup class="red">*</sup></div>
                            <div class="input"><asp:TextBox CssClass="finish_order_cont phone-mask" ID="tbPhone" placeholder="+7(___)____-____" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbFIO"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="col-md-12 little-size"><sup class="red">*</sup> - поля, обязательные для заполения</div>
                </div>
            </div>
        </div>        
        <div class="warpper-send-order wso1 disabled_foc">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig2.jpg" alt="" /> Доставка</div>
            <div class="wrapper-form-cart" style="width:95%;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="choice-block choice-delivery">
                            <div class="title">1. Забрать в магазине</div>
                            <div class="descr">Завтра, бесплатно</div>
                        </div>
                        <div class="choice-block choice-delivery">
                            <div class="title">2. Оформить заявку</div>
                            <div class="descr">Бесплатная доставка, при заказе от 3000р.</div>
                        </div>
                        <asp:HiddenField Value="1" ID="hfChoiceDelivery" runat="server" />
                    </div>
                    <div class="col-md-6 text-center">
                        <div class="delivery-cart-map gilroy-font">
                            г. Кострома, ул. Юбилейная, 24, "Мир упаковки"<br />
                            Часы работы: 10-18<br /><br />
                            <img src="<%=AppPath %>/ii/map_cart.jpg" alt="" />
                            <div class="text-center map_see"><a href="#">Показать на карте</a></div>
                        </div>
                        <div class="delivery-cart-form hide">     
                           <div class="col-md-8 text-left">
                               <div class="form-cart-item">
                                   <div class="title">Город</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartCity" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-12 text-left">
                               <div class="form-cart-item">
                                   <div class="title">Улица</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartStreet" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">Дом/Корпус</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartHouse" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">Квартира</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbWohn" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">Дата доставки</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartDate" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">Время доставки</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartTime" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div>
                           <div class="col-md-12 text-center">
                            <img src="<%=AppPath %>/ii/cart-attention.jpg" alt="" />
                            Подъем товара на этаж не включен в стоимость
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <div class="warpper-send-order wso2 disabled_foc">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig3.jpg" alt="" /> Способ оплаты</div>
            <div class="wrapper-form-cart" style="width:95%;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="choice-block choice-pay">
                            <div class="title">1. Оплата наличными</div>
                            <div class="descr">Оплата в офисе при получении заказа</div>
                        </div>                        
                    </div>
                    <div class="col-md-6">
                        <div class="choice-block choice-pay">
                            <div class="title">2. Оплата по счету</div>
                            <div class="descr">Выставление счета по вашим реквизитам</div>
                        </div>
                    </div>
                    <asp:HiddenField Value="1" ID="hfChoicePay" runat="server" />
                    <div class="rekviz-cart hide">
                    <div class="col-md-12">
                        <div class="form-cart-item">
                           <div class="title">Ваши реквизиты</div>
                           <div class="input">
                               <asp:TextBox ID="tbRekviz" CssClass="cart-rekviz" TextMode="MultiLine" runat="server"></asp:TextBox>
                           </div>
                        </div>
                    </div>
                    </div>                    
                </div>
            </div>
        </div>     
        <div class="warpper-send-order wso3 disabled_foc">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig4.jpg" alt="" /> Подтверждение заказа</div>
            <div class="wrapper-form-cart" style="width:95%;">
                <div class="row fill_confirm_block">
                    <asp:Literal ID="ltFillConfirm" EnableViewState="false" runat="server"></asp:Literal>
                </div>
                <div class="agree_cart">                    
                    <input type="checkbox" name="agree_cart" id="agree_cart"/> <label for="agree_cart"> С разделом «<a href="<%=AppPath %>/buyers/">Покупателям</a>» согласен</label>                    
                </div>
            </div>           
        </div> 
        <asp:Button ID="btnOrderIt" runat="server" Text="Сделать заказ" Font-Bold="true" Width="180" OnClick="btnOrderIt_Click" ToolTip="Сформировать заказ в соответствии с текущей корзиной" CssClass="btn-grn btn-order-it" /> 
        <br />
        <br />
    </div>
</div>

<%--<table cellpadding="3" cellspacing="0" width="300px" border="0" class="services services-order form-send">
        <tr>
        <td width="300px">
            Адрес доставки:<sup style="color:Red;">*</sup>
        </td>
        <td>
            <asp:TextBox ID="tbAddress" CssClass="form-control no-margin" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="tbAddress"></asp:RequiredFieldValidator> 
        </td>
    </tr>  
    <tr>
        <td colspan="3" align="left">
        <sup style="color:Red;">*</sup> - <span style="font-size:8.5pt;">поля, обязательные для заполнения.</span>
        </td>
    </tr>
</table>

    <b>Комментарий (уточнение сроков доставки, ваши пожелания и вопросы):</b>    
    <p>
        <asp:TextBox ID="tbRemarks" CssClass="form-control" runat="server" Width="392px" TextMode="MultiLine" Rows="7" />
    </p>--%>
</asp:Panel>

<asp:Panel ID="pnlCheckout" runat="server" Visible="false">
    <p>Спасибо за Ваш заказ<%-- №
    <asp:Label ID="labOrder" runat="server" Font-Bold="True" ForeColor="#0000C0" Text="Label"></asp:Label>--%>!
    </p>
    <p>
        Наш менеджер свяжется с Вами в ближайшее время, чтобы уточнить вопросы по заказу и предложить оптимальный способ его выполнения.</p>
<%-- <script type="text/javascript" >
 setTimeout('location.replace("index.aspx")', 5000);
</script>--%>
<script type="text/javascript" >
    clearCookieManager();
    //$.cookie('manager', null);
</script>
</asp:Panel>

<div class="row">
    <div class="col-md-12">
        <div class="title-contant prod-title-contant">Избранное</div>
        <br />
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
                
                    <iwc:xsltlistview runat="server" id="xpvProductsTop" stylesheetlocation="~/xsl/productsSliderFavorit.xsl" />  
                </div>
                <div class="clearfix"></div>
            </div>      
            </div>
            
            <div class="clearfix"></div>
        </div> 
    </div>
</div>

<asp:HiddenField ID="hfEmailAddressSend" Value="0" runat="server" />
<asp:HiddenField ID="hfNameSend" Value="0" runat="server" />