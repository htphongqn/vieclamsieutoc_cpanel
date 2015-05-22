using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using vpro.functions;
using System.Data;
using vpro.eshop.cpanel.ucControls;
using System.IO;
using System.Web.UI.HtmlControls;

namespace vpro.eshop.cpanel.page
{
    public partial class tuyendung : System.Web.UI.Page
    {

        #region Declare

        private int m_news_id = 0;
        eshopdbDataContext db = new eshopdbDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            m_news_id = Utils.CIntDef(Request["news_id"]);
            if (!IsPostBack)
            {
                ucHeader.HeaderLevel1 = "Tuyển dụng";
                ucHeader.HeaderLevel1_Url = "../page/tuyendung_list.aspx";
                ucHeader.HeaderLevel2 = "Thêm mới/cập nhật Tuyển dụng";
                ucHeader.HeaderLevel2_Url = "../page/tuyendung.aspx";
                LoadInfo();
            }
        }

        #endregion
        private void LoadInfo()
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_ID == m_news_id);
            if (list != null && list.ToList().Count > 0)
            {
                var item = list.ToList()[0];
                txtCount.Value = Utils.CStrDef(item.NEWS_COUNT);
                rblStatus.SelectedValue = Utils.CStrDef(item.NEWS_SHOWTYPE);
                rblNewsPeriod.SelectedValue = Utils.CStrDef(item.NEWS_PERIOD);
                ddlTinhtranghoso.SelectedValue = Utils.CStrDef(item.TINHTRANGHOSO);

                lbChucvu.Text = getCapbac(item.VL_CAOBAC_ID);
                lbNganhnghe.Text = getNganhnghe(item.NEWS_ID);
                lbHinhthuclamviec.Text = getHinhthuclamviec(item.VL_HINHTHUCLAMVIEC_ID);
                lbDiadiemlamviec.Text = getDiadiemlamviec(item.NEWS_ID);
                lbMucluong.Text = getMucluong(item.VL_MUCLUONG_ID);
                lbMotacongviec.Text = Utils.CStrDef(item.MOTACONGVIEC).Replace("\r\n", "<br />");
                lbQuyenloi.Text = Utils.CStrDef(item.QUYENLOI).Replace("\r\n", "<br />");
                lbYeucaukhac.Text = Utils.CStrDef(item.YEUCAUKHAC).Replace("\r\n", "<br />");
                lbHosogom.Text = Utils.CStrDef(item.HOSO).Replace("\r\n", "<br />");
                lbHannop.Text = string.Format("{0:dd/MM/yyyy}", item.NEWS_DEALINE);
                lbHinhthucnophoso.Text = getHinhthucnop(item.VL_HINHTHUCNOPHOSO_ID);
                lbKinhnghiem.Text = getKinhnghiem(item.VL_KINHNGHIEM_ID);
                lbBangcap.Text = getTrinhdohocvan(item.VL_TRINHDOHOCVAN_ID);
                lbGioitinh.Text = Utils.CIntDef(item.YEUCAUGIOITINH, 0) == 1 ? "Nam" : (Utils.CIntDef(item.YEUCAUGIOITINH, 0) == 2 ? "Nữ" : (Utils.CIntDef(item.YEUCAUGIOITINH, 0) == 3 ? "Khác" : "Không yêu cầu"));
                lbDotuoi.Text = getDotuoi(item.VL_DOTUOI_ID);
                lbSoluongtuyen.Text = Utils.CStrDef(item.SOLUONGTUYEN);

                int customerId = Utils.CIntDef(item.CUSTOMER_ID);
                var customer = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId);
                if (customer != null && customer.ToList().Count > 0)
                {
                    lbNguoilienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTNAME);
                    lbDiachilienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTADDRESS);
                    lbEmaillienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTEMAIL);
                    lbDienthoailienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTPHONE);

                    lbTencongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_FULLNAME);
                    lbDiachicongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_ADDRESS);
                    lbWebsite.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_WEBSITE);
                    lbDienthoaicongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_PHONE1);
                    lbGioithieucongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_GIOITHIEU).Replace("\r\n", "<br />");
                    lbQuymoconty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_QUYMO);
                    if (customer.ToList()[0].CUSTOMER_LOGO != "" && customer.ToList()[0].CUSTOMER_LOGO != null)
                        imgLogo.ImageUrl = "~/data/customer/logo/" + customer.ToList()[0].CUSTOMER_LOGO;
                }
            }
        }
        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            var c_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == m_news_id);

            if (c_update.ToList().Count > 0)
            {
                c_update.ToList()[0].NEWS_COUNT = Utils.CIntDef(txtCount.Value);
                c_update.ToList()[0].NEWS_SHOWTYPE = Utils.CIntDef(rblStatus.SelectedValue);
                c_update.ToList()[0].NEWS_PERIOD = Utils.CIntDef(rblNewsPeriod.SelectedValue);
                c_update.ToList()[0].TINHTRANGHOSO = Utils.CIntDef(ddlTinhtranghoso.SelectedValue);

                db.SubmitChanges();

                Response.Redirect("tuyendung_list.aspx?news_id=" + m_news_id);
            }
        }
       
        #endregion     
        public string GetCusSexNTV(object oid)
        {
            int sexid = Utils.CIntDef(oid);
            return sexid == 1 ? "Nam" : (sexid == 2 ? "Nữ" : "Khác");
        }
        public string GetCusHonnhanNTV(object oid)
        {
            int sexid = Utils.CIntDef(oid);
            return sexid == 1 ? "Độc thân" : (sexid == 2 ? "Đã có gia đình" : "N/A");
        }
        public string GetCusLoaitotnghiepNTV(object oid)
        {
            int sexid = Utils.CIntDef(oid);
            return sexid == 1 ? "Xuất sắc" : (sexid == 2 ? "Giỏi" : (sexid == 3 ? "Khá" : (sexid == 4 ? "Trung bình khá" : (sexid == 5 ? "Trung bình" : "N/A"))));
        }
        public string getTenCongty(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == tt);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
        public string getnoilamviec(object ott)
        {
            string s = "";
            int tt = Utils.CIntDef(ott);
            var litem = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            int i = 0;
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    if (i == 0)
                    {
                        s += itemArea.ToList()[0].NAME;
                    }
                    else
                    {
                        s += "<br />" + itemArea.ToList()[0].NAME;
                    }
                    i++;
                }

            }
            return s;
        }
        public string getMucluong(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_MUCLUONGs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getKinhnghiem(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_KINHNGHIEMs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getCapbac(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_CAPBACs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getNganhnghe(object newsId)
        {
            int id = Utils.CIntDef(newsId);
            var item = db.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].ESHOP_CATEGORy.CAT_NAME;
            }
            return "";
        }
        public int getNganhngheID(object newsId)
        {
            int id = Utils.CIntDef(newsId);
            var item = db.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].ESHOP_CATEGORy.CAT_ID;
            }
            return 0;
        }
        public string getHinhthuclamviec(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_HINHTHUCLAMVIECs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getDiadiemlamviec(object ott)
        {
            string s = "";
            int tt = Utils.CIntDef(ott);
            var litem = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            int i = 0;
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    if (i == 0)
                    {
                        s += itemArea.ToList()[0].NAME;
                    }
                    else
                    {
                        s += "<br />" + itemArea.ToList()[0].NAME;
                    }
                    i++;
                }

            }
            return s;
        }
        public string getHinhthucnop(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_HINHTHUCNOPHOSOs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getTrinhdohocvan(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_TRINHDOHOCVANs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getTruongtotnghiep(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_TRUONGTOTNGHIEPs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getNgoaingu(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_NGOAINGUs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getDotuoi(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_DOTUOIs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "Không yêu cầu";
        }
        public string getCusName(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
    }
}