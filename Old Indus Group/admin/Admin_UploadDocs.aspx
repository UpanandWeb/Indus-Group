<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_UploadDocs.aspx.cs" Inherits="admin_Admin_UploadDocs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="WordVisualizer.Core" Namespace="WordVisualizer.Core" TagPrefix="wors" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> : : Indus Group : : Admin Control Panel</title>
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
     <script language="javascript" type="text/javascript">
    </script>
  <link rel="stylesheet" href="Styles/stylesheet.css" />
     
    <style type="text/css">
        .style24
        {
            height: 20px;
        }
        .style25
        {
            width: 573px;
        }
        .style26
        {
            height: 20px;
            width: 573px;
        }
        .modalBackground 
{
   
    background-color:#EBEBEB;
    filter:alpha(opacity=70);
    opacity:0.7;
}
.scro
{
	overflow:scroll;
}
    </style>
    <%--<script type="text/javascript">
function PrintGridData() {        

            
//             var texxt=parent.document.getElementById('textdiv').src;
//             if(texxt=="")
//             {
//             document.getElementById('textdiv').style.visibility='hidden';
//             var printContent = document.getElementById('inpop');                                  
//             var windowUrl = 'about:blank';
//             var uniqueName = new Date();
//             var windowName = 'Print' + uniqueName.getTime();
//             var printWindow = window.open(windowUrl, windowName, 'left=10,top=10,width=800,height=600'); 
//             printWindow.document.write(printContent.innerHTML);
//             printWindow.document.close();
//             printWindow.focus();
//             printWindow.print();
//             printWindow.close(); 
//             }
//             else
//             {
             document.getElementById('textdiv').style.visibility='visible';
              window.frames['textdiv'].focus();             
               window.frames['textdiv'].print(); 
//             }                         
            return true;
            
        }

</script>--%>
<script language="javascript" type="text/javascript">
	  
    function fileformat()
    {
        alert("Unsuppoted file format for preview!!! any how download the file");
    }    
    </script>
    <script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script>
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" rightmargin="0">
    <form id="form1" runat="server" style="left:10px; right:10px">    
        <center>
            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>
            <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                <tr width="998px">
                    <td valign="top" width='100%' class="lblog" > 
                         <table width="100%">
                            <tr>
                                <td> 
                                    <uc1:TopMenu ID="Topmenu1" runat="server"  />
                                </td>
                            </tr>
                        </table>                  
                   </td>
                </tr>    
                <tr height="15"> 
                <td>&nbsp; </td>
                </tr>           
                <tr>
                    <td align="center" valign="top">
                        <font size="5" color="#0e4860"><strong></strong></font>
                    </td>
                </tr>   
                <tr>
                    <td align="right" valign="top">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
              
                <tr>
                  <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable" > 
                     <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Always">
                        <ContentTemplate> --%>                                           
                         <table border="0" width="100%">
                       <tr id="trHeading" runat="server">
                        <td colspan="2" style="padding-left:10px;">
                                <font size="3" ><strong>To Upload 
                                    <asp:Label ID="lblType" runat="server"></asp:Label> 
                                    Documents</strong></font>
                        </td>
                       </tr>
                       <tr>
                        <td style="height:30px" colspan="2"></td>
                       </tr>
                       <tr id="trselectType" runat="server">
                        <td align="right" class="style25">
                            Please select Type of Documents to upload : 
                        </td>
                        <td align="left">
                            <table>
                               <tr id="trrbAcc" runat="server">
                                <td align="left">                           
                                    <asp:RadioButton ID="rbAcc" runat="server" Text="Accounting Documents" 
                                        GroupName="chk" OnCheckedChanged="rbAcc_CheckedChanged" AutoPostBack="true"/>                                                                         
                                </td>
                               </tr>
                                <tr id="trrbARP" runat="server">
                                <td align="left">                              
                                    <asp:RadioButton ID="rbARP" runat="server" Text="ARP Documents" GroupName="chk" 
                                        OnCheckedChanged="rbARP_CheckedChanged" AutoPostBack="true"/>                                                                                                 
                                </td>
                               </tr>
                                 <tr id="trrbDR" runat="server">
                                <td align="left">                                
                                    <asp:RadioButton ID="rbDR" runat="server" Text="Daily Reports" GroupName="chk" 
                                        OnCheckedChanged="rbDR_CheckedChanged" AutoPostBack="true" />                                                                                                      
                                </td>
                               </tr>
                              <tr id="trrbEmpDocs" runat="server">
                                <td align="left">                             
                                    <asp:RadioButton ID="rbEmpDocs" runat="server" Text="Employee Documents" 
                                        GroupName="chk" OnCheckedChanged="rbEmpDocs_CheckedChanged" AutoPostBack="true"/>                                                                          
                                </td>
                               </tr>
                                <tr id="trrbExcel" runat="server">
                                <td align="left">                               
                                    <asp:RadioButton ID="rbExcel" runat="server" Text="Excel Documents" 
                                        GroupName="chk" OnCheckedChanged="rbExcel_CheckedChanged" AutoPostBack="true" />                                                                         
                                </td>
                               </tr>                            
                      
                               <tr id="trrbHR" runat="server">
                                <td align="left">                              
                                    <asp:RadioButton ID="rbHR" runat="server" Text="HR Documents" GroupName="chk" 
                                        OnCheckedChanged="rbHR_CheckedChanged" AutoPostBack="true"/>                                                                                                 
                                </td>
                               </tr>
                                <tr id="trrbImmig" runat="server">
                                <td align="left">                               
                                    <asp:RadioButton ID="rbImmig" runat="server" Text="Immigration Documents" 
                                        GroupName="chk" OnCheckedChanged="rbImmig_CheckedChanged" AutoPostBack="true" />                                  
                                </td>
                               </tr>
                             
                               <tr id="trrbLeaves" runat="server">
                                <td align="left">                               
                                    <asp:RadioButton ID="rbLeaves" runat="server" Text="Time & Attendance" GroupName="chk" 
                                        OnCheckedChanged="rbLeaves_CheckedChanged" AutoPostBack="true"/>                                                                       
                                </td>
                               </tr>
                               <tr id="trWord" runat="server">
                                <td align="left">                               
                                    <asp:RadioButton ID="rbWord" runat="server" Text="Word Documents" GroupName="chk" 
                                       OnCheckedChanged="rbWord_CheckedChanged" AutoPostBack="true"/>                                                                       
                                </td>
                               </tr>
                                  <tr id="trResume" runat="server">
                                 <td align="left">                               
                                    <asp:RadioButton ID="rbResume" runat="server" Text="Resumes" GroupName="chk" 
                                       OnCheckedChanged="rbResume_CheckedChanged" AutoPostBack="true"/>                                                                       
                                </td>
                               </tr>              
                            </table>
                        </td>
                       </tr>
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>
                       <tr id="trsubfolderHeading" runat="server">
                        <td colspan="2" align="center">
                        <span style="font-size:14px">
                            You can create folders and can specify in which folders you want to upload your documents.
                            </span>
                        </td>
                       </tr>                       
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>
                       <tr id="trSubFolderCreation" runat="server">
                        <td colspan="2" align="center">
                            <asp:TextBox ID="txtFolderName" runat="server"></asp:TextBox> 
                            <cc1:TextBoxWatermarkExtender ID="txtFolderNameExtender" runat="server" TargetControlID="txtFolderName" WatermarkText="Enter Folder Name">
                            </cc1:TextBoxWatermarkExtender>
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCreateFolder" runat="server" Text="Create New Folder" 
                                onclick="btnCreateFolder_Click"  ValidationGroup="CreateFolder" CausesValidation="false"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblFolderStatus" runat="server"></asp:Label>
                        </td>
                       </tr>
                       <tr id="trRFVFolder" runat="server">
                        <td colspan="2" align="center" class="style24">
                            <asp:RequiredFieldValidator ID="rfvflname" runat="server" ControlToValidate="txtFolderName" ValidationGroup="CreateFolder" ErrorMessage="Please enter Folder Name to create"></asp:RequiredFieldValidator>
                        </td>
                       </tr> 
                       <tr id="trFolderheading" runat="server" visible="false">
                        <td style="height:20px" colspan="2" align="center">
                            <span style="font-size:14px">Folders present in 
                                <asp:Label ID="lblDocName" runat="server"></asp:Label>
                            </span>
                        </td>
                       </tr> 
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>  
                       <tr>
                        <td align="center" colspan="2">
                            <span style="font-size:14px">
                                <asp:Label ID="lblFolderExistance" runat="server" Visible="false" ForeColor="red"></asp:Label>
                            </span>
                        </td>
                       </tr>
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>               
                       <tr id="trSubfoldersView" runat="server">
                        <td colspan="2" align="center">
                             <asp:DataList ID="dlSubFolders" runat="server" RepeatColumns="4">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td align="left">
                                             <asp:CheckBox ID="chkboxFolder" runat="server" Text='<%#Eval("Name")%>' OnCheckedChanged="chkboxFolder_CheckChanged" AutoPostBack="true"/>
                                            </td>
                                            <td style="width:4px"></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                             </asp:DataList>
                        </td>
                       </tr>
                       <tr>
                        <td colspan="2">
                            <asp:Label ID="lblpath" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblDoctype" runat="server" Visible="false"></asp:Label>
                               <asp:Label ID="lblCheckStatus" runat="server"></asp:Label>
                            <asp:Label ID="lblLoginId" runat="server"></asp:Label>
                        </td>
                       </tr>
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>
                       <tr id="trUpload" runat="server">
                        <td colspan="2" align="center">
                             <asp:FileUpload ID="FileUpload1" runat="server" />
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="UploadDocs" runat="server" Text="Upload" 
                                onclick="UploadDocs_Click"  />
                        </td>
                       </tr>
                       <tr>
                        <td colspan="2" class="style24"></td>
                       </tr>
                       <tr >
                        <td style="height:20px" colspan="2"></td>
                       </tr>
                       <%--<tr>
                        <td colspan="2">
                            <font size="4" color="#0e4860"><strong>You can Download Uploaded Documents by clicking on the file name</strong></font>
                        </td>
                       </tr>--%>
                       <tr id="trViewFolders" runat="server">
                        <td colspan="2" style="padding-left:10px;">
                            <font size="3" >
                                <strong>
                                    Please click on the below folders to view the respective Documents present in it
                                </strong>
                            </font>
                        </td>
                       </tr>
                       <tr>
                        <td colspan="2" class="style24"></td>
                       </tr>
                       <tr>
                            <td colspan="2">
                                <table width="100%">
                                    <tr>
                                       <td style="width:12%" id="tdlnkAccDos" runat="server">
                                        <asp:LinkButton ID="lnkAccDos" runat="server" onclick="lnkAccDos_Click">
                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                            Accounting Documents
                                        </asp:LinkButton>
                                        </td>
                                         <td style="width:10%" id="tdlnkARPDocs" runat="server">
                                            <asp:LinkButton ID="lnkARPDocs" runat="server" onclick="lnkARPDocs_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                ARP Documents
                                            </asp:LinkButton>
                                        </td>
                                            <td style="width:10%" id="tdlnkDR" runat="server">
                                            <asp:LinkButton ID="lnkDR" runat="server" onclick="lnkDR_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                Daily Reports
                                            </asp:LinkButton>
                                        </td>
                                        
                                        <td style="width:12%" id="tdlnkEmpDocs" runat="server">
                                            <asp:LinkButton ID="lnkEmpDocs" runat="server" onclick="lnkEmpDocs_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                Employee Documents
                                            </asp:LinkButton>
                                        </td>
                                         <td style="width:10%" id="tdlnkExcel" runat="server">
                                            <asp:LinkButton ID="lnkExcel" runat="server" onclick="lnkExcel_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt=""/><br />
                                                Excel Documents
                                            </asp:LinkButton>
                                        </td>
                                        
                                        <td style="width:10%" id="tdlnkHRDocs" runat="server">
                                            <asp:LinkButton ID="lnkHRDocs" runat="server" onclick="lnkHRDocs_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                HR Documents
                                            </asp:LinkButton>
                                        </td>
                                       
                                        <td style="width:12%" id="tdlnkImmigDocs" runat="server">
                                            <asp:LinkButton ID="lnkImmigDocs" runat="server" onclick="lnkImmigDocs_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                Immigration Documents
                                            </asp:LinkButton>
                                        </td>    
                                        <td style="width:10%" id="tdlnkLeaves" runat="server">
                                            <asp:LinkButton ID="lnkLeaves" runat="server" OnClick="lnkLeaves_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                               Time & Attendance
                                            </asp:LinkButton>
                                        </td>
                                          <td style="width:10%" id="tdlnkWord" runat="server">
                                            <asp:LinkButton ID="lnkWord" runat="server" OnClick="lnkWord_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt=""/><br />
                                                Word Documents
                                            </asp:LinkButton>
                                        </td>
                                         <td style="width:10%" id="tdlnkResume" runat="server">
                                            <asp:LinkButton ID="lnkResume" runat="server" OnClick="lnkResume_Click">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt=""/><br />
                                                Resumes
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                       </tr>
                       <tr id="trEmployeeDocs" runat="server">
                        <td style="height:20px" colspan="2"> 
                            <span style="font-size:14px">
                                <asp:Label ID="lblDoc" runat="server"></asp:Label>
                            </span>    
                        </td>
                       </tr>
                       <tr id="trdlEmpDocs" runat="server">
                        <td colspan="2">                           
                           <asp:DataList ID="dlEmpDocs" runat="server" Width="100%" 
                                 AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatDirection="Horizontal" 
                                RepeatColumns="3" onitemdatabound="dlEmpDocs_ItemDataBound">
                                <ItemTemplate>
                                    <table width="100%" border="0">
                                        <tr>                                             
                                            <td align="left">
                                                <asp:Label ID="lblSubFolder" runat="server" Text='<%#Eval("SubFolder")%>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("FileDocName") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblFilePath" runat="server" Text='<%#Eval("FileContentType") %>' Visible="false"></asp:Label>                                           
                                                
                                                <asp:LinkButton ID="lnkBtnDownload" runat="server" CommandArgument='<%#Eval("Id") %>' OnCommand="lnkDownload" ForeColor="Red">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("FileDocName")%>'></asp:Label>
                                                </asp:LinkButton>
                                                
                                                <%--<asp:LinkButton ID="lnkBtnDeleteFile" runat="server" OnCommand="lnkDeleteDoc" CommandArgument='<%#Eval("Id") %>'>
                                                <img src='images/delete.gif' width='16' height='16' border='0'/>
                                                </asp:LinkButton>--%>
                                                
                                                <asp:LinkButton ID="lnkFolderName" runat="server" CommandArgument='<%#Eval("Folder") + ";" +Eval("SubFolder") +";"+Eval("DocType")%>' OnCommand="lnkView" ForeColor="Red">
                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                
                                                 <asp:Label ID="Label2" runat="server" Text='<%#Eval("SubFolder")%>'></asp:Label>
                                                 </asp:LinkButton>                                               
                                                 &nbsp;&nbsp; 
                                                                                                                                    
                                                 <%--<asp:LinkButton ID="lnkBtnDeleteFolder" runat="server" OnCommand="lnkDeleteFolderFiles" CommandArgument='<%#Eval("Folder") + ";" +Eval("SubFolder") +";"+Eval("DocType")%>'>
                                                  <img src='images/delete.gif' width='16' height='16' border='0'/>
                                                 </asp:LinkButton>--%>                                                 
                                                 
                                            </td>
                                            <td style="width:25px"></td>
                                        </tr>
                                    </table>
                               </ItemTemplate>
                            </asp:DataList>                            
                        </td>
                       </tr>                       
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>
                       <tr id="trSubFiles" runat="server" visible="false">
                        <td colspan="2" align="left" style="padding-left:20px" class="style24">
                            <span style="font-size:14px">
                            <asp:Label ID="lblFolder" runat="server"></asp:Label>&nbsp;<b>></b>&nbsp;<asp:Label ID="lblSubFolder" runat="server"></asp:Label>
                            </span>
                        </td>
                       </tr>
                       <tr>
                        <td style="height:20px" colspan="2"></td>
                       </tr>
                       <tr>
                        <td colspan="2">
                             <asp:DataList ID="dlSubFolderFiles" runat="server" Width="100%" 
                                 AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatDirection="Horizontal" 
                                RepeatColumns="3" >
                                <ItemTemplate>
                                    <table width="100%" border="0">
                                        <tr>                                             
                                            <td align="left">
                                                 <asp:LinkButton ID="lnkBtnDownload" runat="server" CommandArgument='<%#Eval("Id") %>' OnCommand="lnkDownload" ForeColor="Red">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("FileDocName")%>'></asp:Label>
                                                </asp:LinkButton>
                                            &nbsp;&nbsp;                                           
                                                <asp:LinkButton ID="lnlBtnDelete"  OnClientClick="return confirm('Are you sure want delete this record?')" runat="server" OnCommand="lnkDeleteDoc" CommandArgument='<%#Eval("Id") %>'>
                                                <img src='images/delete.gif' width='16' height='16' border='0'/>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                       </tr>
                       <tr>
                        <td class="style26">                        
                            <asp:Label ID="lbllMsg" runat="server" Font-Bold="true" Font-Size="13px"></asp:Label>
                        </td>
                       </tr>
                    </table>
                       <%-- </ContentTemplate>
                        <Triggers>
                        <asp:PostBackTrigger ControlID="UploadDocs" />
                        </Triggers>
                      </asp:UpdatePanel>--%>
                      <asp:Label ID="lblAcess" runat="server" Visible="false" /> 
                   </td>
                </tr> 
            </table> 
            
            <asp:Panel ID="pnlpop" runat="server"  BackColor="White" Width="998px"  >
             <%--<asp:Button ID="btnPrint" runat="server" OnClientClick="return PrintGridData()" Text=" Print " OnClick="btnprint_Click" />&emsp;&emsp; 
             --%><hr />
        <span style="font-size:10pt; font-family:Times New Roman ; "> if preview not avilable reload the document once again (or) export to new window by clicking arrow image on the right-top side of the frame.</span>
        <%--<asp:Panel ID="inpop" runat="server" Width="1000" Height="500" CssClass="scro" BackColor="White">--%>
        <%--<asp:GridView ID="grd1" runat="server" GridLines="None" AutoGenerateColumns="false" Visible="false">
        <columns>
		<asp:templatefield>
		<ItemStyle HorizontalAlign="Left" />
			<itemtemplate>
				<asp:Label id="time" runat="server" text='<%# Container.DataItem %>' />
			</itemtemplate>
		</asp:templatefield>
	    </columns>
        </asp:GridView>--%>
        <iframe id="textdiv" runat="server"  width="950" height="490" >        
        </iframe>  <br />
        <asp:Button ID="btndown" runat="server"  Text=" Download " OnClick="btndown_Click" />&emsp;&emsp;              
        <asp:Button ID="can" runat="server" Text=" Cancel " OnClick="btncan_Click" />
       <%-- </asp:Panel>--%>              
        </asp:Panel>
        <asp:Label ID="test" runat="server" ></asp:Label>       
        <cc1:ModalPopupExtender ID="mdpop" runat="server" PopupControlID="pnlpop" TargetControlID="test"
          BackgroundCssClass="modalBackground" CancelControlID="can" />  
            </center>        
    </form>
</body>
</html>
