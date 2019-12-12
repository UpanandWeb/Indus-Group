<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Admin_CareersNew.aspx.cs"
    Inherits="admin_Admin_CareersNew" %>

<%@ Register Src="~/admin/Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ace Indus :: Admin Careers New</title>

    <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("Client Details has been edited Successfully");
}
function alertdelete()
{
alert("Client Details has been deleted Successfully");
}
    </script>

  <%--  <link rel="stylesheet" href="Styles/stylesheet.css" />--%>
    <%--<link  rel="Stylesheet" href="Styles/stylesheet.css" />--%>
      <link rel="stylesheet" href="Styles/stylesheet.css" />   
    <script type="text/javascript">
        function SessionExpireAlert(timeout) {
            var seconds = timeout / 1000;
            document.getElementsByName("secondsIdle").innerHTML = seconds;
            document.getElementsByName("seconds").innerHTML = seconds;
            setInterval(function () {
                seconds--;
                document.getElementById("seconds").innerHTML = seconds;
                document.getElementById("secondsIdle").innerHTML = seconds;
            }, 1000);
            setTimeout(function () {
                //Show Popup before 20 seconds of timeout.
                $find("mpeTimeout").show();
            }, timeout + 1 * 1000);
            setTimeout(function () {
                window.location = "Default.aspx";
            }, timeout);
        };
        function ResetSession() {
            //Redirect to refresh Session.
            window.location = window.location.href;
        }
            </script>     
</head>
<body id="body1" runat="server">
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0">
            <%--<tr>

<td colspan="2"> <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>

</tr>--%>
<tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>

            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td id="crtopt" runat="server" align="right" class="lblog">
                    <a href="Admin_CareersNew_Create.aspx" class="lblog">Add New Job Post &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                </td>
            </tr>
            <tr>
                <td id="Errmsg" align="right" class="lblog" runat="server">
                </td>
            </tr>
            <tr>
                <td align="center">
                <table width="100%">
                    <asp:DataList ID="DataList1" runat="server" Width="100%">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <table class="data" width="100%">
                                        <tr>
                                            <td width="100%" valign="top" colspan="2">
                                                <table width="100%" align="left" class="data">
                                                    <tr>
                                                        <td width="100%" align="left" colspan="2">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="15%">
                                                                        <span class="datanew">Job Title</span>
                                                                    </td>
                                                                    <td width="1%" class="datanew">
                                                                        :
                                                                    </td>
                                                                    <td width="83%" class="data" style="color: Red">
                                                                        <asp:Literal ID="ltCategory" runat="server" Text='<%#Eval("JobTitle")%>'></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="100%" align="left" colspan="2">
                                                            <table width="100%" class="data">
                                                                <tr>
                                                                    <td width="15%">
                                                                        <span class="datanew">Reqd.Qual.</span>
                                                                    </td>
                                                                    <td width="1%" class="datanew">
                                                                        :
                                                                    </td>
                                                                    <td width="83%" class="data">
                                                                        <asp:Literal ID="Literal5" runat="server" Text='<%#Eval("Qualification")%>'></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                    </tr>
                                                    <tr>
                                                        <td width="100%" align="left" colspan="2">
                                                            <table width="100%" class="data">
                                                                <tr>
                                                                    <td width="15%">
                                                                        <span class="datanew">Reqd. Skills</span>
                                                                    </td>
                                                                    <td width="1%" class="datanew">
                                                                        :
                                                                    </td>
                                                                    <td width="83%" class="data">
                                                                        <asp:Literal ID="Literal6" runat="server" Text='<%#Eval("Skills")%>'></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="100%" align="left" colspan="2">
                                                            <table width="100%" class="data">
                                                                <tr>
                                                                    <td width="15%">
                                                                        <span class="datanew">Location</span>
                                                                    </td>
                                                                    <td width="1%" class="datanew">
                                                                        :
                                                                    </td>
                                                                    <td width="83%" class="data">
                                                                        <asp:Literal ID="Literal7" runat="server" Text='<%#Eval("Location")%>'></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="50%" align="left">
                                                            <table width="100%" class="data">
                                                                <tr>
                                                                    <td width="31%">
                                                                        <span class="datanew">Open From</span>
                                                                    </td>
                                                                    <td width="1%" class="datanew">
                                                                        :
                                                                    </td>
                                                                    <td width="67%" class="data">
                                                                        <asp:Literal ID="Literal3" runat="server" Text='<%#Eval("OpenFrom")%>'></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="50%" align="left">
                                                            <table width="100%" class="data">
                                                                <td width="10%">
                                                                    <span class="datanew">Open Until</span>
                                                                </td>
                                                                <td width="1%" class="datanew">
                                                                    :
                                                                </td>
                                                                <td width="67%" class="data">
                                                                    <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("OpenTo")%>'></asp:Literal>
                                                                </td>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10">
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="50%" align="center">
                                                            <asp:Button ID="btnEdit" runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="btnEdit_Click"
                                                                Text="Edit" />
                                                        </td>
                                                        <td width="50%" align="left">
                                                            <asp:Button ID="btnDelete" runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="btnDelete_Click"
                                                                Text="Delete" />
                                                        </td>
                                                    </tr>
                                                    <hr />
                                                </table>
                                            </td>
                                        </tr>
                        </ItemTemplate>
                    </asp:DataList>
               
            
            
        
        </table>
        </td>
        </tr>
        <tr>
        <td>&nbsp;</td>
        </tr>
         <tr>
        <td>&nbsp;</td>
        </tr>
        <tr>
                <td align="center">
                    <table border="0" style="background-color: #D5E6F9; width: 100px;
                        height: 22px;" align="center">
                        <tr>
                            <td align="center">
                              
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="lnkbtnPrevious" runat="server" OnClick="lnkbtnPrevious_Click1"
                                    Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#00BFFF"
                                    bgcolor="#125CAF">Previous</asp:LinkButton>
                            </td>
                            <td align="center">
                                <asp:DataList ID="dlPaging" runat="server" OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound"
                                    RepeatDirection="Horizontal" ForeColor="#996633">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                            CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %>'>LinkButton</asp:LinkButton>&nbsp;
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="lnkbtnNext_Click1" Font-Bold="True"
                                    Font-Size="Medium" Font-Underline="False" ForeColor="#00BFFF" bgcolor="#125CAF">Next</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
