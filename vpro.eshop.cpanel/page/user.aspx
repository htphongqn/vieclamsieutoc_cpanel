<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="user.aspx.cs" Inherits="vpro.eshop.cpanel.page.user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Người dùng | Vpro.Eshop </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server">
                <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClick="lbtDelete_Click" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                CausesValidation="false">
                <img src="../Images/ICON_DELETE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Xóa</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSaveNew" runat="server" OnClick="lbtSaveNew_Click">
                <img src="../Images/ICON_ADD.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu và thêm mới</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"><img src="../Images/ICON_SAVE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="#" onclick="javascript:document.location.reload(true);">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
        <div class="icon_function_Child">
            <a href="group_list.aspx">
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
                    <span class="user"></span>Họ và tên
                </th>
                <td>
                    <input type="text" name="txtFullName" id="txtFullName" runat="server" style="width: 300px;" />
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Tên đăng nhập
                </th>
                <td>
                    <input type="text" name="txtUN" id="txtUN" runat="server" style="width: 300px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên nhóm"
                        Text="Vui lòng nhập tên nhóm" ControlToValidate="txtUN" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Mật khẩu
                </th>
                <td>
                    <input type="password" name="txtPass" id="txtPass" runat="server" style="width: 300px;" autocomplete="off"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mật khẩu"
                        Text="Vui lòng nhập mật khẩu" ControlToValidate="txtPass" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Nhập lại mật khẩu
                </th>
                <td>
                    <input type="password" name="txtRePass" id="txtRePass" runat="server" style="width: 300px;" autocomplete="off" />
                    <asp:CompareValidator runat="server" ID="cmpNumbers" ControlToValidate="txtPass"
                        ControlToCompare="txtRePass" Operator="Equal" Type="String" ErrorMessage="Mật khẩu nhập không đúng!"
                        CssClass="errormes" />
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Nhóm
                </th>
                <td>
                    <asp:DropDownList ID="ddlGroup" runat="server" DataValueField="GROUP_ID" DataTextField="GROUP_NAME"
                        Style="width: 300px;">
                    </asp:DropDownList>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Active
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblActive" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
