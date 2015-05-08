<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="customerNTV.aspx.cs" Inherits="vpro.eshop.cpanel.page.customerNTV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Khách hàng | Vpro.Eshop</title>
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
        .style2
        {
            color: #006600;
            font-size: 13px;
            padding-left: 10px;
            font-weight: bold;
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server" CausesValidation="False">
                <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div>
            </asp:LinkButton>
        </div>--%>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClick="lbtDelete_Click" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                CausesValidation="false">
                <img src="../Images/ICON_DELETE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Xóa</div>
            </asp:LinkButton>
        </div>
        <%--<div class="icon_function_Child">
            <asp:LinkButton ID="lbtSaveNew" runat="server" OnClick="lbtSaveNew_Click">
                <img src="../Images/ICON_ADD.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu và thêm mới</div>
            </asp:LinkButton>
        </div>--%>
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
            <a href="customer_list.aspx">
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
                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="18" align="left" style="border-bottom: #e3e3e3 1px  solid;" class="general"
                    colspan="2">
                    Thông tin cá nhân
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Email đăng nhập
                </th>
                <td>
                    <asp:Literal ID="lbEmailUser" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Trạng thái
                </th>
                <td>
                    <asp:RadioButtonList ID="rdbTrangthai" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Chưa kích hoạt" Value="3" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Đã kích hoạt" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Khóa" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Họ và tên
                </th>
                <td>
                    <input type="text" name="txtCustomerName" id="txtCustomerName" runat="server" style="width: 500px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập họ tên !"
                        Text="Vui lòng nhập họ tên !" ControlToValidate="txtCustomerName" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <%--<tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Ngày sinh
                </th>
                <td>
                    <input type="text" name="txtngaysinh" id="txtngaysinh" runat="server" style="width: 500px;"
                        readonly="readonly" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Vui lòng nhập họ tên !"
                        Text="Vui lòng nhập họ tên !" ControlToValidate="txtCustomerName" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Giới tính
                </th>
                <td>
                    <asp:RadioButtonList ID="rblsex" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Nam" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Nữ" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Khác" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Tình trạng hôn nhân
                </th>
                <td>
                    <asp:DropDownList ID="ddlTinhtrangHonnhan" runat="server" style="width:500px" CssClass="dropbox">
                    <asp:ListItem Text="Độc thân" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Đã có gia đình" Value="2"></asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Số điện thoại
                </th>
                <td>
                    <input type="text" name="txtCustomerPhone1" id="txtCustomerPhone1" runat="server"
                        style="width: 500px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng nhập số điện thoại !"
                        Text="Vui lòng nhập số điện thoại !" ControlToValidate="txtCustomerPhone1" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Email
                </th>
                <td>
                    <input type="text" name="txtCustomerEmail" id="txtCustomerEmail" runat="server" style="width: 500px;"
                         />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng nhập email !"
                        Text="Vui lòng nhập email !" ControlToValidate="txtCustomerEmail" CssClass="errormes"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email không đúng định dạng !"
                        ControlToValidate="txtCustomerEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Địa chỉ
                </th>
                <td>
                    <input type="text" name="txtCustomerAddress" id="txtCustomerAddress" runat="server"
                        style="width: 500px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập địa chỉ liên lạc !"
                        Text="Vui lòng nhập địa chỉ liên lạc !" ControlToValidate="txtCustomerAddress"
                        CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Thành phố
                </th>
                <td>
                    <asp:DropDownList ID="ddlCity" runat="server" style="width:500px" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn tỉnh --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa chọn tỉnh/thành phố!" Text="Chưa chọn tỉnh/thành phố!"
                ControlToValidate="ddlCity" CssClass="errormes"
                      InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>            
        </table>
    </div>
</asp:Content>
