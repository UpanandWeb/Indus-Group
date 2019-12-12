<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadWinzipfile.aspx.cs" Inherits="UploadWinzipfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Uploadwinzipfile</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" /><br />
        <asp:Button ID="Button1" runat="server" Text="Upload" onclick="Button1_Click" />
        
        <br /><br /><br /><br />
        <asp:DataList ID="dlEmpDocs" runat="server" Width="100%" 
             AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatColumns="3">
            <ItemTemplate>
                <table width="100%" border="0">
                    <tr>                                             
                        <td align="right">
                            <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("FileDocName") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblFilePath" runat="server" Text='<%#Eval("FileContentType") %>' Visible="false"></asp:Label>                                            
                            <asp:LinkButton ID="lnkBtnDownload" runat="server" CommandArgument='<%#Eval("Id") %>' OnCommand="lnkDownload" ForeColor="Red">View/Download <asp:Label ID="Label1" runat="server" Text='<%#Eval("FileDocName")%>'></asp:Label></asp:LinkButton>
                        </td>
                         <td style="width:50px"></td>
                    </tr>
                </table>
           </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
