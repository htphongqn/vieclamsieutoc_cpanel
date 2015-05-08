<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="category.aspx.cs" Inherits="vpro.eshop.cpanel.page.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Chuyên mục | Vpro.Eshop </title>
    <script src="../Jquery/jquery.min.1.7.2.js" type="text/javascript"></script>
    <script src="../Jquery/JqueryCollapse/jquery.collapse.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        new jQueryCollapse($("#seo"), {
            query: 'div h2'
        });

        function ParseText(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrl'));
            document.getElementById('MainContent_txtSeoTitle').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeyword').value = objsent.value;
            //document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseTextEn(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrlEn'));
            document.getElementById('MainContent_txtSeoTitleEn').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeywordEn').value = objsent.value;
            //document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseDesc(objsent) {
            document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseDescEn(objsent) {
            document.getElementById('MainContent_txtSeoDescriptionEn').value = objsent.value;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server">
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
            <a href="category_list.aspx">
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
                    Cấp cha
                </th>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" Width="500px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mã
                </th>
                <td>
                    <input type="text" name="txtCode" id="txtCode" runat="server" style="width: 500px;" />
                </td>
            </tr>
            <%--            <tr>
                <th valign="top" class="left">
                    Mã (Tiếng anh)
                </th>
                <td>
                    <input type="text" name="txtCodeEn" id="txtCodeEn" runat="server" style="width: 500px;" />
                </td>
            </tr>--%>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Chuyên mục
                </th>
                <td>
                    <input type="text" name="txtName" id="txtName" runat="server" style="width: 500px;"
                        onkeyup="ParseText(this);" onblur="ParseText(this);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên chuyên mục"
                        Text="Vui lòng nhập tên nhóm" ControlToValidate="txtName" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <%--            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Chuyên mục(Tiếng anh)
                </th>
                <td>
                    <input type="text" name="txtNameEn" id="txtNameEn" runat="server" style="width: 500px;"
                        onkeyup="ParseTextEn(this);" onblur="ParseTextEn(this);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập tên chuyên mục tiếng anh"
                        Text="Vui lòng nhập tên nhóm tiếng anh" ControlToValidate="txtNameEn" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
            <tr>
                <th valign="top" class="left">
                    Mô tả
                </th>
                <td>
                    <textarea id="txtDesc" runat="server" style="width: 500px;" onkeyup="ParseDesc(this);"
                        onblur="ParseDesc(this);"></textarea>
                </td>
            </tr>
            <%--            <tr>
                <th valign="top" class="left">
                    Mô tả(Tiếng anh)
                </th>
                <td>
                    <textarea id="txtDescEn" runat="server" style="width: 500px;" onkeyup="ParseDescEn(this);"
                        onblur="ParseDescEn(this);"></textarea>
                </td>
            </tr>--%>
            <tr>
                <th valign="top" class="left">
                    Liên kết
                </th>
                <td>
                    <input type="text" name="txtUrl" id="txtUrl" runat="server" style="width: 425px;" />
                    <span>
                        <asp:DropDownList ID="ddlTarget" runat="server">
                        </asp:DropDownList>
                    </span>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Số tin / 1 trang
                </th>
                <td>
                    <input type="text" name="txtpageItem" id="txtpageItem" runat="server" onblur="this.value=formatNumeric(this.value);"
                        maxlength="4" style="width: 500px;" value="12" />
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Hiển thị
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr style="height: 20px;display:none">
                <th valign="top" class="left">
                    Hiển thị trang chủ
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblCatPeriod" runat="server" RepeatColumns="5">
                        <asp:ListItem Selected="True" Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Kiểu hiển thị
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblCatType" runat="server" RepeatColumns="3">                    
                        <asp:ListItem Text="Việc làm" Value="2" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Cẩm nang" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Góp ý" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Hướng dẫn sử dụng" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Thông báo" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Liên hệ quảng cáo" Value="8"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <%--  <tr style="height: 20px;">
                <th valign="top" class="left">
                    Hạn chế truy cập
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblAccess" runat="server" RepeatColumns="5">
                        <asp:ListItem Selected="True" Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>--%>
            <tr style="height: 20px;display:none">
                <th valign="top" class="left">
                    Vị trí
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblPos" runat="server" RepeatColumns="5">
                        <asp:ListItem Selected="True" Text="Top" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Trên" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr style="height: 20px;display:none">
                <th valign="top" class="left">
                    Hiển thị Footer
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblShowFooter" runat="server" RepeatColumns="5">
                        <asp:ListItem Selected="True" Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Hiển thị tức thời
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblShowItems" runat="server" RepeatColumns="5">
                        <asp:ListItem Selected="True" Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
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
            <tr>
                <th valign="top" class="left">
                    Thứ tự
                </th>
                <td>
                    <input type="text" name="txtOrder" id="txtOrder" runat="server" onblur="this.value=formatNumeric(this.value);"
                        maxlength="4" style="width: 500px;" value="1" onkeyup="this.value=formatNumeric(this.value);" />
                </td>
            </tr>
            <tr style="display:none">
                <th valign="top" class="left">
                    Thứ tự trang chủ
                </th>
                <td>
                    <input type="text" name="txtOrderPeriod" id="txtOrderPeriod" runat="server" onblur="this.value=formatNumeric(this.value);"
                        maxlength="4" style="width: 500px;" value="1" onkeyup="this.value=formatNumeric(this.value);" />
                </td>
            </tr>
            <%-- <tr>
                <th valign="top" class="left">
                    Lượt truy cập
                </th>
                <td>
                    <asp:Label ID="lblCount" runat="server" EnableViewState="false"></asp:Label>
                </td>
            </tr>--%>
        </table>
        <div id="dvImage" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin hình ảnh</h3>
            <div>
                <table width="auto" border="0">
                    <tr id="trUploadImage1" runat="server">
                        <th valign="top" class="left">
                            Hình Chính
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
                    </tr>
                </table>
            </div>
        </div>
        <div id="seo" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                SEO Parameters</h3>
            <div>
                <table width="auto" border="0">
                    <tr>
                        <th valign="top" class="left">
                            <span class="user">*</span>SEO Title
                        </th>
                        <td>
                            <input type="text" name="txtSeoTitle" id="txtSeoTitle" runat="server" style="width: 500px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập tên nhóm"
                                Text="Vui lòng nhập Seo Title" ControlToValidate="txtSeoTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <th valign="top" class="left">
                            <span class="user">*</span>SEO Title(Tiếng anh)
                        </th>
                        <td>
                            <input type="text" name="txtSeoTitleEn" id="txtSeoTitleEn" runat="server" style="width: 500px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng nhập tên nhóm tiếng anh"
                                Text="Vui lòng nhập Seo Title tiếng anh" ControlToValidate="txtSeoTitleEn" CssClass="errormes"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <th valign="top" class="left">
                            <span class="user">*</span>SEO URL
                        </th>
                        <td>
                            <input type="text" name="txtSeoUrl" id="txtSeoUrl" runat="server" style="width: 500px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập tên nhóm"
                                Text="Vui lòng nhập Seo Url" ControlToValidate="txtSeoUrl" CssClass="errormes"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <th valign="top" class="left">
                            <span class="user">*</span>SEO URL(Tiếng anh)
                        </th>
                        <td>
                            <input type="text" name="txtSeoUrlEn" id="txtSeoUrlEn" runat="server" style="width: 500px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng nhập tên nhóm tiếng anh"
                                Text="Vui lòng nhập Seo Url tiếng anh" ControlToValidate="txtSeoUrlEn" CssClass="errormes"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <th valign="top" class="left">
                            SEO Keyword
                        </th>
                        <td>
                            <textarea id="txtSeoKeyword" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <th valign="top" class="left">
                            SEO Keyword(Tiếng anh)
                        </th>
                        <td>
                            <textarea id="txtSeoKeywordEn" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>--%>
                    <tr>
                        <th valign="top" class="left">
                            SEO Description
                        </th>
                        <td>
                            <textarea id="txtSeoDescription" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <th valign="top" class="left">
                            SEO Description(Tiếng anh)
                        </th>
                        <td>
                            <textarea id="txtSeoDescriptionEn" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>--%>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
