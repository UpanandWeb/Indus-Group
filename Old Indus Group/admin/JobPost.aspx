<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobPost.aspx.cs" Inherits="JobPost" %>

<%@ Register Src="Usercontrols/Employer_LeftMenu.ascx"TagName="Emp_Left" TagPrefix="uc3" %>

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - JobPost</title>
    <script language="JavaScript1.2" src="js/statesopt.js" type="text/javascript">
</script>
<link href="StyleSheet_new.css" rel="stylesheet" type="text/css" />
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />

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

<body topmargin="0" bottommargin="0" leftmargin="0">
<form id="form1" runat="server">
<table width="995" cellpadding="0" cellspacing="0">
<tr>

<td colspan="2">
    &nbsp;</td>

</tr>

<tr>
<td colspan="2" style="height: 18px">
<table>
<tr>
<td id="tdLogin" runat="server">
</td>
<td id="tdLogout" runat="server" ></td>

</tr>
</table>
</td>

</tr>


<tr>
<td width="20%" valign="top">
<table width="100%">
<tr>
<td>
<uc3:Emp_Left ID="Emp_LeftMenu" runat="server" />
</td>
</tr>
</table>
</td>

<td width="75%" valign="top">
<table width="100%">
<tr height="19">
               <td width="100%" align="center" class="toplft" height="15"></td>
              </tr>
              <tr height="190">
                <td  align="center" class="border"  valign="top" width="100%"  style="height: 190px;">
               <table width="100%" height="229" border="0">
               <tr height="19">
                
                <td colspan="2" class="headings" width="100%" style="height: 15px">
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
            <asp:TemplateField HeaderText="          ">
            <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server" Text="View" cssclass = "headings"></asp:HyperLink>
                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="View"
                        Text="View" ></asp:LinkButton>--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
            
                
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" NavigateUrl = '<%# FormatUrl( (int) Eval("rowid") )%>' runat="server" Text="Edit" CssClass = "headings" ></asp:HyperLink>
                                   
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


</td>
</tr>

</table>    
 </td>
 </tr>   
 
 <tr>
 <td colspan="2" align="center">
     &nbsp;</td>
 </tr>
 </table>
    </form>
</body>
</html>
