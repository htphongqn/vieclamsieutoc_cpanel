<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="user_changepass.aspx.cs" Inherits="vpro.eshop.cpanel.page.user_changepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Đổi mật khẩu | Vpro.Eshop </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server">
                <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"><img src="../Images/ICON_SAVE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="default.aspx">
                <img src="../Images/ICON_RETURN.jpg" width="30" height="30" style="border: 0px" />
                <div>
                    Quay lại</div>
            </a>
        </div>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="auto" border="0">
            <tr>
                <td height="5" colspan="3" align="left">
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">
                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Mật khẩu cũ
                </th>
                <td>
                    <input type="password" name="txtPass" id="txtPass" runat="server" style="width: 300px;" autocomplete="off"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập mật khẩu cũ"
                        Text="Vui lòng nhập mật khẩu cũ" ControlToValidate="txtPass" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Mật khẩu mới
                </th>
                <td>
                    <input type="password" name="txtPassNew" id="txtPassNew" runat="server" style="width: 300px;" autocomplete="off"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mật khẩu mới"
                        Text="Vui lòng nhập mật khẩu mới" ControlToValidate="txtPassNew" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Nhập lại mật khẩu mới
                </th>
                <td>
                    <input type="password" name="txtRePass" id="txtRePass" runat="server" style="width: 300px;" autocomplete="off" />
                    <asp:CompareValidator runat="server" ID="cmpNumbers" ControlToValidate="txtPassNew"
                        ControlToCompare="txtRePass" Operator="Equal" Type="String" ErrorMessage="Mật khẩu mới nhập không đúng!"
                        CssClass="errormes" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
