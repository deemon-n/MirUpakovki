<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cal.ascx.cs" Inherits="my_cal" %>
<%@ Register Src="daterange.ascx" TagName="daterange" TagPrefix="uc1" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<uc1:daterange id="dr" runat="server"/>
<div class="calInfo">
    <div>����� �������������</div>
    <div class="larger"><%=Total.ToString("n2") %> <span class="rur">p<span>��.</span></span></div>
    <table cellpadding="3" cellspacing="0" border="0">
        <tr>
            <td>�������</td>
            <td><%=Current.ToString("n2") %> <span class="rur">p<span>��.</span></span></td>
        </tr>
        <tr>
            <td>����������</td>
            <td><%=Outdated.ToString("n2") %> <span class="rur">p<span>��.</span></span></td>
        </tr>
    </table>
    
    <div style="margin-top: 80px;">������������� ���� �������� &ndash; <%=Deferment %> ����</div>
</div>
<div class="calList">
    <asp:Literal ID="ltCal" runat="server" EnableViewState="false" />
</div>