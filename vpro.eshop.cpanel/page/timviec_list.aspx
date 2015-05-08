﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="timviec_list.aspx.cs" Inherits="vpro.eshop.cpanel.page.timviec_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>DS Tìm việc | Vpro.Eshop</title>
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
        <%--<div class="icon_function_Child">
            <a href="timviec.aspx">
                <img src="../Images/ICON_ADD.jpg" width="30" height="30" border="0" style="border: 0px" /><div>
                    Thêm mới</div>
            </a>
        </div>--%>
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
                <td height="5" colspan="4" align="left">
                </td>
            </tr>
            <tr>
                <th width="50" class="left">
                    Filter
                </th>
                <td width="300px;">
                    <input name="txtKeyword" type="text" id="txtKeyword" style="width: 300px" runat="server" />                    
                </td>
                <td width="200px;">
                    <asp:DropDownList ID="ddlTinhtranghoso" runat="server" 
                            onselectedindexchanged="ddlTinhtranghoso_SelectedIndexChanged">
                            <asp:ListItem Value="0">---- Chọn Tình Trạng Hồ Sơ ----</asp:ListItem>
                            <asp:ListItem Text="Đang chờ duyệt" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Đã đăng" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Đang ẩn" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Nháp" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Xóa tạm" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Hết hạn" Value="6"></asp:ListItem>
                        </asp:DropDownList>
                </td>
                <td>
                    <div id="click">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click">Tìm kiếm </asp:LinkButton>
                    </div>
                    <div style="padding-left: 100px; color: Red; display:none">
                        <strong>Lọc Theo : </strong>
                        <asp:DropDownList ID="Ddnguon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Change_nguon">
                            <asp:ListItem Value="-1">---- Chọn ----</asp:ListItem>
                            <%--<asp:ListItem Text="Tìm việc" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Tuyển dụng" Value="2"></asp:ListItem>--%>
                            <asp:ListItem Text="Cẩm nang" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Góp ý" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Hướng dẫn sử dụng" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Thông báo cho NTV" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Thông báo cho NTD" Value="7"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Drchuyenmuc_SelectedIndexChanged" Visible="false">
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;" colspan="4">
                </td>
            </tr>
            <tr>
                <td colspan="4">
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
                                        <%# Eval("NEWS_TITLE")%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Người tìm việc" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CUSTOMER_ID">
                                <ItemTemplate>
                                    <%# getCustomerName(DataBinder.Eval(Container.DataItem, "CUSTOMER_ID"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Tình trạng hồ sơ" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="TINHTRANGHOSO">
                                <ItemTemplate>
                                    <%# getTinhtranghoso(DataBinder.Eval(Container.DataItem, "TINHTRANGHOSO"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Lượt xem" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False" SortExpression="NEWS_COUNT">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "NEWS_COUNT")%>
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
