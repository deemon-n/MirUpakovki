<%@ Control Language="C#" AutoEventWireup="true" CodeFile="profile.ascx.cs" Inherits="cart_profile" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Src="nav.ascx" TagName="nav" TagPrefix="uc1" %>
<uc1:nav ID="nav" runat="server" />
<table cellpadding="10" cellspacing="0" border="0">
    <tr>
        <td valign="top" width="50%">
            <table border="0" cellpadding="3" cellspacing="0">
                <tr>
                    <td valign="top">
                        Имя:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbName" runat="server" BorderWidth="1px" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ValidationGroup="form"
                            Display="Dynamic" ErrorMessage="Укажите имя!" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td valign="top">
                        Фамилия:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbLastName" runat="server" BorderWidth="1px" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tbLastName" ValidationGroup="form"
                            Display="Dynamic" ErrorMessage="Укажите фамилию!" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td valign="top">
                        Телефон:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbPhone" runat="server" BorderWidth="1px" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="tbPhone" ValidationGroup="form"
                            Display="Dynamic" ErrorMessage="Укажите телефон!" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td valign="top">
                        Индекс:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbIndex" runat="server" BorderWidth="1px" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Город:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbCity" runat="server" BorderWidth="1px" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Адрес:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbAddress" runat="server" BorderWidth="1px" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Email:</td>
                    <td valign="top">
                        <asp:TextBox ID="tbEmail" runat="server" BorderWidth="1px" Enabled="false" ValidationGroup="form"></asp:TextBox></td>
                    <td valign="top">
                    </td>
                </tr>
            </table>
            <p>
                <asp:Button ID="btnApply" runat="server" OnClick="btnApply_Click" Text="Сохранить"  ValidationGroup="form"/></p>
                
                <h2>Смена пароля</h2>
                <table border="0" cellpadding="3" cellspacing="0">
                <tr>
                    <td valign="top">
                        Текущий пароль</td>
                    <td valign="top">
                        <asp:TextBox ID="tbPasswordCurrent" runat="server" BorderWidth="1px" TextMode="Password" ValidationGroup="pass"></asp:TextBox></td>
                    <td valign="top"><asp:RequiredFieldValidator ID="rfvPasswordCurrent" ControlToValidate="tbPasswordCurrent" runat="server"
                    Display="Dynamic" /></td>
                </tr>
                <tr>
                    <td valign="top">
                        Новый пароль</td>
                    <td valign="top">
                        <asp:TextBox ID="tbPassword" runat="server" BorderWidth="1px" TextMode="Password" ValidationGroup="pass"></asp:TextBox></td>
                    <td valign="top">
                        <asp:CustomValidator ID="cvPassword" runat="server" ControlToValidate="tbPassword" ValidationGroup="pass"
                            Display="Dynamic" ErrorMessage="CustomValidator" OnServerValidate="cvPassword_ServerValidate"
                            SetFocusOnError="True"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td valign="top">
                        Подтверждение пароля</td>
                    <td valign="top">
                        <asp:TextBox ID="tbCPassword" runat="server" BorderWidth="1px" TextMode="Password" ValidationGroup="pass"></asp:TextBox></td>
                    <td valign="top">
                    </td>
                </tr>
            </table>
            <p>
                <asp:Button ID="btnApplyPass" runat="server" Text="Изменить пароль"  ValidationGroup="pass" OnClick="btnApplyPass_Click"/></p>
        </td>
        <td valign="top" width="50%">
            
        </td>
    </tr>
</table>
