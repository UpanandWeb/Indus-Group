<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Careers.aspx.cs" Inherits="igiit_Admin_Admin_Careers" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Careers</title>

    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Job Details has been edited Successfully");
        }

        //function alertdelete()
        //{
        //    alert("Client Details has been deleted Successfully");
        //}

        function alertcreate() {
            alert("Job Details has been Created Successfully");
        }
    </script>
    <script language="javascript" type="text/javascript">

        function alertdelete12() {
            alert("You don't have rights to done this task !!!");
        }
    </script>

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }

        .updateProgress {
            border-width: 1px;
            border-style: solid;
            background-color: White;
            position: absolute;
            width: 180px;
            height: 65px;
        }
    </style>
    <style type="text/css">
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 1000px;
            height: 600px;
            background-color: #333;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 350px;
            padding: 0px;
            border: 0px solid #a6c25c;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .headertext {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #f19a19;
            font-weight: bold;
        }

        .textfield {
            border: 1px solid #a6c25c;
            width: 200px;
        }

        .button2 {
            background-color: #a6c25c;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }

        #GridView1 td {
            border: 0.1px solid #CCCCCC;
        }

        #GridView1 th {
            border-right: 0.1px solid #CCCCCC;
        }
    </style>
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
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <center>

          <%--  <table>
                <tr>
                    <td>
                        <asp:Label ID="lbl2" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Label1"></asp:Label>
                    </td>
                     <td>
                        <asp:Label ID="Label5" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Label1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="Label7" runat="server" Text="Label1"></asp:TextBox>
                    </td>
                    <td>
                                               <asp:TextBox ID="TextBox1" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                    <td>
                                              <asp:TextBox ID="TextBox2" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                     <td>
                                                <asp:TextBox ID="TextBox3" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                    <td>
                                               <asp:TextBox ID="TextBox4" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Label1"></asp:Label>
                    </td>
                     <td>
                        <asp:Label ID="Label11" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Label1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Text="Label1"></asp:TextBox>
                    </td>
                    <td>
                                               <asp:TextBox ID="TextBox6" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                    <td>
                                              <asp:TextBox ID="TextBox7" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                     <td>
                                                <asp:TextBox ID="TextBox8" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                    <td>
                                               <asp:TextBox ID="TextBox9" runat="server" Text="Label1"></asp:TextBox>

                    </td>
                </tr>
            </table>--%>
            <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                <tr width="100%">
                    <td valign="top" width='100%' class="lblog">
                        <table width="998px">
                            <tr>
                                <td>
                                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px"></td>
                </tr>
                <%--  <tr>
           <td id="crtopt" runat="server" align="center"  class="lblog" width=" 90%">
           </td>
       </tr>--%>

                <tr>
                    <td height="30px">
                     <table border="0" width="100%">
       <tr><td align="center"  height="20px" runat="server" id="pj">
       <a href="Admin_Careers.aspx"><b>Posted Jobs</b></a>
       </td>     
     <td align="center" runat="server" id="anj"><font><a href="Admin_Careers_Create.aspx"><b>Add New Job</b></a></font></td>
     <td  align="center" runat="server" id="pr"><font><a href="Admin_resumes.aspx"><b>Posted Resumes</b></a></font></td>
     <td  align="center" runat="server" id="ar"><font><a href="Admin_appresumes.aspx"><b>Applied Resumes</b></a></font></td>
     </tr>
    </table>
                    </td>
                </tr>

                <tr>
                    <td><hr /></td>
                </tr>
                <tr>
                    <td style="height: 30px"></td>
                </tr>
                <tr>
                    <td id="Errmsg" align="right" class="lblog" runat="server"></td>
                </tr>


                <tr>
                    <td align="center">
                        <asp:GridView ID="GridView1" runat="server" Width="96%"
                            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Solid"
                            BorderWidth="1" CellPadding="3" Font-Bold="False" Font-Italic="False"
                            Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"
                            Font-Underline="False" Height="242px" BackColor="White" DataKeyNames="id"
                            AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="25"
                            PagerStyle-BackColor="White" PagerStyle-BorderWidth="0"
                            OnPageIndexChanging="GridView1_PageIndexChanging" OnDataBound="GridView1_DataBound" >
                            <Columns>
                                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("ID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Job ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("JobID") %>' ForeColor="Gray"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                    <HeaderStyle Width="10%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Job Title">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" ForeColor="Gray" Text='<%# Bind("JobName") %>' CssClass="labledd"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                    <HeaderStyle Width="15%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Job Description">
                                    <ItemTemplate>
                                        <asp:Label ID="Labeljdate" runat="server" Text='<%# Bind("JobDesc") %>' ForeColor="Gray"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle Width="50%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="Labels2" runat="server" ForeColor="Gray" Text='<%# Bind("joblocation") %>' CssClass="labledd"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                    <HeaderStyle Width="10%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Posted On">

                                    <ItemTemplate>
                                        <asp:Label ID="Labelpost" runat="server" ForeColor="Gray" Text='<%# Bind("post") %>' CssClass="lable"></asp:Label>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="10%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkactivate" runat="server" Text='<%# Bind("status1") %>' ForeColor="#63AEAD" OnCommand="lnkactivate_Command" 
                                            commandname="DataCommand" CommandArgument='<%# Bind("id") %>' ></asp:LinkButton>
                                        <%--<asp:LinkButton ID="lnkdeactivate" runat="server" Text="Active" ForeColor="#A81C44" OnClick="lnkdeactivate_click" ToolTip="Deactive"></asp:LinkButton>--%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="8%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink2" ForeColor="Gray" NavigateUrl='<%# FormatUrlEd( (int) Eval("id") )%>' runat="server" Text='Edit' CssClass="headings"></asp:HyperLink>

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="8%" />
                                </asp:TemplateField>



                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete">
                                    <ItemTemplate>
                                        <%--<asp:HyperLink ID="HyperLink3" NavigateUrl='<%# FormatUrlDl( (int) Eval("id") )%>' runat="server" Text='Delete' CssClass ="headings" ></asp:HyperLink>--%>
                                        <asp:LinkButton ForeColor="Gray" ID="lnkdeletetemp" runat="server" CommandArgument='<%#Eval("id") %>' OnCommand="FormatUrlDl" CssClass="headings" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="8%" />
                                </asp:TemplateField>



                            </Columns>

                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" BorderWidth="0" />
                            <RowStyle CssClass="datagrid-2" Font-Size="8pt" HorizontalAlign="Center"
                                Font-Strikeout="False" Font-Underline="False" />
                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                BorderColor="#CCCCCC" BorderWidth="0" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Size="9pt"
                                Font-Underline="False" Height="20px" Wrap="True" />
                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True"
                                ForeColor="#00277a" Height="30px" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <input id="btnDummy2" runat="server" type="button" style="display: none;" />
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btncancel" TargetControlID="btnDummy2" PopupControlID="pnldelsms" DropShadow="false"
                PopupDragHandleControlID="pnldelete" BackgroundCssClass="modalBackground" OkControlID="Button1">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnldelsms" runat="server" Width="400px" Height="150px">
                <fieldset style="width: 402px">
                    <asp:Panel ID="pnldelete" runat="server">
                    </asp:Panel>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="background-color: #fff; height: 150px">

                        <tr>
                            <td align="center" class="headertext" style="background: #CCCCCC">Delete the Record</td>
                            <td align="right" style="background: #CCCCCC" valign="top">
                                <asp:Button ID="Button1" runat="server" Text="X" Height="25" ForeColor="white"
                                    BorderStyle="None" BackColor="Gray" />

                            </td>
                        </tr>

                        <tr>
                            <td align="center" width="100%">
                                <table width="100%" border="0">
                                    <tr>
                                        <td>Are You Sure want to delete the job details .<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="imgbtnsmsdelete" runat="server" Text="Confirm" OnClick="imgbtnsmsdelete_Click" />
                                            &nbsp;
                                            <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbldid" runat="server" Visible="false"></asp:Label></td>
                                        <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </asp:Panel>

              <script type="text/javascript">
                  function changeColor(CheckBoxObj) {
                      if (CheckBoxObj.checked == true) {

                          CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
                      }
                      else {
                          CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
                      }
                  }
        </script>
        </center>
        </div>
    </form>
</body>
</html>
