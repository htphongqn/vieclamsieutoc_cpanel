using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

namespace vpro.eshop.cpanel.FileManager
{
    public partial class Uploader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateFileManager();
        }
        public void AuthenticateFileManager()
        {
            if (Session["User_id"] != null)
            {

            }
            else
            {
                Response.Redirect("/Manager/Default.aspx");
            }
        }
        protected void AjaxFileUploadEvent(object sender, AjaxFileUploadEventArgs e)
        {
            string filename = System.IO.Path.GetFileName(e.FileName);
            //string strUploadPath = Session["FileManager"].ToString().Replace("//", "/");
            string strUploadPath = "/data/";
            if (!string.IsNullOrEmpty(Request["Path"]))
            {
                strUploadPath = Request["Path"].ToString();
            }
            AjaxFileUpload11.SaveAs(Server.MapPath(strUploadPath) + filename);
        }
    }
}