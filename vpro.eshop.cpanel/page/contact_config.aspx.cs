using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.eshop.cpanel.ucControls;
using vpro.functions;
using System.IO;

//Create by LUCNV 23-12-2012

namespace vpro.eshop.cpanel.page
{
    public partial class contact_config : System.Web.UI.Page
    {
        #region Declare

        string m_pathFile = "";
        eshopdbDataContext DB = new eshopdbDataContext();
        //int lang = 0;
        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            SaveHTMLInfo();
            //SaveHTMLInfo1();
            //SaveHTMLInfo2();
        }

        #endregion

        #region My Function

        private void CreateDirectory()
        {
            m_pathFile = PathFiles.GetPathContact();

            if (!Directory.Exists(Server.MapPath(m_pathFile)))
            {
                Directory.CreateDirectory(Server.MapPath(m_pathFile));
            }

            Session["FileManager"] = m_pathFile;
        }

        private void showFileHTML2()
        {
            string pathFile;
            string strHTMLContent;

            pathFile = Server.MapPath(PathFiles.GetPathContact() + "/contact-ru.htm");

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                //objNewsReader = New StreamReader(pathFile, System.Text.Encoding.Default)
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();

                mrk2.Value = strHTMLContent;
            }
        }
        private void showFileHTML1()
        {
            string pathFile;
            string strHTMLContent;

            pathFile = Server.MapPath(PathFiles.GetPathContact() + "/contact-e.htm");

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                //objNewsReader = New StreamReader(pathFile, System.Text.Encoding.Default)
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();

                mrk1.Value = strHTMLContent;
            }
        }
        private void showFileHTML()
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
            string htmname = "/contact" + htmExt;
            string pathFile;
            string strHTMLContent;

            pathFile = Server.MapPath(PathFiles.GetPathContact() + htmname);

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
                string htmname = "/contact" + htmExt;

                string strHTMLFileLocation;
                string strFileName;
                string strHTMLContent;
                StreamWriter fsoFile;

                strFileName = PathFiles.GetPathContact() + htmname;
                strHTMLFileLocation = Server.MapPath(strFileName);
                strHTMLContent = mrk.Value;

                fsoFile = File.CreateText(strHTMLFileLocation);
                fsoFile.Write(strHTMLContent);
                fsoFile.Close();


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void SaveHTMLInfo1()
        {
            try
            {
                string strHTMLFileLocation;
                string strFileName;
                string strHTMLContent;
                StreamWriter fsoFile;

                strFileName = PathFiles.GetPathContact() + "/contact-e.htm";
                strHTMLFileLocation = Server.MapPath(strFileName);
                strHTMLContent = mrk1.Value;

                fsoFile = File.CreateText(strHTMLFileLocation);
                fsoFile.Write(strHTMLContent);
                fsoFile.Close();


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void SaveHTMLInfo2()
        {
            try
            {
                string strHTMLFileLocation;
                string strFileName;
                string strHTMLContent;
                StreamWriter fsoFile;

                strFileName = PathFiles.GetPathContact() + "/contact-ru.htm";
                strHTMLFileLocation = Server.MapPath(strFileName);
                strHTMLContent = mrk2.Value;

                fsoFile = File.CreateText(strHTMLFileLocation);
                fsoFile.Write(strHTMLContent);
                fsoFile.Close();


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

            CreateDirectory();
            //lang = Convert.ToInt32(Session["NN"]);
            if (!IsPostBack)
            {
                ucHeader.HeaderLevel1 = "Thông tin liên hệ";
                ucHeader.HeaderLevel1_Url = "../page/contact_list.aspx";
                ucHeader.HeaderLevel2 = "Cấu hình liên hệ";
                ucHeader.HeaderLevel2_Url = "../page/contact_config.aspx";

                showFileHTML();
                //showFileHTML1();
                //showFileHTML2();
            }

        }

        #endregion

    }
}