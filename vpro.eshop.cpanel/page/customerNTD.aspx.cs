using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Data;
using vpro.eshop.cpanel.ucControls;
using System.Web.UI.HtmlControls;
namespace vpro.eshop.cpanel.page
{
    public partial class customerNTD : System.Web.UI.Page
    {

        #region Declare

        private int m_customer_id = 0;
        eshopdbDataContext DB = new eshopdbDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            m_customer_id = Utils.CIntDef(Request["customer_id"]);

            if (m_customer_id == 0)
            {
                dvDelete.Visible = false;
            }

            if (!IsPostBack)
            {
                ucHeader.HeaderLevel1 = "Khách hàng";
                ucHeader.HeaderLevel1_Url = "../page/customer_list.aspx";
                ucHeader.HeaderLevel2 = "Thông tin khách hàng";
                ucHeader.HeaderLevel2_Url = "../page/customer_list.aspx";
                Load_VL_City();
                Load_VL_Quymo();
                getInfo();
            }

        }

        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            //if (CheckExits(txtCustomerUN.Value))
            //    lblError.Text = "Đã tồn tại Tên đăng nhập, vui lòng nhập Tên đăng nhập khác.";
            //else
                SaveInfo();
        }

        protected void lbtSaveNew_Click(object sender, EventArgs e)
        {
            //if (CheckExits(txtCustomerUN.Value))
            //    lblError.Text = "Đã tồn tại Tên đăng nhập, vui lòng nhập Tên đăng nhập khác.";
            //else
                SaveInfo("customerNTD.aspx");
        }

        private bool CheckExits(string strUN)
        {
            try
            {
                if (m_customer_id == 0)
                {
                    var exits = (from c in DB.ESHOP_CUSTOMERs where c.CUSTOMER_UN_EMAIL == strUN select c);

                    if (exits.ToList().Count > 0)
                        return true;
                }
                return false;
            }
            catch (Exception ex)
            {  clsVproErrorHandler.HandlerError(ex);
                return false;
              
            }
        }
        

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            DeleteInfo();
        }

        #endregion

        #region My Functions
        private void Load_VL_Quymo()
        {
            var list = DB.VL_QUYMOCONGTies.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
            ddlQuymo.DataSource = list;
            ddlQuymo.DataBind();
        }
        private void Load_VL_City()
        {
            var list = DB.VL_CITies.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
            ddlCity.DataSource = list;
            ddlCity.DataBind();
        }
        public string getDate(object News_PublishDate)
        {
            return string.Format("{0:dd/MM/yyyy}", News_PublishDate);
        }
        private void getInfo()
        {
            try
            {
                var G_info = (from g in DB.ESHOP_CUSTOMERs
                              where g.CUSTOMER_ID == m_customer_id 
                              select g
                            );

                if (G_info.ToList().Count > 0)
                {
                    lbEmailUser.Text = G_info.ToList()[0].CUSTOMER_UN_EMAIL;
                    rdbTrangthai.SelectedValue = Utils.CStrDef(G_info.ToList()[0].ISACTIVE);
                    txtCustomerName.Value = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_FULLNAME);
                    ddlQuymo.SelectedValue = Utils.CStrDef(G_info.ToList()[0].VL_QUYMOCONGTY_ID);
                    txt_mo_ta_cty.Value = G_info.ToList()[0].CUSTOMER_SOLUOC;
                    txt_ma_so_thue.Value = G_info.ToList()[0].CUSTOMER_MASOTHUE;
                    txt_dia_chi_cong_ty.Value = G_info.ToList()[0].CUSTOMER_ADDRESS;
                    ddlCity.SelectedValue = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_CITY);
                    txt_website.Value = G_info.ToList()[0].CUSTOMER_WEBSITE;

                    txt_ten_lien_he.Value = G_info.ToList()[0].CUSTOMER_CONTACTNAME;
                    txt_dia_chi_nguoi_lien_he.Value = G_info.ToList()[0].CUSTOMER_CONTACTADDRESS;
                    txt_dien_thoai_lien_he.Value = G_info.ToList()[0].CUSTOMER_CONTACTPHONE;
                    txt_email_lien_he.Value = G_info.ToList()[0].CUSTOMER_CONTACTEMAIL;

                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void SaveInfo(string strLink = "")
        {
            try
            {

                var g_update = DB.GetTable<ESHOP_CUSTOMER>().Where(g => g.CUSTOMER_ID == m_customer_id);

                if (g_update.ToList().Count > 0)
                {
                    g_update.Single().ISACTIVE = Utils.CIntDef(rdbTrangthai.SelectedValue);
                    g_update.Single().CUSTOMER_FULLNAME = txtCustomerName.Value.ToString();
                    g_update.Single().VL_QUYMOCONGTY_ID = Utils.CIntDef(ddlQuymo.SelectedValue);
                    g_update.Single().CUSTOMER_SOLUOC = txt_mo_ta_cty.Value.ToString();
                    g_update.Single().CUSTOMER_MASOTHUE = txt_ma_so_thue.Value.ToString();
                    g_update.Single().CUSTOMER_ADDRESS = txt_dia_chi_cong_ty.Value;                 
                    g_update.Single().CUSTOMER_CITY = Utils.CIntDef(ddlCity.SelectedValue);
                    g_update.Single().CUSTOMER_WEBSITE = txt_website.Value; 

                    g_update.Single().CUSTOMER_CONTACTNAME = txt_ten_lien_he.Value;
                    g_update.Single().CUSTOMER_CONTACTADDRESS = txt_dia_chi_nguoi_lien_he.Value;
                    g_update.Single().CUSTOMER_CONTACTPHONE = txt_dien_thoai_lien_he.Value;
                    g_update.Single().CUSTOMER_CONTACTEMAIL = txt_email_lien_he.Value; 

                    DB.SubmitChanges();

                    strLink = string.IsNullOrEmpty(strLink) ? "customer_list.aspx" : strLink;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                if (!string.IsNullOrEmpty(strLink))
                { Response.Redirect(strLink); }
            }
        }

        private void DeleteInfo()
        {
            try
            {
                var G_info = DB.GetTable<ESHOP_CUSTOMER>().Where(g => g.CUSTOMER_ID == m_customer_id);

                DB.ESHOP_CUSTOMERs.DeleteAllOnSubmit(G_info);
                DB.SubmitChanges();

                Response.Redirect("customer_list.aspx");

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #endregion

    }
}