<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uploader.aspx.cs" Inherits="vpro.eshop.cpanel.FileManager.Uploader" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/ui-lightness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="ui-widget-content" style="border-right:0px;" >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:AjaxFileUpload ID="AjaxFileUpload11" runat="server" MaximumNumberOfFiles="10"
        OnUploadComplete="AjaxFileUploadEvent" Width="500px"/>
    </div>
    </form>
</body>
</html>
