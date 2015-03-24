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

//Create by Lucnv 23-12-2012

namespace vpro.eshop.cpanel.page
{
    public partial class config_emailtemplate_insert : System.Web.UI.Page
    {

        #region Declare

        private int m_email_id = 0;
        eshopdbDataContext DB = new eshopdbDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            m_email_id = Utils.CIntDef(Request["oid"]);

            if (!IsPostBack)
            {
                ucHeader.HeaderLevel1 = "Cấu hình website";
                ucHeader.HeaderLevel1_Url = "../page/config_meta.aspx";
                ucHeader.HeaderLevel2 = "Cấu hình Email's template";
                ucHeader.HeaderLevel2_Url = "../page/config_emailtemplate_list.aspx";  

                getInfo();
            }

        }

        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            SaveInfo();
        }

        #endregion

        #region My Functions

        private void getInfo()
        {
            try
            {
                var G_info = (from g in DB.ESHOP_EMAILTEMPLATEs
                              where g.ID == m_email_id
                              select g
                            );

                if (G_info.ToList().Count > 0)
                {
                    ddlNN.SelectedValue = Utils.CStrDef(G_info.ToList()[0].LANGUAGE);
                    txtCode.Value = G_info.ToList()[0].CODE;
                    txtSubject.Value = G_info.ToList()[0].SUBJECT;
                    txtBody.Value = G_info.ToList()[0].BODY;
                    txtNote.Value = G_info.ToList()[0].NOTE;
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
                if (m_email_id > 0)
                {
                    //update
                    var g_update = DB.GetTable<ESHOP_EMAILTEMPLATE>().Where(g => g.ID == m_email_id);

                    if (g_update.ToList().Count > 0)
                    {
                        g_update.Single().LANGUAGE = Utils.CIntDef(ddlNN.SelectedValue);
                        g_update.Single().CODE = txtCode.Value;
                        g_update.Single().SUBJECT = txtSubject.Value;
                        g_update.Single().BODY = txtBody.Value;
                        g_update.Single().NOTE = txtNote.Value;
                        
                        DB.SubmitChanges();

                        strLink = string.IsNullOrEmpty(strLink) ? "config_emailtemplate_list.aspx" : strLink;
                    }
                }
                else
                {
                    ESHOP_EMAILTEMPLATE item = new ESHOP_EMAILTEMPLATE();
                    item.LANGUAGE = Utils.CIntDef(ddlNN.SelectedValue);
                    item.CODE = txtCode.Value;
                    item.SUBJECT = txtSubject.Value;
                    item.BODY = txtBody.Value;
                    item.NOTE = txtNote.Value;
                    item.ISACTIVE = true;
                    item.ISDELETE = false;
                    item.CREATEDATE = DateTime.Now;
                    DB.ESHOP_EMAILTEMPLATEs.InsertOnSubmit(item);
                    DB.SubmitChanges();

                    strLink = string.IsNullOrEmpty(strLink) ? "config_emailtemplate_list.aspx" : strLink;
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

        #endregion

    }
}