<%@ Control Language="C#" AutoEventWireup="true" CodeFile="daterange.ascx.cs" Inherits="my_daterange" %>
<div class="clear" style="margin-bottom:20px;">
� ������ � <asp:TextBox ID="tb1" runat="server" CssClass="datesel" /> 
�� <asp:TextBox ID="tb2" runat="server" CssClass="datesel" />
<asp:Button ID="btnApply" runat="server" Text="������������" style="background-color: #fff; border: solid 1px #666;" OnClick="btnApply_Click" />
</div>