﻿using System;
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
    public partial class news : System.Web.UI.Page
    {

        #region Declare

        private int m_news_id = 0;
        int _count = 0;
        int _count1 = 0;
        //int lang = 0;
        eshopdbDataContext DB = new eshopdbDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            m_news_id = Utils.CIntDef(Request["news_id"]);
            LoadArea1();
            LoadArea2();
            if (m_news_id == 0)
            {
                dvDelete.Visible = false;
                //trImage1.Visible = false;
                trNewsFunction.Visible = false;
                trImage3.Visible = false;
            }
            else
            {
                hplCatNews.HRef = "news_category.aspx?news_id=" + m_news_id;
                hplEditorHTMl.HRef = "news_editor.aspx?news_id=" + m_news_id;
                hplNewsAtt.HRef = "news_attachment.aspx?news_id=" + m_news_id;
                hplAlbum.HRef = "news_images.aspx?news_id=" + m_news_id;
                //bplNewsCopy.HRef = "news_copy.aspx?news_id=" + m_news_id;
                hplComment.HRef = "news_comment.aspx?news_id=" + m_news_id;
                //hplCatProducts.HRef = "news_news.aspx?news_id=" + m_news_id;
            }
            //lang = Convert.ToInt32(Session["NN"]);
            Session["FileManager"] = "/data/";
            if (!IsPostBack)
            {
                ucHeader.HeaderLevel1 = "Tin tức";
                ucHeader.HeaderLevel1_Url = "../page/news_list.aspx";
                ucHeader.HeaderLevel2 = "Thêm mới/cập nhật Tin tức";
                ucHeader.HeaderLevel2_Url = "../page/news.aspx";
                LoadCategoryParent();
                getInfo();
                showFileHTML();
                rblNewsType_SelectedIndexChanged(null, null);
            }
        }

        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            if (CheckExitsLink(txtSeoUrl.Value))
                lblError.Text = "Đã tồn tại Seo Url, vui lòng nhập Seo Url khác cho tin.";
            else
                SaveInfo();
        }

        protected void lbtSaveNew_Click(object sender, EventArgs e)
        {
            if (CheckExitsLink(txtSeoUrl.Value))
                lblError.Text = "Đã tồn tại Seo Url, vui lòng nhập Seo Url khác cho chuyên mục.";
            else
                SaveInfo("news.aspx");
        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            DeleteInfo();
        }

        protected void btnDelete1_Click(object sender, ImageClickEventArgs e)
        {
            string strLink = "";
            try
            {
                var n_info = DB.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == m_news_id);

                if (n_info.ToList().Count > 0)
                {
                    if (!string.IsNullOrEmpty(n_info.ToList()[0].NEWS_IMAGE1))
                    {
                        string imagePath = Server.MapPath(PathFiles.GetPathNews(m_news_id) + n_info.ToList()[0].NEWS_IMAGE1);
                        n_info.ToList()[0].NEWS_IMAGE1 = "";
                        DB.SubmitChanges();

                        if (File.Exists(imagePath))
                            File.Delete(imagePath);

                        strLink = "news.aspx?news_id=" + m_news_id;
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
                    Response.Redirect(strLink);
            }
        }

        #endregion

        #region My functions

        

        private void LoadCategoryParent()
        {
            try
            {
                var CatList = (
                                from t2 in DB.ESHOP_CATEGORies
                                where t2.CAT_RANK > 0
                                //&& t2.CAT_LANGUAGE == lang
                                && t2.CAT_TYPE != 2
                                select new
                                {
                                    CAT_ID = t2.CAT_NAME == "------- Root -------" ? 0 : t2.CAT_ID,
                                    CAT_NAME = (string.IsNullOrEmpty(t2.CAT_CODE) ? t2.CAT_NAME : t2.CAT_NAME + "(" + t2.CAT_CODE + ")"),
                                    CAT_NAME_EN = (string.IsNullOrEmpty(t2.CAT_CODE_EN) ? t2.CAT_NAME_EN : t2.CAT_NAME_EN + "(" + t2.CAT_CODE_EN + ")"),
                                    CAT_PARENT_ID = t2.CAT_PARENT_ID,
                                    CAT_RANK = t2.CAT_RANK
                                }
                            );

                if (CatList.ToList().Count > 0)
                {
                    DataRelation relCat;
                    DataTable tbl = DataUtil.LINQToDataTable(CatList);
                    DataSet ds = new DataSet();
                    ds.Tables.Add(tbl);

                    tbl.PrimaryKey = new DataColumn[] { tbl.Columns["CAT_ID"] };
                    relCat = new DataRelation("Category_parent", ds.Tables[0].Columns["CAT_ID"], ds.Tables[0].Columns["CAT_PARENT_ID"], false);

                    ds.Relations.Add(relCat);
                    DataSet dsCat = ds.Clone();
                    DataTable CatTable = ds.Tables[0];

                    DataUtil.TransformTableWithSpace(ref CatTable, dsCat.Tables[0], relCat, null);

                    ddlCategory.DataSource = dsCat.Tables[0];
                    ddlCategory.DataTextField = "CAT_NAME";
                    ddlCategory.DataValueField = "CAT_ID";
                    ddlCategory.DataBind();

                }
                else
                {
                    DataTable dt = new DataTable("Newtable");

                    dt.Columns.Add(new DataColumn("CAT_ID"));
                    dt.Columns.Add(new DataColumn("CAT_NAME"));
                    dt.Columns.Add(new DataColumn("CAT_NAME_EN"));

                    DataRow row = dt.NewRow();
                    row["CAT_ID"] = 0;
                    row["CAT_NAME"] = "--------Root--------";
                    row["CAT_NAME_EN"] = "--------Root--------";
                    dt.Rows.Add(row);

                    ddlCategory.DataTextField = "CAT_NAME";
                    ddlCategory.DataValueField = "CAT_ID";
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataBind();
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        //private void LoadUnits()
        //{
        //    try
        //    {
        //        var units = DB.GetTable<ESHOP_UNIT>();

        //        ddlUnit1.DataSource = units;
        //        ddlUnit1.DataTextField = "UNIT_NAME";
        //        ddlUnit1.DataValueField = "UNIT_ID";
        //        ddlUnit1.DataBind();

        //        ddlUnit2.DataSource = units;
        //        ddlUnit2.DataTextField = "UNIT_NAME";
        //        ddlUnit2.DataValueField = "UNIT_ID";
        //        ddlUnit2.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}

        private void getInfo()
        {
            try
            {
                //LoadUnits();
                Components.CpanelUtils.createItemTarget(ref ddlTarget);
               
                var G_info = (from n in DB.ESHOP_NEWs
                              join c in DB.ESHOP_NEWS_CATs on n.NEWS_ID equals c.NEWS_ID into t2_join
                              from c in t2_join.DefaultIfEmpty()
                              where n.NEWS_ID == m_news_id
                              select new { 
                                  n,
                                  c.CAT_ID
                              }
                            );

                if (G_info.ToList().Count > 0)
                {
                    ddlCategory.SelectedValue = G_info.ToList()[0].CAT_ID.ToString();
                    //var eshopnewscats = DB.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == G_info.ToList()[0].CAT_ID);

                    //trCat.Visible = false;
                    txtTitle.Value = G_info.ToList()[0].n.NEWS_TITLE;
                    txtDesc.Value = G_info.ToList()[0].n.NEWS_DESC;
                    txtUrl.Value = G_info.ToList()[0].n.NEWS_URL;
                    

                    ddlTarget.SelectedValue = G_info.ToList()[0].n.NEWS_TARGET;
                    

                    rblNewsType.SelectedValue = Utils.CStrDef(G_info.ToList()[0].n.NEWS_TYPE);
                    rblNewsType_SelectedIndexChanged(null, null);
                    rblStatus.SelectedValue = Utils.CStrDef(G_info.ToList()[0].n.NEWS_SHOWTYPE);
                    rblNewsPeriod.SelectedValue = Utils.CStrDef(G_info.ToList()[0].n.NEWS_PERIOD);
                    //rblField1.SelectedValue = Utils.CStrDef(G_info.ToList()[0].n.NEWS_FIELD1);
                    rblFeefback.SelectedValue = Utils.CStrDef(G_info.ToList()[0].n.NEWS_FEEDBACKTYPE);
                    txtOrder.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_ORDER, "1");
                    txtOrderPeriod.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_ORDER_PERIOD, "1");
                    txtCount.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_COUNT);
                    //lblCount.Text = string.IsNullOrEmpty(Utils.CStrDef(G_info.ToList()[0].n.NEWS_COUNT)) ? "0" : Utils.CStrDef(G_info.ToList()[0].n.NEWS_COUNT);
                    //lblSendEmail.Text = G_info.ToList()[0].n.NEWS_SENDDATE == null ? "Chưa gửi" : "Gửi lần cuối vào " + string.Format("{0:dd/MM/yyyy HH:mm:ss}", G_info.ToList()[0].n.NEWS_SENDDATE);


                    txtAddress.Value = G_info.ToList()[0].n.ADDRESS;
                    txtPhone.Value = G_info.ToList()[0].n.PHONE;
                    txtEmail.Value = G_info.ToList()[0].n.EMAIL;
                    txtGooglelink.Value = G_info.ToList()[0].n.GOOPMAPSLINK;

                    //seo
                    txtSeoTitle.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_SEO_TITLE);
                    txtSeoKeyword.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_SEO_KEYWORD);
                    txtSeoDescription.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_SEO_DESC);
                    txtSeoUrl.Value = Utils.CStrDef(G_info.ToList()[0].n.NEWS_SEO_URL);
                    //PRICE
                   
                    //ddlUnit2.SelectedValue = Utils.CStrDef(G_info.ToList()[0].n.UNIT_ID2);

                    //Product Properties
                   // txtStatus.Value = G_info.ToList()[0].n.NEWS_FIELD1;
                   // txtWarranty.Value = G_info.ToList()[0].n.NEWS_FIELD2;
                   // txtOrigin.Value = G_info.ToList()[0].n.NEWS_FIELD3;
                    //txtManufacture.Value = G_info.ToList()[0].n.NEWS_FIELD4;
                   // txtWeight.Value = G_info.ToList()[0].n.NEWS_FIELD5;
                    //image
                    //if (!string.IsNullOrEmpty(G_info.ToList()[0].n.NEWS_IMAGE1))
                    //{
                    //    trUploadImage1.Visible = false;
                    //    trImage1.Visible = true;
                    //    Image1.Src = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE1;
                    //    hplImage1.NavigateUrl = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE1;
                    //    hplImage1.Text = G_info.ToList()[0].n.NEWS_IMAGE1; 
                    //}
                    //else
                    //{
                    //    trUploadImage1.Visible = true;
                    //    trImage1.Visible = false;
                    //}

                    ////image2
                    //if (!string.IsNullOrEmpty(G_info.ToList()[0].n.NEWS_IMAGE2))
                    //{
                    //    trUploadImage2.Visible = false;
                    //    trImage2.Visible = true;
                    //    Image2.Src = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE2;
                    //    hplImage2.NavigateUrl = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE2;
                    //    hplImage2.Text = G_info.ToList()[0].n.NEWS_IMAGE2;
                    //}
                    //else
                    //{
                    //    trUploadImage2.Visible = true;
                    //    trImage2.Visible = false;
                    //}

                    //image3
                    if (!string.IsNullOrEmpty(G_info.ToList()[0].n.NEWS_IMAGE3))
                    {
                        trUploadImage3.Visible = false;
                        trImage3.Visible = true;
                        Image3.Src = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE3;
                        hplImage3.NavigateUrl = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE3;
                        hplImage3.Text = G_info.ToList()[0].n.NEWS_IMAGE3;
                    }
                    else
                    {
                        trUploadImage3.Visible = true;
                        trImage3.Visible = false;
                    }
                    ////image4
                    //if (!string.IsNullOrEmpty(G_info.ToList()[0].n.NEWS_IMAGE4))
                    //{
                    //    trUploadImage4.Visible = false;
                    //    trImage4.Visible = true;
                    //    Image4.Src = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE4;
                    //    hplImage4.NavigateUrl = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].n.NEWS_IMAGE4;
                    //    hplImage4.Text = G_info.ToList()[0].n.NEWS_IMAGE4;
                    //}
                    //else
                    //{
                    //    trUploadImage4.Visible = true;
                    //    trImage4.Visible = false;
                    //}
                }
                else
                {
                    //trUploadImage1.Visible = true;
                    //trImage1.Visible = false;
                    //trUploadImage2.Visible = true;
                    //trImage2.Visible = false;
                    trUploadImage3.Visible = true;
                    trImage3.Visible = false;
                    //trUploadImage4.Visible = true;
                    //trImage4.Visible = false;
                    LoadCategoryParent();
                    //trCat.Visible = true;

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
                //get image
                //string News_Image1;

                //if (trUploadImage1.Visible == true)
                //{
                //    if (fileImage1.PostedFile != null)
                //    {
                //        News_Image1 = Path.GetFileName(fileImage1.PostedFile.FileName);
                //    }
                //    else
                //    {
                //        News_Image1 = "";
                //    }
                //}
                //else
                //{
                //    News_Image1 = hplImage1.Text;
                //}

                //string News_Image2;

                //if (trUploadImage2.Visible == true)
                //{
                //    if (fileImage2.PostedFile != null)
                //    {
                //        News_Image2 = Path.GetFileName(fileImage2.PostedFile.FileName);
                //    }
                //    else
                //    {
                //        News_Image2 = "";
                //    }
                //}
                //else
                //{
                //    News_Image2 = hplImage2.Text;
                //}

                string News_Image3;

                if (trUploadImage3.Visible == true)
                {
                    if (fileImage3.PostedFile != null)
                    {
                        News_Image3 = Path.GetFileName(fileImage3.PostedFile.FileName);
                    }
                    else
                    {
                        News_Image3 = "";
                    }
                }
                else
                {
                    News_Image3 = hplImage3.Text;
                }
                //string News_Image4;

                //if (trUploadImage4.Visible == true)
                //{
                //    if (fileImage4.PostedFile != null)
                //    {
                //        News_Image4 = Path.GetFileName(fileImage4.PostedFile.FileName);
                //    }
                //    else
                //    {
                //        News_Image4 = "";
                //    }
                //}
                //else
                //{
                //    News_Image4 = hplImage4.Text;
                //}

                

                int _iType = Utils.CIntDef(rblNewsType.SelectedValue);

                if (_iType == 0 || _iType == 3)
                {
                    if (m_news_id == 0)
                    {

                        //insert
                        ESHOP_NEW news_insert = new ESHOP_NEW();

                        news_insert.NEWS_TITLE = txtTitle.Value;
                        news_insert.NEWS_DESC = txtDesc.Value;
                        news_insert.NEWS_URL = txtUrl.Value;
                        news_insert.NEWS_TARGET = ddlTarget.SelectedValue;
                        news_insert.NEWS_SEO_URL = txtSeoUrl.Value;
                        news_insert.NEWS_SEO_TITLE = txtSeoTitle.Value;
                        news_insert.NEWS_SEO_KEYWORD = txtSeoKeyword.Value;
                        news_insert.NEWS_SEO_DESC = txtSeoDescription.Value;

                        news_insert.NEWS_TYPE = Utils.CIntDef(rblNewsType.SelectedValue);
                        news_insert.NEWS_SHOWTYPE = Utils.CIntDef(rblStatus.SelectedValue);
                        news_insert.NEWS_PERIOD = Utils.CIntDef(rblNewsPeriod.SelectedValue);
                        //news_insert.NEWS_FIELD1 = Utils.CStrDef(rblField1.SelectedValue);
                        news_insert.NEWS_SHOWINDETAIL = Utils.CIntDef(rblShowDetail.SelectedValue);
                        news_insert.NEWS_FEEDBACKTYPE = Utils.CIntDef(rblFeefback.SelectedValue);
                        news_insert.NEWS_COUNT = Utils.CIntDef(txtCount.Value);
                        news_insert.NEWS_ORDER = Utils.CIntDef(txtOrder.Value);
                        news_insert.NEWS_ORDER_PERIOD = Utils.CIntDef(txtOrderPeriod.Value);
                        
                        //news_insert.UNIT_ID2 = Utils.CIntDef(ddlUnit2.SelectedValue);

                        //news_insert.NEWS_IMAGE1 = News_Image1;
                        //news_insert.NEWS_IMAGE2 = News_Image2;
                        news_insert.NEWS_IMAGE3 = News_Image3;
                        //news_insert.NEWS_IMAGE4 = News_Image4;

                        news_insert.USER_ID = Utils.CIntDef(Session["USER_ID"]);
                        news_insert.NEWS_PUBLISHDATE = DateTime.Now;

                        news_insert.ADDRESS = Utils.CStrDef(txtAddress.Value);
                        news_insert.PHONE = Utils.CStrDef(txtPhone.Value);
                        news_insert.EMAIL = Utils.CStrDef(txtEmail.Value);
                        news_insert.GOOPMAPSLINK = Utils.CStrDef(txtGooglelink.Value);

                        //news_insert.NEWS_LANGUAGE = lang;

                        
                        DB.ESHOP_NEWs.InsertOnSubmit(news_insert);
                        DB.SubmitChanges();

                        //update cat news
                        var _new = DB.GetTable<ESHOP_NEW>().OrderByDescending(g => g.NEWS_ID).Take(1);

                        m_news_id = _new.Single().NEWS_ID;
                        SaveNewsCategory(_new.Single().NEWS_ID);

                        strLink = string.IsNullOrEmpty(strLink) ? "news.aspx?news_id=" + m_news_id : strLink;
                    }
                    else
                    {
                        //update
                        var c_update = DB.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == m_news_id);

                        if (c_update.ToList().Count > 0)
                        {
                            c_update.ToList()[0].NEWS_TITLE = txtTitle.Value;
                            c_update.ToList()[0].NEWS_DESC = txtDesc.Value;
                            c_update.ToList()[0].NEWS_URL = txtUrl.Value;
                            c_update.ToList()[0].NEWS_TARGET = ddlTarget.SelectedValue;
                            c_update.ToList()[0].NEWS_SEO_URL = txtSeoUrl.Value;
                            c_update.ToList()[0].NEWS_SEO_TITLE = txtSeoTitle.Value;
                            c_update.ToList()[0].NEWS_SEO_KEYWORD = txtSeoKeyword.Value;
                            c_update.ToList()[0].NEWS_SEO_DESC = txtSeoDescription.Value;

                           
                            c_update.ToList()[0].NEWS_TYPE = Utils.CIntDef(rblNewsType.SelectedValue);
                            c_update.ToList()[0].NEWS_SHOWTYPE = Utils.CIntDef(rblStatus.SelectedValue);
                            c_update.ToList()[0].NEWS_PERIOD = Utils.CIntDef(rblNewsPeriod.SelectedValue);
                            //c_update.ToList()[0].NEWS_FIELD1 = Utils.CStrDef(rblField1.SelectedValue);
                            c_update.ToList()[0].NEWS_SHOWINDETAIL = Utils.CIntDef(rblShowDetail.SelectedValue);
                            c_update.ToList()[0].NEWS_FEEDBACKTYPE = Utils.CIntDef(rblFeefback.SelectedValue);
                            c_update.ToList()[0].NEWS_COUNT = Utils.CIntDef(txtCount.Value);
                            c_update.ToList()[0].NEWS_ORDER = Utils.CIntDef(txtOrder.Value);
                            c_update.ToList()[0].NEWS_ORDER_PERIOD = Utils.CIntDef(txtOrderPeriod.Value);


                            //c_update.ToList()[0].NEWS_IMAGE1 = News_Image1;
                            //c_update.ToList()[0].NEWS_IMAGE2 = News_Image2;
                            c_update.ToList()[0].NEWS_IMAGE3 = News_Image3;
                            //c_update.ToList()[0].NEWS_IMAGE4 = News_Image4;

                            c_update.ToList()[0].ADDRESS = Utils.CStrDef(txtAddress.Value);
                            c_update.ToList()[0].PHONE = Utils.CStrDef(txtPhone.Value);
                            c_update.ToList()[0].EMAIL = Utils.CStrDef(txtEmail.Value);
                            c_update.ToList()[0].GOOPMAPSLINK = Utils.CStrDef(txtGooglelink.Value);

                            //c_update.ToList()[0].NEWS_LANGUAGE = lang;


                            DB.SubmitChanges();
                            SaveNewsCategory(c_update.Single().NEWS_ID);
                            strLink = string.IsNullOrEmpty(strLink) ? "news_list.aspx" : strLink;
                        }
                    }

                    //update images
                    //if (trUploadImage1.Visible)
                    //{
                    //    if (!string.IsNullOrEmpty(fileImage1.PostedFile.FileName))
                    //    {
                    //        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                    //        string fullpathfile = pathfile + "/" + News_Image1;

                    //        if (!Directory.Exists(pathfile))
                    //        {
                    //            Directory.CreateDirectory(pathfile);
                    //        }

                    //        fileImage1.PostedFile.SaveAs(fullpathfile);
                    //    }

                    //}
                    //if (trUploadImage2.Visible)
                    //{
                    //    if (!string.IsNullOrEmpty(fileImage2.PostedFile.FileName))
                    //    {
                    //        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                    //        string fullpathfile = pathfile + "/" + News_Image2;

                    //        if (!Directory.Exists(pathfile))
                    //        {
                    //            Directory.CreateDirectory(pathfile);
                    //        }

                    //        fileImage2.PostedFile.SaveAs(fullpathfile);
                    //    }

                    //}

                    if (trUploadImage3.Visible)
                    {
                        if (!string.IsNullOrEmpty(fileImage3.PostedFile.FileName))
                        {
                            string pathfile = Server.MapPath("/data/news/" + m_news_id);
                            string fullpathfile = pathfile + "/" + News_Image3;

                            if (!Directory.Exists(pathfile))
                            {
                                Directory.CreateDirectory(pathfile);
                            }

                            fileImage3.PostedFile.SaveAs(fullpathfile);
                        }

                    }
                    //if (trUploadImage4.Visible)
                    //{
                    //    if (!string.IsNullOrEmpty(fileImage4.PostedFile.FileName))
                    //    {
                    //        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                    //        string fullpathfile = pathfile + "/" + News_Image4;

                    //        if (!Directory.Exists(pathfile))
                    //        {
                    //            Directory.CreateDirectory(pathfile);
                    //        }

                    //        fileImage4.PostedFile.SaveAs(fullpathfile);
                    //    }

                    //}
                }
                else
                {
                    if (CheckError())
                    {
                        if (m_news_id == 0)
                        {

                            //insert
                            ESHOP_NEW news_insert = new ESHOP_NEW();

                            news_insert.NEWS_TITLE = txtTitle.Value;
                            news_insert.NEWS_DESC = txtDesc.Value;
                            news_insert.NEWS_URL = txtUrl.Value;
                            news_insert.NEWS_TARGET = ddlTarget.SelectedValue;
                            news_insert.NEWS_SEO_URL = txtSeoUrl.Value;
                            news_insert.NEWS_SEO_TITLE = txtSeoTitle.Value;
                            news_insert.NEWS_SEO_KEYWORD = txtSeoKeyword.Value;
                            news_insert.NEWS_SEO_DESC = txtSeoDescription.Value;
               
                            news_insert.NEWS_TYPE = Utils.CIntDef(rblNewsType.SelectedValue);
                            news_insert.NEWS_SHOWTYPE = Utils.CIntDef(rblStatus.SelectedValue);
                            news_insert.NEWS_PERIOD = Utils.CIntDef(rblNewsPeriod.SelectedValue);
                            //news_insert.NEWS_FIELD1 = Utils.CStrDef(rblField1.SelectedValue);
                            news_insert.NEWS_SHOWINDETAIL = Utils.CIntDef(rblShowDetail.SelectedValue);
                            news_insert.NEWS_FEEDBACKTYPE = Utils.CIntDef(rblFeefback.SelectedValue);
                            news_insert.NEWS_COUNT = Utils.CIntDef(txtCount.Value);
                            news_insert.NEWS_ORDER = Utils.CIntDef(txtOrder.Value);
                            news_insert.NEWS_ORDER_PERIOD = Utils.CIntDef(txtOrderPeriod.Value);
                            
                            //news_insert.UNIT_ID2 = Utils.CIntDef(ddlUnit2.SelectedValue);

                            //news_insert.NEWS_IMAGE1 = News_Image1;
                            //news_insert.NEWS_IMAGE2 = News_Image2;
                            news_insert.NEWS_IMAGE3 = News_Image3;
                            //news_insert.NEWS_IMAGE4 = News_Image4;

                            news_insert.USER_ID = Utils.CIntDef(Session["USER_ID"]);
                            news_insert.NEWS_PUBLISHDATE = DateTime.Now;

                           // news_insert.NEWS_FIELD1 = txtStatus.Value;
                            //news_insert.NEWS_FIELD2 = txtWarranty.Value;
                            //news_insert.NEWS_FIELD3 = txtOrigin.Value;
                            //news_insert.NEWS_FIELD4 = txtManufacture.Value;
                            //news_insert.NEWS_FIELD5 = txtWeight.Value;

                            news_insert.ADDRESS = Utils.CStrDef(txtAddress.Value);
                            news_insert.PHONE = Utils.CStrDef(txtPhone.Value);
                            news_insert.EMAIL = Utils.CStrDef(txtEmail.Value);
                            news_insert.GOOPMAPSLINK = Utils.CStrDef(txtGooglelink.Value);

                            //news_insert.NEWS_LANGUAGE = lang;


                            DB.ESHOP_NEWs.InsertOnSubmit(news_insert);
                            DB.SubmitChanges();

                            //update cat news
                            var _new = DB.GetTable<ESHOP_NEW>().OrderByDescending(g => g.NEWS_ID).Take(1);

                            m_news_id = _new.Single().NEWS_ID;
                            SaveNewsCategory(_new.Single().NEWS_ID);

                            strLink = string.IsNullOrEmpty(strLink) ? "news.aspx?news_id=" + m_news_id : strLink;
                        }
                        else
                        {
                            //update
                            var c_update = DB.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == m_news_id);

                            if (c_update.ToList().Count > 0)
                            {
                                c_update.ToList()[0].NEWS_TITLE = txtTitle.Value;
                                c_update.ToList()[0].NEWS_DESC = txtDesc.Value;
                                c_update.ToList()[0].NEWS_URL = txtUrl.Value;
                                c_update.ToList()[0].NEWS_TARGET = ddlTarget.SelectedValue;
                                c_update.ToList()[0].NEWS_SEO_URL = txtSeoUrl.Value;
                                c_update.ToList()[0].NEWS_SEO_TITLE = txtSeoTitle.Value;
                                c_update.ToList()[0].NEWS_SEO_KEYWORD = txtSeoKeyword.Value;
                                c_update.ToList()[0].NEWS_SEO_DESC = txtSeoDescription.Value;

                   
                                c_update.ToList()[0].NEWS_TYPE = Utils.CIntDef(rblNewsType.SelectedValue);
                                c_update.ToList()[0].NEWS_SHOWTYPE = Utils.CIntDef(rblStatus.SelectedValue);
                                c_update.ToList()[0].NEWS_PERIOD = Utils.CIntDef(rblNewsPeriod.SelectedValue);
                                //c_update.ToList()[0].NEWS_FIELD1 = Utils.CStrDef(rblField1.SelectedValue);
                                c_update.ToList()[0].NEWS_SHOWINDETAIL = Utils.CIntDef(rblShowDetail.SelectedValue);
                                c_update.ToList()[0].NEWS_FEEDBACKTYPE = Utils.CIntDef(rblFeefback.SelectedValue);
                                c_update.ToList()[0].NEWS_COUNT = Utils.CIntDef(txtCount.Value);
                                c_update.ToList()[0].NEWS_ORDER = Utils.CIntDef(txtOrder.Value);
                                c_update.ToList()[0].NEWS_ORDER_PERIOD = Utils.CIntDef(txtOrderPeriod.Value);
                                
                                //c_update.ToList()[0].NEWS_IMAGE1 = News_Image1;
                                //c_update.ToList()[0].NEWS_IMAGE2 = News_Image2;
                                c_update.ToList()[0].NEWS_IMAGE3 = News_Image3;
                                //c_update.ToList()[0].NEWS_IMAGE4 = News_Image4;

                                c_update.ToList()[0].ADDRESS = Utils.CStrDef(txtAddress.Value);
                                c_update.ToList()[0].PHONE = Utils.CStrDef(txtPhone.Value);
                                c_update.ToList()[0].EMAIL = Utils.CStrDef(txtEmail.Value);
                                c_update.ToList()[0].GOOPMAPSLINK = Utils.CStrDef(txtGooglelink.Value);

                                //c_update.ToList()[0].NEWS_LANGUAGE = lang;

                                DB.SubmitChanges();
                                SaveNewsCategory(c_update.Single().NEWS_ID);
                                strLink = string.IsNullOrEmpty(strLink) ? "news_list.aspx" : strLink;
                            }
                        }

                        //update images
                        //if (trUploadImage1.Visible)
                        //{
                        //    if (!string.IsNullOrEmpty(fileImage1.PostedFile.FileName))
                        //    {
                        //        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                        //        string fullpathfile = pathfile + "/" + News_Image1;

                        //        if (!Directory.Exists(pathfile))
                        //        {
                        //            Directory.CreateDirectory(pathfile);
                        //        }

                        //        fileImage1.PostedFile.SaveAs(fullpathfile);
                        //    }

                        //}
                        //if (trUploadImage2.Visible)
                        //{
                        //    if (!string.IsNullOrEmpty(fileImage2.PostedFile.FileName))
                        //    {
                        //        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                        //        string fullpathfile = pathfile + "/" + News_Image2;

                        //        if (!Directory.Exists(pathfile))
                        //        {
                        //            Directory.CreateDirectory(pathfile);
                        //        }

                        //        fileImage2.PostedFile.SaveAs(fullpathfile);
                        //    }
                        //}

                        if (trUploadImage3.Visible)
                        {
                            if (!string.IsNullOrEmpty(fileImage3.PostedFile.FileName))
                            {
                                string pathfile = Server.MapPath("/data/news/" + m_news_id);
                                string fullpathfile = pathfile + "/" + News_Image3;

                                if (!Directory.Exists(pathfile))
                                {
                                    Directory.CreateDirectory(pathfile);
                                }

                                fileImage3.PostedFile.SaveAs(fullpathfile);
                            }

                        }
                        //if (trUploadImage4.Visible)
                        //{
                        //    if (!string.IsNullOrEmpty(fileImage4.PostedFile.FileName))
                        //    {
                        //        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                        //        string fullpathfile = pathfile + "/" + News_Image4;

                        //        if (!Directory.Exists(pathfile))
                        //        {
                        //            Directory.CreateDirectory(pathfile);
                        //        }

                        //        fileImage4.PostedFile.SaveAs(fullpathfile);
                        //    }

                        //}
                    }
                    //else
                    //{
                    //    lblError.Text = "Vui lòng chọn màu sắc - kích cỡ!";
                    //}
                }
                SaveHTMLInfo();
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
        private void SaveHTMLInfo()
        {
            try
            {
                string htmExt = "-vi.htm";
                //if (lang == 1)
                //{
                //    htmExt = "-vi.htm";
                //}
                //else if (lang == 2)
                //{
                //    htmExt = "-en.htm";
                //}
                //else if (lang == 3)
                //{
                //    htmExt = "-ru.htm";
                //}
                //else if (lang == 4)
                //{
                //    htmExt = "-ch.htm";
                //}
                string chitiettin = m_news_id.ToString() + htmExt;

                if ((m_news_id > 0))
                {
                    string strHTMLFileLocation;
                    string strFileName;
                    string strHTMLContent;
                    StreamWriter fsoFile;

                    strFileName = "/Htm/" + chitiettin;
                    strHTMLFileLocation = Server.MapPath(strFileName);
                    strHTMLContent = mrk.Value;

                    fsoFile = File.CreateText(strHTMLFileLocation);
                    fsoFile.Write(strHTMLContent);
                    fsoFile.Close();                   
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void showFileHTML()
        {
            string pathFile;
            string strHTMLContent;

            if (m_news_id > 0)
            {
                string htmExt = "-vi.htm";
                //if (lang == 1)
                //{
                //    htmExt = "-vi.htm";
                //}
                //else if (lang == 2)
                //{
                //    htmExt = "-en.htm";
                //}
                //else if (lang == 3)
                //{
                //    htmExt = "-ru.htm";
                //}
                //else if (lang == 4)
                //{
                //    htmExt = "-ch.htm";
                //}
                string chitiettin = m_news_id.ToString() + htmExt;
                //chi tiet tin
                pathFile = Server.MapPath("/Htm/" + chitiettin);
                if ((File.Exists(pathFile)))
                {
                    StreamReader objNewsReader;
                    //objNewsReader = New StreamReader(pathFile, System.Text.Encoding.Default)
                    objNewsReader = new StreamReader(pathFile);
                    strHTMLContent = objNewsReader.ReadToEnd();
                    objNewsReader.Close();
                    mrk.Value = strHTMLContent;
                }
                
            }
        }
        private void DeleteInfo()
        {
            string strLink="";
            try
            {
                var G_info = DB.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == m_news_id);

                DB.ESHOP_NEWs.DeleteAllOnSubmit(G_info);
                DB.SubmitChanges();

                //delete folder
                string fullpath = Server.MapPath(PathFiles.GetPathNews(m_news_id));
                if (Directory.Exists(fullpath))
                {
                    DeleteAllFilesInFolder(fullpath);
                    Directory.Delete(fullpath);
                }

                strLink = "news_list.aspx";

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                if (!string.IsNullOrEmpty(strLink))
                    Response.Redirect(strLink);
            }
        }

        private void DeleteAllFilesInFolder(string folderpath)
        {
            foreach (var f in System.IO.Directory.GetFiles(folderpath))
                System.IO.File.Delete(f);
        }

        public string getLink(object GroupId)
        {
            return "news.aspx?news_id=" + Utils.CStrDef(GroupId);
        }

        private bool CheckExitsLink(string strLink)
        {
            try
            {
                var exits = (from c in DB.ESHOP_NEWs where c.NEWS_SEO_URL == strLink && c.NEWS_ID != m_news_id select c);

                if (exits.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {clsVproErrorHandler.HandlerError(ex);
                return false;
                
            }

        }

        private bool CheckError()
        {
            //if (string.IsNullOrEmpty(txtStatus.Value))
            //{
            //    lblError.Text = "Tình trạng sản phẩm không được rỗng!";
            //    return false;
            //}
            //else if (string.IsNullOrEmpty(txtOrigin.Value))
            //{
            //    lblError.Text = "Nhà nhập khẩu sản phẩm không được rỗng!";
            //    return false;
            //}
            //else if (string.IsNullOrEmpty(txtManufacture.Value))
            //{
            //    lblError.Text = "Nhà sản xuất không được rỗng!";
            //    return false;
            //}
            //else if (string.IsNullOrEmpty(txtWeight.Value))
            //{
            //    lblError.Text = "Trọng lượng sản phẩm không được rỗng!";
            //    return false;
            //}
            return true;
        }

        private void SaveNewsCategory(int NewsId)
        {
            try
            {
                int catId = Utils.CIntDef(ddlCategory.SelectedValue);
                var eshopnewscats = DB.ESHOP_NEWS_CATs.Where(n=>n.NEWS_ID == NewsId);
                if (eshopnewscats != null && eshopnewscats.ToList().Count > 0)
                {
                    eshopnewscats.ToList()[0].CAT_ID = catId;
                    eshopnewscats.ToList()[0].NEWS_ID = NewsId;

                    DB.SubmitChanges();
                }
                else
                {
                    ESHOP_NEWS_CAT nc = new ESHOP_NEWS_CAT();
                    nc.CAT_ID = catId;
                    nc.NEWS_ID = NewsId;

                    DB.ESHOP_NEWS_CATs.InsertOnSubmit(nc);
                    DB.SubmitChanges();
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #endregion

        protected void btnDelete2_Click(object sender, ImageClickEventArgs e)
        {
            string strLink = "";
            try
            {
                var n_info = DB.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == m_news_id);

                if (n_info.ToList().Count > 0)
                {
                    if (!string.IsNullOrEmpty(n_info.ToList()[0].NEWS_IMAGE2))
                    {
                        string imagePath = Server.MapPath(PathFiles.GetPathNews(m_news_id) + n_info.ToList()[0].NEWS_IMAGE2);
                        n_info.ToList()[0].NEWS_IMAGE2 = "";
                        DB.SubmitChanges();

                        if (File.Exists(imagePath))
                            File.Delete(imagePath);

                        strLink = "news.aspx?news_id=" + m_news_id;
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
                    Response.Redirect(strLink);
            }
        }

        

        protected void btnDelete3_Click(object sender, ImageClickEventArgs e)
        {
            string strLink = "";
            try
            {
                var n_info = DB.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == m_news_id);

                if (n_info.ToList().Count > 0)
                {
                    if (!string.IsNullOrEmpty(n_info.ToList()[0].NEWS_IMAGE3))
                    {
                        string imagePath = Server.MapPath(PathFiles.GetPathNews(m_news_id) + n_info.ToList()[0].NEWS_IMAGE3);
                        n_info.ToList()[0].NEWS_IMAGE3 = "";
                        DB.SubmitChanges();

                        if (File.Exists(imagePath))
                            File.Delete(imagePath);

                        strLink = "news.aspx?news_id=" + m_news_id;
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
                    Response.Redirect(strLink);
            }
        }

        public string phamtram(decimal pri1, decimal pri2)
        {
            decimal pt = 0;
            decimal giagiam = 0;
            decimal _dPri1 = Utils.CDecDef(pri1);
            decimal _dPri2 = Utils.CDecDef(pri2);
            try
            {
                if (_dPri1 != 0 && _dPri2 != 0)
                {
                    giagiam = (_dPri1 - _dPri2);
                    pt = (giagiam / _dPri1) * 100;
                    return string.Format("{0:0,0}", pt).Replace(",", ".");
                }
                else
                {
                    return "99%";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "99";
            }
        }
        protected void rblNewsType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int _iType = Utils.CIntDef(rblNewsType.SelectedValue);
                switch (_iType)
                {
                    case 1:
                        divchitiet.Visible = false;
                        divEditorHTMl.Visible = true;
                        break;
                    case 2:
                        divchitiet.Visible =false;
                        divEditorHTMl.Visible = true;                       
                        break;
                    case 3:
                        divchitiet.Visible = true;
                        divEditorHTMl.Visible = false;
                        break;
                    case 4:
                        divchitiet.Visible = true;
                        divEditorHTMl.Visible = false;
                        break;
                    case 5:
                        divchitiet.Visible = true;
                        divEditorHTMl.Visible = false;
                        break;
                    case 6:
                        divchitiet.Visible = true;
                        divEditorHTMl.Visible = false;
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #region Vị trí
        private void LoadArea1()
        {
            try
            {
                var AllList = DB.ESHOP_PROPERTies.Where(n => n.PROP_RANK > 0).OrderByDescending(n => n.PROP_PRIORITY).ToList();
                if (AllList.ToList().Count > 0)
                {
                    DataRelation relCat;
                    Session["PropList"] = DataUtil.LINQToDataTable(AllList);
                    DataTable tbl = DataUtil.LINQToDataTable(AllList);
                    DataSet ds = new DataSet();
                    ds.Tables.Add(tbl);
                    tbl.PrimaryKey = new DataColumn[] { tbl.Columns["PROP_ID"] };
                    relCat = new DataRelation("Category_parent", ds.Tables[0].Columns["PROP_ID"], ds.Tables[0].Columns["PROP_PARENT_ID"], false);
                    ds.Relations.Add(relCat);
                    DataSet dsCat = ds.Clone();
                    DataTable CatTable = ds.Tables[0];
                    TransformTableWithSpace(ref CatTable, dsCat.Tables[0], relCat, null);
 
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #region Funtion
        public static string Duplicate(string partToDuplicate, int howManyTimes)
        {
            string result = "";

            for (int i = 0; i < howManyTimes; i++)
                result += partToDuplicate;

            return result;
        }
        public static void TransformTableWithSpace(ref DataTable source, DataTable dest, DataRelation rel, DataRow parentRow)
        {
            if (parentRow == null)
            {
                foreach (DataRow row in source.Rows)
                {
                    if (!row.HasErrors && (Utils.CIntDef(row["PROP_PARENT_ID"]) <= 0))
                    {
                        row["PROP_NAME"] = (Utils.CIntDef(row["PROP_RANK"]) <= 1 ? "" : Duplicate("...", Utils.CIntDef(row["PROP_RANK"]))) + row["PROP_NAME"];
                        dest.Rows.Add(row.ItemArray);
                        row.RowError = "dirty";
                        if (Utils.CStrDef(row["PROP_NAME"]) != "------- Root -------")
                            TransformTableWithSpace(ref source, dest, rel, row);
                    }
                }
            }
            else
            {
                DataRow[] children = parentRow.GetChildRows(rel);
                if (!parentRow.HasErrors)
                {
                    parentRow["PROP_NAME"] = (Utils.CIntDef(parentRow["PROP_RANK"]) <= 1 ? "" : Duplicate("...", Utils.CIntDef(parentRow["PROP_RANK"]))) + parentRow["PROP_NAME"];
                    dest.Rows.Add(parentRow.ItemArray);
                    parentRow.RowError = "dirty";
                }
                if (children != null && children.Length > 0)
                {
                    foreach (DataRow child in children)
                    {
                        if (!child.HasErrors)
                        {
                            child["PROP_NAME"] = (Utils.CIntDef(child["PROP_RANK"]) <= 1 ? "" : Duplicate("...", Utils.CIntDef(child["PROP_RANK"]))) + child["PROP_NAME"];
                            dest.Rows.Add(child.ItemArray);
                            child.RowError = "dirty";
                            TransformTableWithSpace(ref source, dest, rel, child);
                        }
                    }
                }
            }
        }

        #endregion
        private void LoadArea2()
        {
            try
            {
                var AllList = DB.ESHOP_PROPERTies.Where(n => n.PROP_RANK > 0).OrderByDescending(n => n.PROP_PRIORITY).ToList();
                if (AllList.ToList().Count > 0)
                {
                    DataRelation relCat;
                    Session["PropList"] = DataUtil.LINQToDataTable(AllList);
                    DataTable tbl = DataUtil.LINQToDataTable(AllList);
                    DataSet ds = new DataSet();
                    ds.Tables.Add(tbl);
                    tbl.PrimaryKey = new DataColumn[] { tbl.Columns["PROP_ID"] };
                    relCat = new DataRelation("Category_parent", ds.Tables[0].Columns["PROP_ID"], ds.Tables[0].Columns["PROP_PARENT_ID"], false);
                    ds.Relations.Add(relCat);
                    DataSet dsCat = ds.Clone();
                    DataTable CatTable = ds.Tables[0];
                    TransformTableWithSpace(ref CatTable, dsCat.Tables[0], relCat, null);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion

        protected void btnDelete4_Click(object sender, ImageClickEventArgs e)
        {
            string strLink = "";
            try
            {
                var n_info = DB.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == m_news_id);

                if (n_info.ToList().Count > 0)
                {
                    if (!string.IsNullOrEmpty(n_info.ToList()[0].NEWS_IMAGE4))
                    {
                        string imagePath = Server.MapPath(PathFiles.GetPathNews(m_news_id) + n_info.ToList()[0].NEWS_IMAGE4);
                        n_info.ToList()[0].NEWS_IMAGE4 = "";
                        DB.SubmitChanges();

                        if (File.Exists(imagePath))
                            File.Delete(imagePath);

                        strLink = "news.aspx?news_id=" + m_news_id;
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
                    Response.Redirect(strLink);
            }
        }
    }
}