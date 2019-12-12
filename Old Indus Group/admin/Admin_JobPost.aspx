<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_JobPost.aspx.cs" Inherits="igiit_Admin_Admin_JobPost" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Jobpost</title>
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
	function alertedit()
    {
        alert("Job Post has been Edited Successfully");
    }
    
    function alertdelete()
    {
        alert("Job Post has been deleted Successfully");
    }
    </script>
   <link rel="stylesheet" href="Styles/stylesheet.css" />  
</head>
<body id="body1" runat="server">
    <form id="form1" runat="server">
    <div>
   <table width="100%"> 
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
        </td>
    </tr>
       <tr>
           <td  id="Errmsg" align="right" class="lblog" runat="server">
           </td>
       </tr>
   <tr>
   <td>
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"  BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" Height="242px">
        <Columns>
            <asp:TemplateField HeaderText="JobTitle">
                <EditItemTemplate>
                <asp:TextBox ID="skillname" runat="server" Text ='<%#Eval("jobtitle") %>' ></asp:TextBox>
                    
                </EditItemTemplate>
                <ItemTemplate>
            <asp:Label ID="Label2" runat="server" Text='<%# Bind("jobtitle") %>'></asp:Label> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Keyskills" >
                <EditItemTemplate>
                    &nbsp;<asp:TextBox ID="TextBox2" runat="server" CssClass="formsfields" Text='<%# Bind("Keyskills") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ControlToValidate="TextBox2" Text="" ErrorMessage="Application Name should not be empty." ID="tt" runat="server"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Keyskills") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Experience(MAX)" >
                <EditItemTemplate>
                    &nbsp;<asp:TextBox ID="TextBox2" runat="server" CssClass="formsfields" Text='<%# Bind("Max_Exp") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ControlToValidate="TextBox2" Text="" ErrorMessage="Application Name should not be emptpy." ID="tt" runat="server"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Max_Exp") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Experience(MIN)" >
                <EditItemTemplate>
                    &nbsp;<asp:TextBox ID="TextBox2" runat="server" CssClass="formsfields" Text='<%# Bind("Min_Exp") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ControlToValidate="TextBox2" Text="" ErrorMessage="Application Name should not be emptpy." ID="tt" runat="server"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Min_Exp") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="FunctionalArea" >
                <EditItemTemplate>
                    &nbsp;<asp:TextBox ID="TextBox2" runat="server" CssClass="formsfields" Text='<%# Bind("Functional_Area") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ControlToValidate="TextBox2" Text="" ErrorMessage="Application Name should not be emptpy." ID="tt" runat="server"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Functional_Area") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
            
            
            <asp:TemplateField ShowHeader="False">
            
                
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" NavigateUrl = '<%# FormatUrlEd( (int) Eval("rowid") )%>' runat="server" Text="Edit" CssClass = "headings" ></asp:HyperLink>
                                   
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink3" NavigateUrl = '<%# FormatUrlDl( (int) Eval("rowid") )%>' runat="server" Text="Delete" CssClass = "headings" ></asp:HyperLink>
                                   
                </ItemTemplate>
               
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="datagrid-2" />
        <HeaderStyle CssClass="label5" />
    </asp:GridView>
   </td>
   </tr>
   </table> 
    </div>
    </form>
</body>
</html>
