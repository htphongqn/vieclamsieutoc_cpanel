<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="news_images.aspx.cs" Inherits="vpro.eshop.cpanel.page.news_images" %>

<%@ Register Src="../ucControls/ucNewsInfo.ascx" TagName="ucNewsInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>File đính kèm | Vpro.Eshop</title>
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
        <%--<div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"><img src="../Images/ICON_SAVE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu</div></asp:LinkButton>
        </div>--%>
        <div class="icon_function_Child">
            <a href="#" onclick="javascript:document.location.reload(true);">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
        <div class="icon_function_Child">
            <a href="#" id="hplBack" runat="server">
                <img src="../Images/ICON_RETURN.jpg" width="30" height="30" style="border: 0px" />
                <div>
                    Quay lại</div>
            </a>
        </div>
        <div class="icon_function_Child">
           <asp:LinkButton ID="Lnupload" runat="server" onclick="Lnupload_Click"><img src="../Images/ICON_SAVE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu</div></asp:LinkButton>
        </div>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="auto" border="0">
                    <tr id="trNewsFunction" runat="server">
                <td colspan="3" align="left">
                    <div id="icon_function_news">
                        <div class="icon_function_items">
                            <a href="#" id="hplCatNews" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Chọn
                                chuyên mục </a>
                        </div>
                        <%--                        <div class="icon_function_items">
                            <a href="#" id="hplCatProducts" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />
                                <asp:Label ID="lbCatNews" runat="server" Text="Chọn món ăn "></asp:Label></a>
                        </div>--%>
                        <div class="icon_function_items">
                            <a href="#" id="hplEditorHTMl" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Soạn
                                tin HTML </a>
                        </div>
                        <%--  <div class="icon_function_items">
                            <a href="#" id="hplNewsAtt" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />File
                                đính kèm </a>
                        </div>--%>
                        <div class="icon_function_items">
                            <a href="#" id="hplAlbum" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Album
                                hình </a>
                        </div>
                        <div class="icon_function_items" style="display:none">
                            <a href="#" id="hplComment" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Thông
                                tin phản hồi</a>
                        </div>
                        <%--<div class="icon_function_items">
                            <a href="#" id="bplNewsCopy" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Sao
                                chép</a>
                        </div>--%>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <uc1:ucNewsInfo ID="ucNewsInfo1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="18" align="left" style="border-bottom: #e3e3e3 1px  solid;" class="general"
                    colspan="2">
                    Thông tin hình ảnh
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mô tả
                </th>
                <td>
                    <input type="text" name="txtTitle" id="txtTitle" runat="server" style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Thứ tự
                </th>
                <td>
                    <input type="text" name="txtOrder" id="txtOrder" runat="server" onkeyup="this.value=formatNumeric(this.value);" onblur="this.value=formatNumeric(this.value);"
                        maxlength="4" style="width: 500px;" value="1" />
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Loại
                </th>
                <td>
                    <asp:RadioButtonList ID="rblType" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Giới thiệu" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Mặt bằng" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Kiến trúc" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Hình ảnh" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr id="trUpload1" runat="server">
                <th valign="top" class="left" nowrap>
                    Hình
                </th>
                <td>
                     <asp:FileUpload ID="FileUpload1" runat="server" class="multi" multiple="true" />
                </td>
            </tr>
            <tr id="trImage1" runat="server">
                <th valign="top" class="left">
                    Hình<br />
                    <asp:ImageButton ID="btnDelete1" runat="server" ImageUrl="../images/delete_icon.gif"
                        BorderWidth="0" Width="13px" OnClick="btnDelete1_Click" ToolTip="Xóa file đính kèm">
                    </asp:ImageButton>
                    
                </th>
                <td>
                    <asp:HyperLink runat="server" ID="hplImage1" Target="_blank"></asp:HyperLink><br />
                    <img id="Image1" runat="server" />
                </td>
            </tr>
            <%--<tr id="trUpload2" runat="server">
                <th valign="top" class="left" nowrap>
                    Hình lớn
                </th>
                <td>
                    <input id="fileImage2" type="file" name="fileImage2" size="50" runat="server" style="width: 500px;">
                </td>
            </tr>
            <tr id="trImage2" runat="server">
                <th valign="top" class="left">
                    Hình lớn<br />
                    <asp:ImageButton ID="btnDelete2" runat="server" ImageUrl="../images/delete_icon.gif"
                        BorderWidth="0" Width="13px" OnClick="btnDelete2_Click" ToolTip="Xóa file đính kèm">
                    </asp:ImageButton>
                </th>
                <td>
                    <asp:HyperLink runat="server" ID="hplImage2" Target="_blank"></asp:HyperLink><br />
                    <img id="Image2" runat="server" />
                </td>
            </tr>--%>
            <tr>
                <td style="height: 10px;" colspan="2">
                </td>
            </tr>
            <tr>
                <td height="18" align="left" style="border-bottom: #e3e3e3 1px  solid;" class="general"
                    colspan="2">
                    Danh sách hình ảnh
                </td>
            </tr>
            <tr>
                <td height="5" colspan="2" align="left">
                </td>
            </tr>
            <tr>
                <th width="50" class="left">
                    Filter
                </th>
                <td width="300px;">
                    <input name="txtKeyword" type="text" id="txtKeyword" runat="server" style="float: left;
                        width: 300px" />
                    <div id="click" style="float: left; margin-left: 5px;">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click">Tìm kiếm </asp:LinkButton>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;" colspan="2">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
                        Width="100%" DataKeyField="NEWS_IMG_ID" CssClass="tdGridTable" SelectedIndex="0"
                        PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
                        PageSize="15" PagerStyle-CssClass="PageClass" AllowSorting="true" OnItemCommand="GridItemList_ItemCommand"
                        OnItemDataBound="GridItemList_ItemDataBound" OnPageIndexChanged="GridItemList_PageIndexChanged"
                        GridLines="None">
                        <AlternatingItemStyle BackColor="#f3f3f3" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="#" HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow"
                                HeaderStyle-Wrap="False">
                                <HeaderStyle Width="1%"></HeaderStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblSTT" runat="server" EnableViewState="False" Text='<%# getOrder() %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Hình nhỏ" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_IMG_ID")) %>'>
                                        <%# getImage(DataBinder.Eval(Container.DataItem, "NEWS_IMG_ID"), DataBinder.Eval(Container.DataItem, "NEWS_IMG_IMAGE1")) %>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Mô tả" HeaderStyle-Width="96%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_IMG_ID")) %>'>
                                        <%#DataBinder.Eval(Container.DataItem, "NEWS_IMG_DESC") %>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="96%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Loại" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <%# getType(DataBinder.Eval(Container.DataItem, "NEWS_IMG_TYPE"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="#" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_IMG_ID")) %>'>Chỉnh sửa
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>                            
                            <asp:TemplateColumn HeaderText="Xóa">
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn xóa?')">
                                        <img src="../images/delete_icon.gif" title="Xóa" border="0">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
                    </asp:DataGrid>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
