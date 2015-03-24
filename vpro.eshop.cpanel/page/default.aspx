<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="vpro.eshop.cpanel.page._default" %>

<%@ Register Src="../ucControls/ucHeader.ascx" TagName="ucHeader" TagPrefix="uc1" %>
<%@ Register Src="../ucControls/ucFooter.ascx" TagName="ucFooter" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>EShop V1.0</title>
    <link href="../Styles/Cpanel_Login.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/Cpanel_Site.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/UtilitiesCpanel.js" type="text/javascript"></script>
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:ucHeader ID="ucHeader1" runat="server" />
    <div id="content">
        <div id="menu">
            <div id="menu_parent">
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/category70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/category_list.aspx">Chuyên mục</a></div>
                    <div id="menu_content">
                        Chuyên mục là nơi khai báo thể hiện tất cả các menu trên website. Bao gồm menu trên,
                        dưới, trái, phải....</div>
                </div>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/icon-news70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/news_list.aspx">Dự án-Sản phẩm-Tin tức</a></div>
                    <div id="menu_content">
                        Thêm mới/ Cập nhật tất cả các bài viết trên website, các bài biết tin tức, các bài
                        viết về dịch vụ.</div>
                </div>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/ads70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/aditem_list.aspx">Banner quảng cáo </a>
                    </div>
                    <div id="menu_content">
                        Đăng tải các banner quảng cáo từ phía khách hàng, các Logo của các công ty đối tác.</div>
                </div>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/support-online70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/online_list.aspx">Hỗ trợ trực tuyến</a></div>
                    <div id="menu_content">
                        Quản lý thông tin hỗ trợ trực tuyến hotline, email, facebook, g+, youtube.. trên website</div>
                </div>
                <%--<div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/Admin_online.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/order_list.aspx">Danh sách đơn hàng</a></div>
                    <div id="menu_content">
                        Danh sách các đơn đặt hàng trực tuyến mà khách hàng đã gửi về cho shop</div>
                </div>--%>
            </div>
            <div id="menu_parent">
                <%--<div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/Admin_System.png" width="70" height="70" /></div>
                    <div id="menu_title">
                    <a href="../page/page-video.aspx">
                        Video trang chủ</a></div>
                    <div id="menu_content">
                        Video trang chủ</div>
                </div>--%>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/order70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/order_list.aspx">Danh sách đơn hàng</a></div>
                    <div id="menu_content">
                        Danh sách các đơn đặt hàng trực tuyến mà khách hàng đã gửi về cho shop</div>
                </div>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/contact-icon70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/contact_config.aspx">Thông tin liên hệ</a></div>
                    <div id="menu_content">
                        Xem nhật ký thông tin liên hệ từ phía khách hàng gửi từ website.</div>
                </div>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/user-accounts70.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/user_list.aspx">Người quản trị</a></div>
                    <div id="menu_content">
                        Thêm/ xóa/ sửa/ phân quyền cho các nhóm người quản trị và người quản trị.</div>
                </div>
                <div id="menu_child">
                    <div id="menu_images">
                        <img src="../Images/Admin_General.png" width="70" height="70" /></div>
                    <div id="menu_title">
                        <a href="../page/config_meta.aspx">Cấu hình chung </a>
                    </div>
                    <div id="menu_content">
                        Cấu hình các Meta dành cho Seo, cấu hình Banner &amp; Logo, Cấu hình Footer</div>
                </div>
            </div>
        </div>
    </div>
    <uc2:ucFooter ID="ucFooter1" runat="server" />
    </form>
</body>
</html>
