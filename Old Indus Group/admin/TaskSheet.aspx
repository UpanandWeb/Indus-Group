<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskSheet.aspx.cs" Inherits="TaskSheet" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - TaskSheet</title>
<style type="text/css">
        .style9
        {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            border-bottom: 1px solid #DBDDDD;
            vertical-align: baseline;
            width: 188px;
        }
        .style10
        {
            width: 172px;
        }
        .style11
        {
            width: 197px;
        }
        .style12
        {
            width: 150px;
        }
        .datab
        {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            border-bottom: 1px solid #DBDDDD;
            vertical-align: baseline;
            width: 197px;
        }
        .style14
        {
            width: 348px;
        }
        </style>
<link rel="stylesheet" href="Styles/stylesheet.css" /> 
      
    <script language="javascript" type="text/javascript">        
    function calculateSum()    
    {        
        var sumValue = 0;        
        for(i=1;i<=7;i++) 
        {            
           obj = document.getElementById("txt" + i);            
           if(obj.value != "") 
           {               
              sumValue += parseInt(obj.value);            
           }        
        }        
        document.getElementById("txttot").value = sumValue;    
    }    
    </script>
    
    <%--<script language="javascript" type="text/javascript">
    function nonbillable()
    {
      var diff=0;
      for(i=1;i<=7;i++)
      {
         obj=document.getElementById("txt"+i);
         if(obj.value>8)
         {
            diff=parseInt(obj.value)-8;
            document.getElementById("txtnb"+i).value=diff;
         }
         else
         {
            document.getElementById("txtnb"+i).value=0;
         }
         
       }  
       
   }
    </script>--%>
    </head>
    
    
<body id="body1" runat="server">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
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
       <td>
       
        <table cellspacing="0" cellpadding="0" style="width: 77%" align="center">
     <tr>
     <td style="color:Blue" class="header">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TimeSheet
     </td>
     </tr>
     </table>
     
     <br />
    
    <table width="800">
    <tr>
    <td valign="top" align="left" class="style14">
      <table cellpadding="0" cellspacing="0" style="width: 128%; height: 66px;">
    
    <tr>
    <td class="style9"><span class="star">*</span>Employee Name</td>
    <td class="style10">
    <asp:DropDownList ID="ddlename" runat="server" Width="200px" CssClass="LABEL1"></asp:DropDownList>
    </td>
    <td class="style12">
    <asp:RequiredFieldValidator ID="reqf1" runat="server" ControlToValidate="ddlename" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
    </td>
    </tr>
    
     <tr>
     <td class="style9"><span class="star">*</span>Project Name</td>
     <td class="style10">
     <asp:DropDownList ID="ddlprojname" runat="server" Width="200px" CssClass="LABEL1"></asp:DropDownList>
      </td>
      <td class="style12">
     <asp:RequiredFieldValidator ID="reqf2" runat="server" ControlToValidate="ddlprojname" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
     <tr>
     <td class="style9"><span class="star">*</span>Employee Type</td>
     <td class="style10">
     <asp:DropDownList ID="ddltype" runat="server" Width="200px" 
             onselectedindexchanged="ddltype_SelectedIndexChanged" CssClass="LABEL1" 
             AutoPostBack="True" Height="21px">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Full Time</asp:ListItem>
     <asp:ListItem Value="2">Part Time</asp:ListItem>
     </asp:DropDownList>
     </td>
     </tr>
     
     
     </table>
    
    </td>
   
    <td width="20%" valign="middle" align="center">
     <table width="100%">
     <tr id="trfull" runat="server">
     <td class="style11">
     <asp:UpdatePanel ID="update1" runat="server">
     <ContentTemplate>
         <asp:Calendar ID="Calendar1" runat="server" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
     </ContentTemplate>
     <Triggers>
     <asp:AsyncPostBackTrigger ControlID="ddltype" EventName="SelectedIndexChanged" />
     </Triggers>        
     </asp:UpdatePanel>
     </td>
     
      <td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
     </tr>
     </table>
    
    </td>
    </tr>
    
    <tr>
    <td width="100%" colspan="2">
    <asp:UpdatePanel ID="update2" runat="server">
    <ContentTemplate>
    <table width="100%">
    <tr>
    <td width="100%" align="left" valign="top" colspan="2">
    <table width="100%" cellpadding="0" cellspacing="0">
     <tr>
    
     <td width="10%" align="center" id="td1" runat="server" class="style11"></td>
     <td width="10%" align="center" id="td2" runat="server" class="style11"></td>
     <td width="10%" align="center" id="td3" runat="server" class="style11"></td>
     <td width="10%" align="center" id="td4" runat="server" class="style11"></td>
     <td width="10%" align="center" id="td5" runat="server" class="style11"></td>
     <td width="10%" align="center" id="td6" runat="server" class="style11"></td>
     <td width="10%" align="center" id="td7" runat="server" class="style11"></td>
    
     </tr>
     
     <tr id="trtext" runat="server">
    
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt1" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt2" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt3" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt4" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt5" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt6" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txt7" runat="server" Width="50%"></asp:TextBox></td>
   
     </tr>
     
    <%-- <tr id="trbill" runat="server">
     <td class="style16">Billable Hours</td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb1" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb2" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb3" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb4" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb5" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb6" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtb7" runat="server" Width="50%"></asp:TextBox></td>
   
     </tr>
     
     <tr id="trnonbill" runat="server">
     <td class="style16">NonBillable Hours</td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb1" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb2" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb3" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb4" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb5" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb6" runat="server" Width="50%"></asp:TextBox></td>
     <td width="10%" class="style11" align="center"><asp:TextBox ID="txtnb7" runat="server" Width="50%"></asp:TextBox></td>
   
     </tr>--%>
     
      </table>
    </td>
    </tr>
    
    
    <tr>
    <td width="50%" align="left">
    <table width="100%">
      
   
     <tr id="trtot" runat="server">
     <td class="datab" width="5%" align="left"> Billable </td>
     <td class="style10" width="95%" align="left">
         <asp:TextBox ID="txttot" runat="server" Width="108px"></asp:TextBox>
     </td>
     </tr>
    
    
     <tr id="trot" runat="server">
     <td class="datab" width="5%" align="left"> Billable </td>
     <td class="style10" width="95%" align="left">
     <asp:TextBox ID="txtot" runat="server" CssClass="LABEL1"></asp:TextBox>
     </td>
     </tr>
    
    
     <tr id="trnonb" runat="server">
     <td class="datab" width="5%" align="left"> Non Billable </td>
     <td class="style10" width="95%" align="left">
     <asp:TextBox ID="txtnbtot" runat="server" CssClass="LABEL1"></asp:TextBox>
     </td>
     </tr>
    
    
    </table>
    </td>
    <td width="50%" align="left">
    &nbsp;
    </td>
    
    </tr>
    </table>
     
     <table align="center">
     <tr>
     <td align="center">
     <asp:Button ID="btnsave" runat="server" Text="SAVE" OnClick="btnsave_Click" CssClass="wr_login_title" />
     </td>
     </tr>
     </table>
     </ContentTemplate>
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
    </Triggers>
     </asp:UpdatePanel>
     
   
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