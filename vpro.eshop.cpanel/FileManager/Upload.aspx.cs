using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Web.Configuration;
using System.IO;

namespace vpro.eshop.cpanel.FileManager
{
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bntUpload_Click(object sender, EventArgs e)
        {
            //string FilePath = Server.MapPath(Session["FileManager"].ToString().Replace("//", "/"));// + FileUpload1.FileName.ToString());

            //FilePath = HttpUtility.UrlDecode(FilePath);

            string filepath = Session["FileUpload"].ToString() + "/".Replace("//", "/");
            //string filepath = "/data/";
            //if (!string.IsNullOrEmpty(Request["Path"]))
            //{
            //    filepath = Request["Path"].ToString();
            //}
            HttpFileCollection uploadedFiles = Request.Files;
            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    if (userPostedFile.ContentLength > 0)
                    {
                        userPostedFile.SaveAs(Server.MapPath(filepath) + Path.GetFileName(userPostedFile.FileName));
                    }
                }
                catch
                {

                }
            }
        }

    }
}
