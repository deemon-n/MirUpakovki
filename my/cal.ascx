<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cal.ascx.cs" Inherits="my_cal" %>
<%@ Register Src="daterange.ascx" TagName="daterange" TagPrefix="uc1" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<uc1:daterange id="dr" runat="server"/>
<div class="calInfo">
    <div>Общая задолженность</div>
    <div class="larger"><%=Total.ToString("n2") %> <span class="rur">p<span>уб.</span></span></div>
    <table cellpadding="3" cellspacing="0" border="0">
        <tr>
            <td>Текущая</td>
            <td><%=Current.ToString("n2") %> <span class="rur">p<span>уб.</span></span></td>
        </tr>
        <tr>
            <td>Просрочено</td>
            <td><%=Outdated.ToString("n2") %> <span class="rur">p<span>уб.</span></span></td>
        </tr>
    </table>
    
    <div style="margin-top: 80px;">Установленный срок отсрочки &ndash; <%=Deferment %> дней</div>
</div>
<div class="calList">
    <asp:Literal ID="ltCal" runat="server" EnableViewState="false" />
</div>