<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="timviec.aspx.cs" Inherits="vpro.eshop.cpanel.page.timviec" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Tìm việc | Vpro.Eshop </title>
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
                <td colspan="3" align="left">
                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Tình Trạng Hồ Sơ
                </th>
                <td height="25">
                    <asp:DropDownList ID="ddlTinhtranghoso" runat="server">
                        <asp:ListItem Text="Đang chờ duyệt" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Đã đăng" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Đang ẩn" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Nháp" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Xóa tạm" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Hết hạn" Value="6"></asp:ListItem>
                    </asp:DropDownList>
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
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Loại
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblNewsPeriod" runat="server" RepeatColumns="5">
                        <asp:ListItem Selected="True" Text="Mặc định" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Ứng viên tiêu biểu" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
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
        
        <div style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Công việc mong muốn</h3>
            <div>
                <table width="auto" border="0">
                    <tr>
                        <td width="180" valign="top" class="tbUser-info_ntd" align="right"><b>Vị trí mong muốn:</b></td>
                        <td class="tbUser-info_ntd"><asp:Literal ID="lbVitrimongmuon" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td valign="top" class="tbUser-info_ntd" align="right"><b>Cấp bậc mong muốn:</b></td>
                        <td class="tbUser-info_ntd"><asp:Literal ID="lbCapbacmongmuon" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngành nghề:</b></td>
                        <td class="tbUser-info_ntd"><asp:Literal ID="lbNgangnghe" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td valign="top" class="tbUser-info_ntd" align="right"><b>Hình thức làm việc:</b></td>
                        <td class="tbUser-info_ntd"><asp:Literal ID="lbHinhthuclamviec" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td valign="top" class="tbUser-info_ntd" align="right"><b>Địa điểm làm việc:</b></td>
                        <td class="tbUser-info_ntd"><asp:Literal ID="lbDiadiemlamviec" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td valign="top" class="tbUser-info_ntd" align="right"><b>Mức lương mong muốn:</b></td>
                        <td class="tbUser-info_ntd"><asp:Literal ID="lbMucluongmongmuon" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td valign="top" class="tbUser-info_ntd" align="right"><b>Mục tiêu nghề nghiệp:</b></td>
                        <td class="tbUser-info_ntd">
                        <asp:Literal ID="lbMuctieunghenghiep" runat ="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Kinh nghiệm làm việc</h3>
            <div>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="180" valign="top" class="tbUser-info_ntd" align="right"><b>Số năm kinh nghiệm:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbSonamkinhnghiem" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Kinh nghiệm:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbKinhnghiem" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Các kỹ năng:</b></td>
                      <td class="tbUser-info_ntd">
                        <asp:Literal ID="lbCackynang" runat ="server"></asp:Literal>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" height="10"></td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
        <div style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Trình độ học vấn</h3>
            <div>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="180" valign="top" class="tbUser-info_ntd" align="right"><b>Trình độ học vấn:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbBangcap" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngành học:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNganhhoc" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Tốt nghiệp năm:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbTotnghiepnam" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Tốt nghiệp tại trường:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbTotnghieptaitruong" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngoại ngữ:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNgoaingu" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Trình độ tin học:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbTrinhdotinhoc" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Các bằng cấp/ chứng chỉ khác:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbBangcapkhac" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td colspan="2" height="10"></td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
        <div style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin cá nhân</h3>
            <div>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="125" valign="top" class="tbUser-info_ntd" align="right"><b>Họ và tên:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbHoTen" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngày sinh:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNgaysinh" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Giới tính:</b></td>
                      <td class="tbUser-info"><asp:Literal ID="lbGioitinh" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Tình trạng hôn nhân:</b></td>
                      <td class="tbUser-info"><asp:Literal ID="lbTinhtranghonnhan" runat ="server"></asp:Literal></td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
        <div style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin liên hệ</h3>
            <div>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="125" valign="top" class="tbUser-info_ntd" align="right"><b>Người liên hệ:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNguoiulienhe" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Địa chỉ liên hệ:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbDiachilienhe" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Email liên hệ:</b></td>
                      <td class="tbUser-info"><asp:Literal ID="lbEmaillienhe" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Điện thoại liên hệ:</b></td>
                      <td class="tbUser-info"><asp:Literal ID="lbDienthoailienhe" runat ="server"></asp:Literal></td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
