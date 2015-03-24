<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="booking_list.aspx.cs" Inherits="vpro.eshop.cpanel.page.booking_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Thông tin liên hệ | vpro.eshop</title>
    <script language="javascript">
                <!--
        function ToggleAll(e, action, chkName) {
            if (e.checked) {
                CheckAll(chkName);
            }
            else {
                ClearAll(chkName);
            }
        }

        function CheckAll(chkName) {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf(chkName) > 0)
                    e.checked = true;
            }
            //ml.MainContent_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll(chkName) {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf(chkName) > 0)
                    e.checked = false;
            }
            //ml.MainContent_GridItemList_toggleSelect.checked = false;
        }
                    
                // -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server"> <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div></asp:LinkButton>
        </div>--%>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                CausesValidation="false" OnClick="lbtDelete_Click"> <img src="../Images/ICON_DELETE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Xóa</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="#" onclick="javascript:document.location.reload(true);">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
          <%--<div class="icon_function_Child" id="Div1" runat="server">
            <asp:LinkButton ID="lbtExport" runat="server" 
                CausesValidation="false" onclick="lbtExport_Click" > <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Export Excel</div></asp:LinkButton>
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
                </td>
            </tr>
            <tr>
                <td style="height: 10px;" colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
                        Width="100%" DataKeyField="CONT_ID" CssClass="tdGridTable" SelectedIndex="0"
                        PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
                        PageSize="15" PagerStyle-CssClass="PageClass" AllowSorting="true" OnItemCommand="GridItemList_ItemCommand"
                        OnItemDataBound="GridItemList_ItemDataBound" OnPageIndexChanged="GridItemList_PageIndexChanged"
                        OnSortCommand="GridItemList_SortCommand" GridLines="None">
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
                                    <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0,'chkSelect');"
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
                            <asp:TemplateColumn HeaderText="Khách sạn" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="NEWS_ID">
                                <ItemTemplate>
                                    <%# getNameHotel(DataBinder.Eval(Container.DataItem, "NEWS_ID"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Loại phòng" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_CLASS_TYPE">
                                <ItemTemplate>
                                    <%# getTypeClass(DataBinder.Eval(Container.DataItem, "CONT_CLASS_TYPE"))%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>                           
                            <asp:TemplateColumn HeaderText="Số lượng" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_PEOPLE3">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_PEOPLE3")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Ngày đi" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_DAY1">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_DAY1","{0:dd/MM/yyyy}")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Ngày về" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_DAY2">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_DAY2", "{0:dd/MM/yyyy}")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Người lớn" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_PEOPLE1">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_PEOPLE1")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Trẻ em" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_PEOPLE2">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_PEOPLE2")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>                            
                            <asp:TemplateColumn HeaderText="Họ tên" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_FULLNAME">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_FULLNAME")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Ownership" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="ISOwnership">
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <input type="checkbox" checked='<%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "ISOwnership"))%>'/>    
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Điện thoại" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_PHONE">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_PHONE")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Email" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONT_MAIL">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONT_MAIL")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
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

