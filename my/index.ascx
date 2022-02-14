<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="my_index" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />

<asp:PlaceHolder ID="phCurrent" runat="server">
<div style="padding: 5px; background-color: #f4f4f4; border: solid 1px #666; margin-bottom: 20px;">
<strong>������� ������:</strong> &nbsp; 
<asp:DropDownList ID="ddlCustomer" runat="server" /> &nbsp; 
<asp:Button ID="btnApply" runat="server" Text="���������" OnClick="btnApply_Click" />
</div>
</asp:PlaceHolder>

<table cellpadding="5" cellspacing="0" border="0" width="100%">
    <tr>
        <td width="50%" valign="top">
            <table class="data">
                <tr><th class="gray larger" colspan="2">���������� ������</th></tr>
                <tr>
                    <td class="strong">������ ������������</td>
                    <td><%=Customer.Name %></td>
                </tr>
                <tr>
                    <td class="strong">����������� �����</td>
                    <td><%=Customer.Email %></td>
                </tr>
                <tr>
                    <td class="strong">�������</td>
                    <td><%=Customer.Phone %></td>
                </tr>
                <tr>
                    <td class="strong">����������� �����</td>
                    <td><%=Customer.LawAddress %></td>
                </tr>
                <tr>
                    <td class="strong">����������� �����</td>
                    <td><%=Customer.PostAddress %></td>
                </tr>
                <tr>
                    <td class="strong">����� �������� ������</td>
                    <td></td>
                </tr>
            </table>
        </td>
        <td width="50%" valign="top">
            <table class="data">
                <tr><th class="lgray larger" colspan="2">��������� ��������</th></tr>
                <tr>
                    <td class="strong">������������ �����</td>
                    <td><%=Customer.BankName %></td>
                </tr>
                <tr>
                    <td class="strong">���</td>
                    <td><%=Customer.ID %></td>
                </tr>
                <tr>
                    <td class="strong">���� (������)</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="strong">�/�</td>
                    <td><%=Customer.BankRS %></td>
                </tr>
                <tr>
                    <td class="strong">�/�</td>
                    <td><%=Customer.BankKS %></td>
                </tr>
                <tr>
                    <td class="strong">���</td>
                    <td><%=Customer.BankIK %></td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<p><asp:Button ID="btnLofoff" runat="server" Text="�����" Font-Size="16px" OnClick="btnLofoff_Click" CssClass="button" /></p>