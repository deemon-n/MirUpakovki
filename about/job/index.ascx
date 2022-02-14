<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="job_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<div style="width:980px; margin:0 auto;">

<div style="border-bottom: solid 1px #eee; margin-bottom: 20px;"><img src="<%=AppPath %>/ii/job.jpg" /></div>

<asp:Panel ID="pnlForm" runat="server" Visible="true">
    <iwc:contentbox runat="server" id="cbJobs" code="Jobs" />
    <p>
        Вы можете скачать <a href="/i/u/jobform.doc">форму резюме</a>, заполнить его в электронном
        или печатном виде и выслать нам.</p>
    <table cellpadding="2" cellspacing="0" border="0">
        <tr>
            <td style="width: 130px">
                Ваше имя:
            </td>
            <td style="width: 255px">
                <asp:TextBox ID="tbName" runat="server" BorderWidth="1px" Columns="30" Width="350px" />
                <asp:RequiredFieldValidator ID="rdvName" runat="server" ControlToValidate="tbName"
                    Display="Dynamic" ErrorMessage="Укажите имя" ValidationGroup="feedback" ForeColor="red" Font-Bold="true" />
            </td>
            <td rowspan="4">
                <div><asp:TextBox ID="tbText" runat="server" BorderWidth="1px" Width="350px" Rows="7" TextMode="MultiLine" placeholder="Дополнительная информация"/></div>
            </td>
        </tr>
        <tr>
            <td>
                Ваш email:
            </td>
            <td>
                <asp:TextBox ID="tbEmail" runat="server" BorderWidth="1px" Columns="30" Width="350px" />
            </td>
        </tr>
        <tr>
            <td>
                Тема сообщения:
            </td>
            <td>
                <asp:TextBox ID="tbSubject" runat="server" BorderWidth="1px" Columns="30" Width="350px" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div>Выберите файл с резюме:</div>
                <div><asp:FileUpload ID="fuResume" runat="server" /></div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSend" runat="server" Text="Отправить" ValidationGroup="feedback"
                    OnClick="btnSend_Click" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="pnlThanks" runat="server" Visible="false">
    Спасибо, Ваше сообщение было нами получено.
    <p>
        Если Вы указали верные контактные данные, мы постараемся Вам ответить в ближайшее
        время.</p>
</asp:Panel>

<div style="height:40px;"></div>

</div>