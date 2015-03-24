<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="news_list.aspx.cs" Inherits="vpro.eshop.cpanel.page.news_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>DS Sản phẩm - tin tức | Vpro.Eshop</title>
    <script language="javascript">
				<!--
        function ToggleAll(e, action) {
            if (e.checked) {
                CheckAll();
            }
            else {
                ClearAll();
            }
        }

        function CheckAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = true;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = false;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = false;
        }
				    
				// -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server"> <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"> <img src="../Images/ICON_EDIT.jpg" width="30" height="30" style="border: 0px" /><div>
                            Chỉnh sửa</div></asp:LinkButton>
        </div>--%>
        <div class="icon_function_Child">
            <a href="news.aspx">
                <img src="../Images/ICON_ADD.jpg" width="30" height="30" border="0" style="border: 0px" /><div>
                    Thêm mới</div>
            </a>
        </div>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                CausesValidation="false" OnClick="lbtDelete_Click"> <img src="../Images/ICON_DELETE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Xóa</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="news_list.aspx">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
        <%--<div class="icon_function_Child">
            <asp:LinkButton ID="lbtnSendMail" runat="server" OnClientClick="return confirm('Bạn có chắc chắn gửi mail không?');"
                OnClick="lbtnSendMail_Click"><img src="../Images/send_mail.png" width="30" height="30" style="border: 0px" />             
                <div>
                    Gửi mail</div>
            </asp:LinkButton>
        </div>--%>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="100%" border="0">
            <tr>
                <td height="5" colspan="3" align="left">
                </td>
            </tr>
            <tr>
                <th width="50" class="left">
                    Filter
                </th>
                <td width="300px;">
                    <input name="txtKeyword" type="text" id="txtKeyword" style="width: 300px" runat="server" />
                </td>
                <td>
                    <div id="click">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click">Tìm kiếm </asp:LinkButton>
                    </div>
                    <div style="padding-left: 100px; color: Red">
                        <strong>Lọc Theo : </strong>
                        <asp:DropDownList ID="Ddnguon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Change_nguon">
                            <asp:ListItem Value="-1">---- Chọn ----</asp:ListItem>
                            <asp:ListItem Text="Tìm việc" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Tuyển dụng" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Cẩm nang" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Góp ý" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Hướng dẫn sử dụng" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Drchuyenmuc_SelectedIndexChanged" Visible="false">
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;" colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
                        Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
                        PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
                        PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="true" OnItemCommand="GridItemList_ItemCommand"
                        OnItemDataBound="GridItemList_ItemDataBound" OnSortCommand="GridItemList_SortCommand"
                        GridLines="None" OnPageIndexChanged="GridItemList_PageIndexChanged">
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
                            <asp:TemplateColumn HeaderStyle-Width="1%" ItemStyle-Wrap="False" HeaderStyle-CssClass="tdGridHeader"
                                ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <HeaderTemplate>
                                    <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0);"
                                        style="border-top-style: none; border-right-style: none; border-left-style: none;
                                        border-bottom-style: none" name="toggleSign">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input id="chkSelect" type="checkbox" name="chkSelect" runat="server" style="border-top-style: none;
                                        border-right-style: none; border-left-style: none; border-bottom-style: none">
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Tiêu đề" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="NEWS_TITLE">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_ID")) %>'>
                                        <%# GetNewsStatus(Eval("NEWS_ID"),Eval("NEWS_TITLE"))%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Bình luận" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="NEWS_TITLE" Visible="false">
                                <ItemTemplate>
                                    <a href='<%# getLink_comment(DataBinder.Eval(Container.DataItem, "NEWS_ID")) %>'>
                                        <%# Getcount_comment(Eval("NEWS_ID"))%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Loại tin" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="NEWS_TYPE">
                                <ItemTemplate>
                                    <%# getTypeNew(DataBinder.Eval(Container.DataItem, "NEWS_TYPE"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Trạng thái" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="NEWS_SHOWTYPE">
                                <ItemTemplate>
                                    <%# getStatus(DataBinder.Eval(Container.DataItem, "NEWS_SHOWTYPE")) %>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Thứ tự" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "NEWS_ORDER") %>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Ngày tạo" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <%# getDate(DataBinder.Eval(Container.DataItem, "NEWS_PUBLISHDATE"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="#" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_ID")) %>'>Chỉnh sửa
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Xóa">
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn xóa?');">
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
