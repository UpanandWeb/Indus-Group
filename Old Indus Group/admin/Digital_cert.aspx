<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Digital_cert.aspx.cs" Inherits="Digital_cert" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Digital_Cert</title>
    
      
      <script language="javascript" type="text/javascript">  
   function alertfield()
{
var val=document.getElementById("admno").value;
if(val=="")
{
alert("Please enter the Admission Number!");
}
}
  </script>
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>

   
    <tr>
     <td align="center" valign="top" width="100%" class="lable">
    
    <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
    <td colspan='4' align="left" valign="bottom" style="height: 30px">
          <br /><br />
      <font size='4pt' color="#660000"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
          Certificate Verification Form</b></font></td>
          </tr>
          <tr>
    
      <td colspan='4' style="width: 201px; height: 20px" class="lable" align="center" valign="middle">
    
          <asp:Label ID="lblerror" runat="server" Height="10px" Width="246px" Font-Bold="True" Font-Size="Small" ForeColor="#C00000"></asp:Label><br />
          </td>
          </tr>
            <tr>
      <td width='20%' class="lable" align="left" valign="bottom" style="height: 26px">Admission No.</td>
      <td colspan='3' style="width: 339px; height: 26px;">
          <asp:TextBox ID="admno" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          &nbsp; &nbsp;<asp:Button ID="getdetails" runat="server" Height="21px" Text="Get Certificate"
              Width="121px" OnClick="getdetails_Click" /></td>
              
              
              
              
    </tr>
          
   <tr>
      <td id='tdimage' runat='server' colspan="2" class="lable" width='40%' style="height: 26px">
          </td>
          
            <td id='tddetails' runat='server' align="left" valign="top" colspan="2" class="lable" width='60%' style="height: 26px">
            <table id='tbldetails' runat="server" width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr> 
           
           <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
          Name </td>
      <td style="width: 390px; height: 20px;">
          &nbsp;<asp:Label ID="name" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">Address </td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="address" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
        
     <tr> 
           
           <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
               Country</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="country" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
          Email</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="email" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
     <tr> 
           
           <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
               Course Enrolled For</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="course" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
          Total Experience</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="totexp" runat="server" CssClass="labled"></asp:Label></td>
    </tr>    
     <tr> 
           
           <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
               Currently Working on</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="cwork" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
          Key Skills</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="kskills" runat="server" CssClass="labled"></asp:Label></td>
    </tr>    
     <tr> 
           
           <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
               Functional Area</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="fnarea" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
          UG/Basic Qualification</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="bqual" runat="server" CssClass="labled"></asp:Label></td>
    </tr>    
     <tr> 
           
           <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
               PG Course (if any)</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="pg" runat="server" CssClass="labled"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 127px; height: 20px" class="lable" align="left" valign="bottom">
          Post PG Course (if any)</td>
      <td style="width: 390px; height: 20px;">
          <asp:Label ID="ppg" runat="server" CssClass="labled"></asp:Label></td>
    </tr>    
       </table>     
          </td>
    </tr>
    
    <tr>
      <td colspan="2" class="lable" style="height: 26px">
          <div align="left">
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
          </div></td>
    </tr>
  </table>
    
    </td>
    </tr>
    
    
    
  
    </table>
    
    
    </form>
</body>
</html>