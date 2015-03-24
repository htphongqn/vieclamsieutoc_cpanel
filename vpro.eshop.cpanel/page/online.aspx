<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="online.aspx.cs" Inherits="vpro.eshop.cpanel.page.online" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Hỗ trợ trực tuyến | Vpro.Eshop</title>
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
            <a href="online_list.aspx">
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
                <th valign="top" class="left">
                    <span class="user">*</span>Mô tả
                </th>
                <td>
                    <textarea id="txtDesc" runat="server" style="width: 500px;"></textarea>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập Mô tả"
                        Text="Vui lòng nhập Mô tả" ControlToValidate="txtDesc" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <%--<tr style="display:none">
                <th valign="top" class="left">
                    Email/URL
                </th>
                <td>
                    <input type="text" name="txtName" id="txtName" runat="server" style="width: 500px;" />                    
                </td>
            </tr>       
            <tr style="display:none">
                <th valign="top" class="left">
                    Skype
                </th>
                <td>
                    <input type="text" name="txtSkype" id="txtSkype" runat="server" style="width: 500px;" />                   
                </td>
            </tr>   --%>     
             <tr>
                <th valign="top" class="left">
                    Hotline
                </th>
                <td>
                    <input type="text" name="txtHotline" id="txtHotline" runat="server" style="width: 500px;" />                   
                </td>
            </tr>   
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Loại
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblType" runat="server" RepeatColumns="6">                     
                        <asp:ListItem Value="1" Text="Hotline Miền Nam" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Hotline Miền Bắc"></asp:ListItem> 
                        <asp:ListItem Value="3" Text="Hổ trợ Miền Nam"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Hổ trợ Miền Bắc"></asp:ListItem>                  
                    </asp:RadioButtonList>
                </td>
            </tr> 
            <%--<tr style="height: 20px;display:none">
                <th valign="top" class="left">
                    Loại
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblType" runat="server" RepeatColumns="6">
                        <asp:ListItem Selected="True" Value="0" Text="Support"></asp:ListItem>                       
                        <asp:ListItem Value="3" Text="Facebook"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Google+"></asp:ListItem>
                        <asp:ListItem Value="5" Text="Twitter"></asp:ListItem>
                        <asp:ListItem Value="6" Text="Youtube"></asp:ListItem>  
                        <asp:ListItem Value="7" Text="Linkedin"></asp:ListItem>                      
                    </asp:RadioButtonList>
                </td>
            </tr>--%>
            <tr>
                <th valign="top" class="left">
                    Thứ tự
                </th>
                <td>
                    <input type="text" name="txtOrder" id="txtOrder" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                        onblur="this.value=formatNumeric(this.value);" maxlength="4" style="width: 500px;"
                        value="1" />
                </td>
            </tr>
            <%--<tr style="height: 20px;">
                <th valign="top" class="left">
                    Ngôn ngữ
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblLanguage" runat="server" RepeatColumns="5">
                    </asp:RadioButtonList>
                </td>
            </tr>--%>
            <%--<tr id="trUploadImage1" runat="server">
                <th valign="top" class="left">
                    Hình minh họa
                </th>
                <td>
                    <input id="fileImage1" type="file" name="fileImage1" size="50" runat="server" style="width: 500px;">
                </td>
            </tr>
            <tr id="trImage1" runat="server">
                <th valign="top" class="left">
                    <asp:ImageButton ID="btnDelete1" runat="server" ImageUrl="../images/delete_icon.gif"
                        BorderWidth="0" Width="13px" OnClick="btnDelete1_Click" ToolTip="Xóa hình minh họa này">
                    </asp:ImageButton>
                </th>
                <td>
                    <asp:HyperLink runat="server" ID="hplImage1" Target="_blank"></asp:HyperLink><br />
                    <img id="Image1" runat="server" />
                </td>
            </tr>--%>
        </table>
    </div>
</asp:Content>
