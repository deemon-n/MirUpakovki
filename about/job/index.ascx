<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="job_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<div style="width:980px; margin:0 auto;">

<div style="border-bottom: solid 1px #eee; margin-bottom: 20px;"><img src="<%=AppPath %>/ii/job.jpg" /></div>

<asp:Panel ID="pnlForm" runat="server" Visible="true">
    <iwc:contentbox runat="server" id="cbJobs" code="Jobs" />
    <p>
        �� ������ ������� <a href="/i/u/jobform.doc">����� ������</a>, ��������� ��� � �����������
        ��� �������� ���� � ������� ���.</p>
    <table cellpadding="2" cellspacing="0" border="0">
        <tr>
            <td style="width: 130px">
                ���� ���:
            </td>
            <td style="width: 255px">
                <asp:TextBox ID="tbName" runat="server" BorderWidth="1px" Columns="30" Width="350px" />
                <asp:RequiredFieldValidator ID="rdvName" runat="server" ControlToValidate="tbName"
                    Display="Dynamic" ErrorMessage="������� ���" ValidationGroup="feedback" ForeColor="red" Font-Bold="true" />
            </td>
            <td rowspan="4">
                <div><asp:TextBox ID="tbText" runat="server" BorderWidth="1px" Width="350px" Rows="7" TextMode="MultiLine" placeholder="�������������� ����������"/></div>
            </td>
        </tr>
        <tr>
            <td>
                ��� email:
            </td>
            <td>
                <asp:TextBox ID="tbEmail" runat="server" BorderWidth="1px" Columns="30" Width="350px" />
            </td>
        </tr>
        <tr>
            <td>
                ���� ���������:
            </td>
            <td>
                <asp:TextBox ID="tbSubject" runat="server" BorderWidth="1px" Columns="30" Width="350px" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div>�������� ���� � ������:</div>
                <div><asp:FileUpload ID="fuResume" runat="server" /></div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSend" runat="server" Text="���������" ValidationGroup="feedback"
                    OnClick="btnSend_Click" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="pnlThanks" runat="server" Visible="false">
    �������, ���� ��������� ���� ���� ��������.
    <p>
        ���� �� ������� ������ ���������� ������, �� ����������� ��� �������� � ���������
        �����.</p>
</asp:Panel>

<div style="height:40px;"></div>

</div>