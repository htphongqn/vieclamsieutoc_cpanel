<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLeftmenu.ascx.cs"
    Inherits="vpro.eshop.cpanel.ucControls.ucLeftmenu" %>
<div id="contentpr_menu">
    <ul>
        <li><a href="#">
            <img src="../Images/category20.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Chuyên mục</a>
            <ul>
                <li><a href="category_list.aspx">Danh sách chuyên mục</a></li>
                <li><a href="category.aspx">Thêm mới chuyên mục</a></li>
            </ul>
        </li>
        <li><a href="#">
            <img src="../Images/category20.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Danh mục</a>
            <ul>
                <li><a href="khuvucs.aspx">DS khu vực</a></li>
                <li><a href="mucluongs.aspx">DS mức lương</a></li>
                <li><a href="kinhnghiems.aspx">DS kinh nghiệm</a></li>
                <li><a href="thanhphos.aspx">DS thành phố</a></li>
                <li><a href="capbacs.aspx">DS cấp bậc</a></li>
                <li><a href="bangcaps.aspx">DS bằng cấp</a></li>
                <li><a href="dotuois.aspx">DS độ tuổi</a></li>
                <li><a href="truongtotnghieps.aspx">DS trường tốt nghiệp</a></li>
                <li><a href="hinhthuclamviecs.aspx">DS hình thức làm việc</a></li>
                <li><a href="hinhthucnophosos.aspx">DS hình thức nộp hồ sơ</a></li>
            </ul>
        </li>
        <li><a href="#">
            <img src="../Images/Create_product.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Tin tức</a>
            <ul>
                <li><a href="news_list.aspx">Danh sách tin tức</a></li>
                <li><a href="news.aspx">Thêm mới tin tức</a></li>
                <%--<li><a href="extensionfiles_list.aspx">Dạng mở rộng file</a></li>
                <li><a href="page-comment.aspx">Danh sách comment</a></li>--%>
            </ul>
        </li>
        <li><a href="#">
            <img src="../Images/Create_product.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Việc làm</a>
            <ul>
                <li><a href="timviec_list.aspx">Danh sách tìm việc</a></li>
                <li><a href="tuyendung_list.aspx">Danh sách tuyển dụng</a></li>
                <li><a href="customer_list.aspx">Danh sách khách hàng</a></li>
            </ul>
        </li>
        <%--<li><a href="#">
            <img src="../Images/Create_product.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Video trang chủ</a>
            <ul>
                
                <li><a href="page-video.aspx">Video trang chủ</a></li>
            </ul>
        </li>
         <li><a href="#">
            <img src="../Images/Create_product.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Vote</a>
            <ul> 
                <li><a href="vote-list.aspx">Danh sách vote</a></li>
            </ul>
        </li>--%>
        <li><a href="#">
            <img src="../Images/Button_Admin/BannerQuangCao.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Banner quảng cáo</a>
            <ul>
                <li><a href="aditem_list.aspx">Danh sách banner</a></li>
                <li><a href="aditem.aspx">Thêm mới banner</a></li>
            </ul>
        </li>
        <%--<li><a href="#">
            <img src="../Images/Button_Admin/Hotrotructuyen.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Khách hàng</a>
            <ul>
                <li><a href="customer_list.aspx">Danh sách khách hàng</a></li>
                <li><a href="page-email-send.aspx">Email nhận quảng cáo</a></li>
            </ul>
        </li>--%>
        <%--<li><a href="#">
            <img src="../Images/Button_Admin/LienKetweb.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Website liên kết</a>
            <ul>
                <li><a href="websitelink_list.aspx">Danh sách website</a></li>
                <li><a href="websitelink.aspx">Thêm mới website</a></li>
            </ul>
        </li>--%>
        <li><a href="contact_list.aspx">
            <img src="../Images/User_Customer.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Thông tin liên hệ</a>
            <ul>
                <li><a href="contact_list.aspx">DS Đăng ký tư vấn</a></li>
                <li><a href="contact_config.aspx">Cấu hình liên hệ</a></li>
                <%--<li><a href="page-email-send.aspx">Danh sách đăng ký nhận tin </a></li>--%>
            </ul>
        </li>
        <li><a href="#">
            <img src="../Images/Button_Admin/Hotrotructuyen.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Hỗ trợ trực tuyến</a>
            <ul>
                <li><a href="online_list.aspx">Danh sách HTTT</a></li>
                <li><a href="online.aspx">Thêm mới HTTT</a></li>
            </ul>
        </li>
        <%--<li><a href="area_list.aspx">
            <img src="../Images/Button_Admin/Album_Hinh.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Khu vực</a>
            <ul>
                <li><a href="area_list.aspx">Danh sách khu vực</a></li>
                <li><a href="area.aspx">Thêm mới khu vực </a></li>
            </ul>
        </li>--%>
        <%--<li><a href="order_list.aspx">
            <img src="../Images/Button_Admin/Dondathang.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Đơn đặt hàng</a>
            <ul>
                <li><a href="order_list.aspx">Dự án</a></li>
                <li><a href="booking_list.aspx">Khách sạn</a></li>
            </ul>
        </li>--%>
        <li><a href="config_meta.aspx">
            <img src="../Images/User_Config.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Cấu hình </a>
            <ul>
                <li><a href="config_meta.aspx">Cấu hình Meta</a></li>
                <li><a href="Config_Hitcouter.aspx">Lượt truy cập chung</a></li>
                <li><a href="Config_footer.aspx">Cấu hình Footer</a></li>
                <li><a href="Config_banner.aspx">Cấu hình Logo</a></li>
                <%--<li><a href="config_email_list.aspx">Cấu hình Email</a></li>
                <li><a href="config_emailtemplate_list.aspx">Cấu hình Email's template</a></li>--%>
                <%--<li><a href="config_point.aspx">Cấu hình tích lũy điểm</a></li>--%>
            </ul>
        </li>
        <li><a href="#">
            <img src="../Images/user-accounts20.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Người quản trị</a>
            <ul>
                <li><a href="group_list.aspx">DS nhóm quản trị</a></li>
                <li><a href="groups.aspx">Thêm mới nhóm quản trị</a></li>
                <li><a href="user_list.aspx">DS người quản trị</a></li>
                <li><a href="user.aspx">Thêm mới người quản trị</a></li>
            </ul>
        </li>
        <%--
        <li><a href="#">
            <img src="../Images/User_Config.png" width="15" height="15" style="padding-right: 5px;
                border: 0px;" />Thuộc tính sản phẩm </a>
            <ul>
                <li><a href="color_list.aspx">Danh sách màu sắc</a></li>
                <li><a href="color.aspx">Thêm mới/ cập nhật màu sắc </a></li>
            </ul>
        </li>--%>
    </ul>
</div>
