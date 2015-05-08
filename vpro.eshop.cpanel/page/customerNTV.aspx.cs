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
    public partial class customerNTV : System.Web.UI.Page
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
                getInfo();
            }

        }

        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
                SaveInfo();
        }

        protected void lbtSaveNew_Click(object sender, EventArgs e)
        {
            //if (CheckExits(txtCustomerUN.Value))
            //    lblError.Text = "Đã tồn tại Tên đăng nhập, vui lòng nhập Tên đăng nhập khác.";
            //else
                SaveInfo("customerNTV.aspx");
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
                    txtCustomerName.Value =Utils.CStrDef(G_info.ToList()[0].CUSTOMER_FULLNAME);
                    txtCustomerAddress.Value = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_ADDRESS);
                    txtCustomerPhone1.Value = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_PHONE1);
                    txtCustomerEmail.Value = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_EMAIL);
                    rblsex.SelectedValue = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_SEX);
                    ddlCity.SelectedValue = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_CITY);
                    ddlTinhtrangHonnhan.SelectedValue = Utils.CStrDef(G_info.ToList()[0].CUSTOMER_HONNHAN);

                    //DateTime birthday = Utils.CDateDef(item.CUSTOMER_BIRTHDAY, DateTime.MinValue);
                    //txtBirthday.Value = "";
                    //if (birthday != DateTime.MinValue)
                    //    txtBirthday.Value = birthday.ToString("dd/MM/yyyy");
                    //if (item.CUSTOMER_LOGO != "" && item.CUSTOMER_LOGO != null)
                    //    imgAvata.ImageUrl = "~/data/customer/logo/" + item.CUSTOMER_LOGO;              
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
                    g_update.Single().CUSTOMER_PHONE1 = txtCustomerPhone1.Value;
                    g_update.Single().CUSTOMER_ADDRESS = txtCustomerAddress.Value;
                    g_update.Single().CUSTOMER_EMAIL = txtCustomerEmail.Value;
                    g_update.Single().CUSTOMER_SEX = Utils.CIntDef(rblsex.SelectedValue);
                    g_update.Single().CUSTOMER_HONNHAN = Utils.CIntDef(ddlTinhtrangHonnhan.SelectedValue);
                    g_update.Single().CUSTOMER_CITY = Utils.CIntDef(ddlCity.SelectedValue);

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