<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="news.aspx.cs" Inherits="vpro.eshop.cpanel.page.news" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Tin tức - Sản phẩm | Vpro.Eshop </title>
    <script src="../Jquery/jquery.min.1.7.2.js" type="text/javascript"></script>
    <script src="../Jquery/JqueryCollapse/jquery.collapse.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        new jQueryCollapse($("#seo"), {
            query: 'div h2'
        });

        new jQueryCollapse($("#dvPrice"), {
            query: 'div h2'
        });

        function ParseText(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrl'));
            document.getElementById('MainContent_txtSeoTitle').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeyword').value = objsent.value;
        }
        function ParseDesc(objsent) {
            document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseTextEn(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrlEn'));
            document.getElementById('MainContent_txtSeoTitleEn').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeywordEn').value = objsent.value;
        }
        function ParseDescEn(objsent) {
            document.getElementById('MainContent_txtSeoDescriptionEn').value = objsent.value;
        }
    </script>
    <script type="text/javascript" language="javascript">
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

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }

        function ToggleAll1(e, action) {
            if (e.checked1) {
                CheckAll1();
            }
            else {
                ClearAll1();
            }
        }

        function CheckAll1() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect1") > 0)
                    e.checked1 = true;
            }
            ml.MainContent_DataGridSize_toggleSelect.checked1 = true;
        }

        function ClearAll1() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect1") > 0)
                    e.checked1 = false;
            }
            ml.MainContent_DataGridSize_toggleSelect.checked1 = false;
        }

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked1) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }
        
					
				// -->
    </script>

    <script src="../tiny_mce/tiny_mce.js" type="text/javascript"></script>
    <script type="text/javascript">
        tinyMCE.init({
            // General options
            mode: "textareas",
            theme: "advanced",
            editor_selector : "mceEditor",
            editor_deselector : "mceNoEditor",
            plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

            // Theme options
            theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: true,

            // Example content CSS (should be your site CSS)
            content_css: "css/content.css",
            content_css: "/style/CustomizeStyle.css",

            // Drop lists for link/image/media/template dialogs
            template_external_list_url: "lists/template_list.js",
            external_link_list_url: "lists/link_list.js",
            external_image_list_url: "lists/image_list.js",
            media_external_list_url: "lists/media_list.js",
            file_browser_callback: "filebrowser",

            // Style formats
            style_formats: [
            { title: 'Bold text', inline: 'b' },
            { title: 'Red text', inline: 'span', styles: { color: '#ff0000'} },
            { title: 'Red header', block: 'h1', styles: { color: '#ff0000'} },
            { title: 'Example 1', inline: 'span', classes: 'example1' },
            { title: 'Example 2', inline: 'span', classes: 'example2' },
            { title: 'Table styles' },
            { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' },
            { title: 'Customize Style' },
            { title: 'title_content', inline: 'span', classes: 'title_content' },
            { title: 'mod_news', inline: 'span', classes: 'mod_news' },
            { title: 'clear', inline: 'span', classes: 'clear' },
            { title: 'divsep', inline: 'span', classes: 'divsep' },
            { title: 'search', inline: 'span', classes: 'search' },
            { title: 'inputbox', inline: 'span', classes: 'inputbox' },
            { title: 'button', inline: 'span', classes: 'button' },
            { title: 'yellow button', inline: 'span', classes: 'yellow-button' },
            { title: 'modtitle', inline: 'span', classes: 'modtitle' },
            { title: 'modcontent', inline: 'span', classes: 'modcontent' },
            { title: 'modwrap-l2', inline: 'span', classes: 'modwrap-l2' },
            { title: 'modwrap-l3', inline: 'span', classes: 'modwrap-l3' },
            { title: 'headline', inline: 'span', classes: 'headline' },
            { title: 'rounded', inline: 'span', classes: 'rounded' },
            { title: 'item', inline: 'span', classes: 'item' },
            { title: 'item-bg', inline: 'span', classes: 'item-bg' },
            { title: 'quote', inline: 'span', classes: 'quote' },
            { title: 'leadingarticles', inline: 'span', classes: 'leadingarticles' },
            { title: 'readmore', inline: 'span', classes: 'readmore' },
            { title: 'mod-menu', inline: 'span', classes: 'mod-menu' },
            { title: 'menu', inline: 'span', classes: 'menu' },
            { title: 'last', inline: 'span', classes: 'last' },
            { title: 'title', inline: 'span', classes: 'title' },
            { title: 'ff_formtitle', inline: 'span', classes: 'ff_formtitle' },
            { title: 'content_outline', inline: 'span', classes: 'content_outline' },
            { title: 'modcontent-l1', inline: 'span', classes: 'modcontent-l1' },
            { title: 'modcontent-l2', inline: 'span', classes: 'modcontent-l2' },
            { title: 'modcontent-l3', inline: 'span', classes: 'modcontent-l3' },
            { title: 'jwts_tabbernav', inline: 'span', classes: 'jwts_tabbernav' },
            { title: 'jwts_tabbernav', inline: 'span', classes: 'jwts_tabbernav' },
            { title: 'jobs-left', inline: 'span', classes: 'jobs-left' },
            { title: 'jobs-right', inline: 'span', classes: 'jobs-right' },
            { title: 'results', inline: 'span', classes: 'results' },
            { title: 'modwrap-l1_adv1', inline: 'span', classes: 'modwrap-l1_adv1' },
            { title: 'modwrap-l1_adv2', inline: 'span', classes: 'modwrap-l1_adv2' },
            { title: 'supportname', inline: 'span', classes: 'supportname' },
            { title: 'cck_field', inline: 'span', classes: 'cck_field' },
            { title: 'color-button', inline: 'span', classes: 'color-button' },
            { title: 'modlink', inline: 'span', classes: 'modlink' },
            { title: 'contentheading', inline: 'span', classes: 'contentheading' },
            { title: 'contentpagetitle', inline: 'span', classes: 'contentpagetitle' },
            { title: 'plainrows', inline: 'span', classes: 'plainrows' },
            { title: 'odd', inline: 'span', classes: 'odd' },
            { title: 'colorstripes', inline: 'span', classes: 'colorstripes' },
            { title: 'greystripes', inline: 'span', classes: 'greystripes' },
            { title: 'main', inline: 'span', classes: 'main' },
            { title: 'design1', inline: 'span', classes: 'design1' },
            { title: 'jazin-full', inline: 'span', classes: 'jazin-full' },
            { title: 'jazin-boxwrap', inline: 'span', classes: 'jazin-boxwrap' },
            { title: 'jazin-box', inline: 'span', classes: 'jazin-box' },
            { title: 'jazin-section', inline: 'span', classes: 'jazin-section' },
            { title: 'jazin-content', inline: 'span', classes: 'jazin-content' },
            { title: 'jazin-links', inline: 'span', classes: 'jazin-links' }
        ],

            // Replace values for the template plugin
            template_replace_values: {
                username: "Some User",
                staffid: "991234"
            }
        });
        function filebrowser(field_name, url, type, win) {

            fileBrowserURL = "/Cpanel/FileManager/Default.aspx?sessionid=<%= Session.SessionID.ToString() %>";


            tinyMCE.activeEditor.windowManager.open({
                title: "Ajax File Manager",
                url: fileBrowserURL,
                width: 950,
                height: 650,
                inline: 0,
                maximizable: 1,
                close_previous: 0
            }, {
                window: win,
                input: field_name,
                sessionid: '<%= Session.SessionID.ToString() %>'
            }
);
        }
    </script>

    <style type="text/css">
        label {
        white-space:pre;
        }
    </style>

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
            <a href="news_list.aspx">
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
            <tr id="trNewsFunction" runat="server" visible="false">
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
                        <div class="icon_function_items" id="divEditorHTMl" runat="server">
                            <a href="#" id="hplEditorHTMl" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Soạn
                                tin HTML </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplNewsAtt" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />File
                                đính kèm </a>
                        </div>
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
            <%-- <tr>
				<td height="5" colspan="3" align="left">
				</td>
			</tr>--%>
            <tr>
                <td colspan="3" align="left">
                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Loại thông tin
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblNewsType" runat="server" RepeatColumns="3" AutoPostBack="True"
                        OnSelectedIndexChanged="rblNewsType_SelectedIndexChanged">
                        <%--<asp:ListItem Text="Tìm việc" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Tuyển dụng" Value="2"></asp:ListItem>--%>
                        <asp:ListItem Text="Cẩm nang" Value="3" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Góp ý" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Hướng dẫn sử dụng" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Thông báo cho NTV" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Thông báo cho NTD" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Liên hệ quảng cáo" Value="8"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr id="trCat" runat="server">
                <th valign="top" class="left">
                    Chuyên mục
                </th>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" Width="500px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Tiêu đề
                </th>
                <td>
                    <input type="text" name="txtTitle" id="txtTitle" runat="server" style="width: 500px;"
                        onkeyup="ParseText(this);" onblur="ParseText(this);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên tiêu đề"
                        Text="Vui lòng nhập tiêu đề" ControlToValidate="txtTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mô tả
                </th>
                <td>
                    <textarea id="txtDesc" runat="server" class="mceNoEditor" style="width: 500px;" onkeyup="ParseDesc(this);"
                        onblur="ParseDesc(this);"></textarea>                       
                </td>
            </tr>
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
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Cho phép phản hồi
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblFeefback" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Có" Selected="True" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
          <tr style="display:none">
                <th valign="top" class="left">
                    Địa chỉ
                </th>
                <td>
                    <input type="text" id="txtAddress" runat="server" style="width: 500px;"  />                    
                </td>
            </tr>
            <tr style="display:none">
                <th valign="top" class="left">
                    Số điện thoại
                </th>
                <td>
                    <input type="text" id="txtPhone" runat="server" style="width: 500px;"  />                    
                </td>
            </tr>
            <tr style="display:none">
                <th valign="top" class="left">
                   Email
                </th>
                <td>
                    <input type="text" id="txtEmail" runat="server" style="width: 500px;"  />                    
                </td>
            </tr>
            <tr style="display:none">
                <th valign="top" class="left">
                   Google link
                </th>
                <td>
                    <input type="text" id="txtGooglelink" runat="server" style="width: 500px;"  />                    
                </td>
            </tr>
            <%--<tr>
                <th valign="top" class="left">
                    Lượt truy cập
                </th>
                <td>
                    <asp:Label ID="lblCount" runat="server" EnableViewState="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Gửi email
                </th>
                <td>
                    <asp:Label ID="lblSendEmail" runat="server" EnableViewState="false"></asp:Label>
                </td>
            </tr>--%>
        </table>
        <div id="dvOption" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin hiển thị</h3>
            <div>
                <table width="auto" border="0">
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
                    <tr style="height: 20px;">
                        <th valign="top" class="left">
                            Hiển thị trang chủ
                        </th>
                        <td height="25">
                            <asp:RadioButtonList ID="rblNewsPeriod" runat="server" RepeatColumns="5">
                                <asp:ListItem Selected="True" Text="N/A" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Hot-Tiêu biểu" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr style="height: 20px;">
                        <th valign="top" class="left">
                            Hiển thị trong chi tiết
                        </th>
                        <td height="25">
                            <asp:RadioButtonList ID="rblShowDetail" runat="server" RepeatColumns="5">
                                <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
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
                    <tr>
                        <th valign="top" class="left">
                            Thứ tự trang chủ
                        </th>
                        <td>
                            <input type="text" name="txtOrderPeriod" id="txtOrderPeriod" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="4" style="width: 500px;"
                                value="1" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Lượt xem
                        </th>
                        <td>
                            <input type="text" name="txtCount" id="txtCount" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="6" style="width: 500px;"
                                value="1" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="divchitiet" style="width: 650px;" data-collapse runat="server">
            <h3 class="collapse">
                Nội dung chi tiết</h3>
            <div>
                <textarea id="mrk" cols="20" rows="10" class="mrk mceEditor" style="height: 500px;" runat="server"></textarea>
            </div>
        </div>
<%--        <div id="dvPrice" style="width: 650px;" data-collapse runat="server">
            <h3 class="collapse open">
                Thông tin giá cả</h3>
            <div>
                <table width="auto" border="0">
                    <tr>
                        <th valign="top" class="left">
                            Giá
                        </th>
                        <td>
                            <input type="text" name="txtPrice" id="txtPrice" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="20" style="width: 500px;"
                                value="0" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>--%>
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
                    <tr>
                        <th valign="top" class="left">
                            SEO Keyword
                        </th>
                        <td>
                            <textarea id="txtSeoKeyword" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            SEO Description
                        </th>
                        <td>
                            <textarea id="txtSeoDescription" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="dvImage" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin hình ảnh</h3>
            <div>
                <table width="auto" border="0">
                    <%-- <tr id="trUploadImage1" runat="server">
                        <th valign="top" class="left">
                            Hình minh họa nhỏ(160x160)px
                        </th>
                        <td>
                            <input id="fileImage1" type="file" name="fileImage1" size="50" runat="server" style="width: 500px;">
                        </td>
                    </tr>
                  <tr id="trImage1" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete1" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" OnClick="btnDelete1_Click" ToolTip="Xóa hình minh họa này"
                                Style="height: 11px"></asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage1" Target="_blank"></asp:HyperLink><br />
                            <img id="Image1" runat="server" />
                        </td>
                    </tr>
                    <tr id="trUploadImage2" runat="server">
                        <th valign="top" class="left">
                            Hình chi tiết (400x300)px
                        </th>
                        <td>
                            <input id="fileImage2" type="file" name="fileImage2" size="50" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr id="trImage2" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete2" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" ToolTip="Xóa hình chi tiết này" OnClick="btnDelete2_Click">
                            </asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage2" Target="_blank"></asp:HyperLink><br />
                            <img id="Image2" runat="server" alt="" />
                        </td>
                    </tr>--%>
                    <tr id="trUploadImage3" runat="server">
                        <th valign="top" class="left">
                            Hình chi tiết lớn
                        </th>
                        <td>
                            <input id="fileImage3" type="file" name="fileImage3" size="50" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr id="trImage3" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete3" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" ToolTip="Xóa hình chi tiết này" OnClick="btnDelete3_Click"
                                Style="height: 11px"></asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage3" Target="_blank"></asp:HyperLink><br />
                            <img id="Image3" runat="server" alt="" />
                        </td>
                    </tr>
                    <tr id="trUploadImage4" runat="server">
                        <th valign="top" class="left">
                            Logo
                        </th>
                        <td>
                            <input id="fileImage4" type="file" name="fileImage3" size="50" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr id="trImage4" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete4" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" ToolTip="Xóa logo này" OnClick="btnDelete4_Click"
                                Style="height: 11px"></asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage4" Target="_blank"></asp:HyperLink><br />
                            <img id="Image4" runat="server" alt="" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>        
    </div>
</asp:Content>
