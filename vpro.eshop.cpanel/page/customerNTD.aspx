<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="customerNTD.aspx.cs" Inherits="vpro.eshop.cpanel.page.customerNTD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Khách hàng | Vpro.Eshop</title>
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
                        <%--<asp:ListItem Text="Chưa kích hoạt" Value="3"></asp:ListItem>--%>
                        <asp:ListItem Text="Đã kích hoạt" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Khóa" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Tên công ty
                </th>
                <td>
                    <input type="text" name="txtCustomerName" id="txtCustomerName" runat="server" style="width: 500px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên công ty!"
                        Text="Vui lòng nhập tên công ty!" ControlToValidate="txtCustomerName" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Quy mô công ty
                </th>
                <td>
                    <asp:DropDownList ID="ddlQuymo" runat="server" style="width: 500px;" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn quy mô công ty --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn quy mô công ty!"
                ControlToValidate="ddlQuymo" ForeColor="Red"
                      InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Sơ lược về công ty
                </th>
                <td>
                    <textarea id="txt_mo_ta_cty" runat="server" name="txt_mo_ta_cty" style="height:160px;width:500px;" class="textArea"></textarea>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Mã số thuế
                </th>
                <td>
                    <input type="text" value="" id="txt_ma_so_thue" runat="server" name="txt_ma_so_thue" style="width: 500px;">
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Địa chỉ
                </th>
                <td>
                    <input type="text" name="txtCustomerAddress" id="txt_dia_chi_cong_ty" runat="server"
                        style="width: 500px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Vui lòng nhập địa chỉ liên lạc !"
                        Text="Vui lòng nhập địa chỉ liên lạc !" ControlToValidate="txt_dia_chi_cong_ty"
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa chọn tỉnh/thành phố!" Text="Chưa chọn tỉnh/thành phố!"
                ControlToValidate="ddlCity" CssClass="errormes"
                      InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>   
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Website
                </th>
                <td>
                    <input type="text" value="" id="txt_website" runat="server" name="txt_website"  style="width: 500px;">
                </td>
            </tr>
            <tr>
                <td height="5" colspan="3" align="left">
                </td>
            </tr>
            <tr>
                <td height="18" align="left" style="border-bottom: #e3e3e3 1px  solid;" class="general"
                    colspan="2">
                    Thông tin liên hệ
                </td>
            </tr>            
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Tên người liên hệ
                </th>
                <td>
                    <input type="text" value="" id="txt_ten_lien_he" runat="server" name="txt_ten_day_du"  style="width: 500px;">
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Số điện thoại
                </th>
                <td>
                    <input type="text" value="" id="txt_dien_thoai_lien_he" runat="server" name="txt_dien_thoai_lien_he"  style="width: 500px;">
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Email
                </th>
                <td>
                    <input type="text" value="" id="txt_email_lien_he" runat="server" name="txt_email_lien_he"  style="width: 500px;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email không đúng định dạng !"
                        ControlToValidate="txt_email_lien_he" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Địa chỉ
                </th>
                <td>
                    <input type="text" value="" id="txt_dia_chi_nguoi_lien_he" runat="server" name="txt_dia_chi_nguoi_lien_he"  style="width: 500px;">
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
