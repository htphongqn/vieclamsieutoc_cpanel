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
using vpro.eshop.cpanel.Components;

namespace vpro.eshop.cpanel.page
{
    public partial class truongtotnghiep : System.Web.UI.Page
    {
        #region Declare

        private int _id = 0; int lang = 1;
        int _count = 0;
        eshopdbDataContext DB = new eshopdbDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            _id = Utils.CIntDef(Request["id"]);
            if (_id == 0)
            {
                dvDelete.Visible = false;
            }

            if (!IsPostBack)
            {
                ucHeader.HeaderLevel1 = "DS trường tốt nghiệp";
                ucHeader.HeaderLevel1_Url = "../page/truongtotnghieps.aspx";
                ucHeader.HeaderLevel2 = "Thêm mới trường tốt nghiệp";
                ucHeader.HeaderLevel2_Url = "../page/truongtotnghiep.aspx";

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
            SaveInfo("truongtotnghiep.aspx");
        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            DeleteInfo();
        }

        #endregion

        #region My functions

        private void getInfo()
        {
            try
            {
                var G_info = (from c in DB.VL_TRUONGTOTNGHIEPs
                              where c.ID == _id
                              select c
                            );

                if (G_info.ToList().Count > 0)
                {
                    txtName.Value = G_info.ToList()[0].NAME;
                    txtDesc.Value = G_info.ToList()[0].DESCRIPTION;
                    txtOrder.Value = Utils.CStrDef(G_info.ToList()[0].PRIORITY);
                    rblActive.SelectedValue = Utils.CStrDef(G_info.ToList()[0].ACTIVE);
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
                string Name = txtName.Value;
                string Desc = txtDesc.Value;

                int Active = Utils.CIntDef(rblActive.SelectedValue);
                int Order = Utils.CIntDef(txtOrder.Value);
              
                if (_id == 0)
                {
                    //insert

                    VL_TRUONGTOTNGHIEP insert = new VL_TRUONGTOTNGHIEP();

                    insert.NAME = Name;
                    insert.DESCRIPTION = Desc;

                    insert.ACTIVE = Active;
                    insert.PRIORITY = Order;


                    DB.VL_TRUONGTOTNGHIEPs.InsertOnSubmit(insert);
                    DB.SubmitChanges();

                    _id = Utils.CIntDef(insert.ID);

                    strLink = string.IsNullOrEmpty(strLink) ? "truongtotnghieps.aspx?id=" + _id : strLink;
                }
                else
                {
                    //update
                    var c_update = DB.GetTable<VL_TRUONGTOTNGHIEP>().Where(g => g.ID == _id);

                    if (c_update.ToList().Count > 0)
                    {
                        c_update.First().NAME = Name;
                        c_update.First().DESCRIPTION = Desc;


                        c_update.First().ACTIVE = Active;
                        c_update.First().PRIORITY = Order;

                        DB.SubmitChanges();

                        strLink = string.IsNullOrEmpty(strLink) ? "truongtotnghieps.aspx" : strLink;
                    }
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
                var G_info = DB.GetTable<VL_TRUONGTOTNGHIEP>().Where(g => g.ID == _id);

                DB.VL_TRUONGTOTNGHIEPs.DeleteAllOnSubmit(G_info);
                DB.SubmitChanges();
                Response.Redirect("truongtotnghieps.aspx");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void DeleteAllFilesInFolder(string folderpath)
        {
            foreach (var f in System.IO.Directory.GetFiles(folderpath))
                System.IO.File.Delete(f);
        }

        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }

        public string getLink(object GroupId)
        {
            return "truongtotnghiep.aspx?id=" + Utils.CStrDef(GroupId);
        }

        public static string Duplicate(string partToDuplicate, int howManyTimes)
        {
            string result = "";

            for (int i = 0; i < howManyTimes; i++)
                result += partToDuplicate;

            return result;
        }

        #endregion
    }
}