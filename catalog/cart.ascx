<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cart.ascx.cs" Inherits="cart" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<asp:Panel ID="pnlItems" runat="server" DefaultButton="btnUpdate">

<div class="row">
    <div class="col-md-12">
        <div class="cart-total-count">� ����� ������� �������: <asp:Literal ID="ltTotalCount" EnableViewState="false" runat="server"></asp:Literal></div>
    </div>                
    <div class="clearfix"></div>

    <div class="col-md-9">
        <asp:Literal ID="ltCart" runat="server" EnableViewState="false" />
<%--<div class="cart-item">
            <div class="row">
                <div class="col-md-2">
                    <img class="img-cart-item" src="<%=AppPath %>/ii/prod-img.png" alt="��������">
                </div>
                <div class="col-md-6">
                    <div class="title-cart-item">����������� ������������ �������</div>
                    <div class="article-cart-item">��� ������: 222446</div>
                    <div class="fav-cart favor-cart-item">�������� � ���������</div>
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
                    <div class="price-cart-item">1 500 ���.</div>
                    <div class="clearfix"></div>
                    <div class="price-descl-cart-item">���� ����� ���� ������� � ����������� �� ������ �������</div>
                    <div class="del-cart-item">
                        <a href="javascript:this.Page.ClientScript.GetPostBackEventReference(this, "rem" + ci.ID.ToString())"><img src="<%=AppPath %>/ii/del.png" alt="�������" /></a>
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
            <div class="title-total-cart">����� � ������:</div>
            <div class="price-total-cart"><asp:Literal ID="ltTotalAmount" EnableViewState="false" runat="server"></asp:Literal> ���.</div>
            <div class="btn-total-cart">
                <%--<asp:Button ID="btnUpdate" CssClass="btn-grn" runat="server" Text="�����������" OnClick="btnUpdate_Click" ToolTip="������� ����� ��������� � ������������ �� ��������� ���� �����������" />--%>
                <asp:Button ID="btnUpdate" CssClass="btn-grn" runat="server" Text="�����������" OnClick="btnOrder_Click" ToolTip="������������ ����� � ������������ � ������� ��������" />
                <asp:Button ID="btnClean" runat="server" Text="��������" CssClass="btn-grn" OnClick="btnClean_Click" ToolTip="�� ������� ����� ������� ��� ������" />                
                <asp:Button ID="btnOrder" runat="server" Text="�������� �����" CssClass="btn-grn" Font-Bold="true" OnClick="btnOrder_Click" ToolTip="������������ ����� � ������������ � ������� ��������" />
            </div>
        </div>
        <div class="cart-right-block">
            <div class="descl-total-cart">�� ������ ��������� ��� ������ �� ����� ������ ������� � ����� ����������</div>
            <div class="btn-grn set_manager">������� ���������</div>
            <div class="wrapper_popup block-manager text-center" style="width:305px;">
                <div class="title">������� ���������</div>
                <div class="description">
                    <div class="col-md-12 text-left">                   
                        <asp:Literal ID="ltManagerList" EnableViewState="false" runat="server"></asp:Literal>
                        <%--<input type="radio" title="����������� �.�." value="elena_vinogradova@mirupakovki.com" name="manager" id="manager1"/><label for="manager1">����������� ����� �������������</label><br />
                        <input type="radio" title="������� �.�." value="andrey_smirnov@mirupakovki.com" name="manager" id="manager2"/><label for="manager2">������� ������ ������������</label><br />
                        <input type="radio" title="������ �.�." value="105@mirupakovki.com" name="manager" id="manager3"/><label for="manager3">������ ����� �������������</label><br />
                        <input type="radio" title="������� �.�." value="julia_zheltova@mirupakovki.com" name="manager" id="manager4"/><label for="manager4">������� ���� �������������</label><br />
                        <input type="radio" title="������� �.�." value="107@mirupakovki.com" name="manager" id="manager5"/><label for="manager5">������� ��������� �������</label><br />
                        <input type="radio" title="������� �.�." value="olga_grekova@mirupakovki.com" name="manager" id="manager6"/><label for="manager6">������� ����� ����������</label><br />
                        <input type="radio" title="��������� �.�." value="110@mirupakovki.com" name="manager" id="manager7"/><label for="manager7">��������� ���� ����������</label>
                        <br />--%><br />
                        <div class="btn-send-green get_manager">�������</div>                        
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
    ���� ������� �����
    <br /><br />
</asp:Panel>

<asp:Panel ID="pnlDetails" runat="server" Visible="false" DefaultButton="btnOrderIt">
<div class="cart-total-count">� ����� ������� �������: <asp:Literal ID="ltTotalCount2" EnableViewState="false" runat="server"></asp:Literal></div>

<div class="row">
    <div class="col-md-12">
        <div class="warpper-send-order">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig1.jpg" alt="" /> ���������� ����������</div>
            <div class="wrapper-form-cart">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-cart-item">
                            <div class="title">���<sup class="red">*</sup></div>
                            <div class="input"><asp:TextBox CssClass="finish_order_cont" ID="tbFIO" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbFIO"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-cart-item">
                                <div class="title">����� ��. �����<sup class="red">*</sup></div>
                                <div class="input"><asp:TextBox CssClass="finish_order_cont" ID="tbMail" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbMail"></asp:RequiredFieldValidator></div>
                            </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-cart-item">
                            <div class="title">�����������<sup class="red">*</sup></div>
                            <div class="input"><asp:TextBox CssClass="finish_order_cont" ID="tbOrgan" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbOrgan"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-cart-item">
                            <div class="title">�������<sup class="red">*</sup></div>
                            <div class="input"><asp:TextBox CssClass="finish_order_cont phone-mask" ID="tbPhone" placeholder="+7(___)____-____" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbFIO"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="col-md-12 little-size"><sup class="red">*</sup> - ����, ������������ ��� ���������</div>
                </div>
            </div>
        </div>        
        <div class="warpper-send-order wso1 disabled_foc">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig2.jpg" alt="" /> ��������</div>
            <div class="wrapper-form-cart" style="width:95%;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="choice-block choice-delivery">
                            <div class="title">1. ������� � ��������</div>
                            <div class="descr">������, ���������</div>
                        </div>
                        <div class="choice-block choice-delivery">
                            <div class="title">2. �������� ������</div>
                            <div class="descr">���������� ��������, ��� ������ �� 3000�.</div>
                        </div>
                        <asp:HiddenField Value="1" ID="hfChoiceDelivery" runat="server" />
                    </div>
                    <div class="col-md-6 text-center">
                        <div class="delivery-cart-map gilroy-font">
                            �. ��������, ��. ���������, 24, "��� ��������"<br />
                            ���� ������: 10-18<br /><br />
                            <img src="<%=AppPath %>/ii/map_cart.jpg" alt="" />
                            <div class="text-center map_see"><a href="#">�������� �� �����</a></div>
                        </div>
                        <div class="delivery-cart-form hide">     
                           <div class="col-md-8 text-left">
                               <div class="form-cart-item">
                                   <div class="title">�����</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartCity" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-12 text-left">
                               <div class="form-cart-item">
                                   <div class="title">�����</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartStreet" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">���/������</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartHouse" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">��������</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbWohn" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">���� ��������</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartDate" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                           <div class="col-md-6 text-left">
                               <div class="form-cart-item">
                                   <div class="title">����� ��������</div>
                                   <div class="input">
                                       <asp:TextBox ID="tbCartTime" runat="server"></asp:TextBox>
                                   </div>
                               </div>
                           </div>
                           <div class="col-md-12 text-center">
                            <img src="<%=AppPath %>/ii/cart-attention.jpg" alt="" />
                            ������ ������ �� ���� �� ������� � ���������
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <div class="warpper-send-order wso2 disabled_foc">
            <div class="title-block"><img src="<%=AppPath %>/ii/dig3.jpg" alt="" /> ������ ������</div>
            <div class="wrapper-form-cart" style="width:95%;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="choice-block choice-pay">
                            <div class="title">1. ������ ���������</div>
                            <div class="descr">������ � ����� ��� ��������� ������</div>
                        </div>                        
                    </div>
                    <div class="col-md-6">
                        <div class="choice-block choice-pay">
                            <div class="title">2. ������ �� �����</div>
                            <div class="descr">����������� ����� �� ����� ����������</div>
                        </div>
                    </div>
                    <asp:HiddenField Value="1" ID="hfChoicePay" runat="server" />
                    <div class="rekviz-cart hide">
                    <div class="col-md-12">
                        <div class="form-cart-item">
                           <div class="title">���� ���������</div>
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
            <div class="title-block"><img src="<%=AppPath %>/ii/dig4.jpg" alt="" /> ������������� ������</div>
            <div class="wrapper-form-cart" style="width:95%;">
                <div class="row fill_confirm_block">
                    <asp:Literal ID="ltFillConfirm" EnableViewState="false" runat="server"></asp:Literal>
                </div>
                <div class="agree_cart">                    
                    <input type="checkbox" name="agree_cart" id="agree_cart"/> <label for="agree_cart"> � �������� �<a href="<%=AppPath %>/buyers/">�����������</a>� ��������</label>                    
                </div>
            </div>           
        </div> 
        <asp:Button ID="btnOrderIt" runat="server" Text="������� �����" Font-Bold="true" Width="180" OnClick="btnOrderIt_Click" ToolTip="������������ ����� � ������������ � ������� ��������" CssClass="btn-grn btn-order-it" /> 
        <br />
        <br />
    </div>
</div>

<%--<table cellpadding="3" cellspacing="0" width="300px" border="0" class="services services-order form-send">
        <tr>
        <td width="300px">
            ����� ��������:<sup style="color:Red;">*</sup>
        </td>
        <td>
            <asp:TextBox ID="tbAddress" CssClass="form-control no-margin" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="tbAddress"></asp:RequiredFieldValidator> 
        </td>
    </tr>  
    <tr>
        <td colspan="3" align="left">
        <sup style="color:Red;">*</sup> - <span style="font-size:8.5pt;">����, ������������ ��� ����������.</span>
        </td>
    </tr>
</table>

    <b>����������� (��������� ������ ��������, ���� ��������� � �������):</b>    
    <p>
        <asp:TextBox ID="tbRemarks" CssClass="form-control" runat="server" Width="392px" TextMode="MultiLine" Rows="7" />
    </p>--%>
</asp:Panel>

<asp:Panel ID="pnlCheckout" runat="server" Visible="false">
    <p>������� �� ��� �����<%-- �
    <asp:Label ID="labOrder" runat="server" Font-Bold="True" ForeColor="#0000C0" Text="Label"></asp:Label>--%>!
    </p>
    <p>
        ��� �������� �������� � ���� � ��������� �����, ����� �������� ������� �� ������ � ���������� ����������� ������ ��� ����������.</p>
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
        <div class="title-contant prod-title-contant">���������</div>
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