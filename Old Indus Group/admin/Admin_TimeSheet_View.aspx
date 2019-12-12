<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_TimeSheet_View.aspx.cs" Inherits="Admin_TimeSheet_View" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TimeSheet_view</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("TimeSheet Details has been saved Successfully");
}
function alertdelete()
{
alert("TimeSheet Details has been deleted Successfully");
}

function alertsubmit()
{
alert("TimeSheet Details has been saved Successfully");
}


    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
    <style type="text/css">
        .style24
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 102px;
        }
        .style26
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 601px;
        }
        .style27
        {
            height: 22px;
        }
        .style28
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 22px;
        }
        .style29
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 601px;
            height: 22px;
        }
    </style>
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="regForm" runat="server">
    <center>
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    
       
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      
       <table style="width: 702px">
       <tr><td>&nbsp;</td></tr>
       <tr><td align="right" valign="bottom" ><a runat="server" id="navi">Back</a></td></tr>
                <tr>
                    <td class="lable" align="left" valign="top">
                        <table id="tb1" allign="center" runat="server" width="702">
                        
                            <tr height="20">
                                <td colspan="3" align="center" style="font-weight: bold; font-size: 15pt; color:#00277a">
                                    Time Sheet                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Email ID</td>
                                <td>
                                    : </td>
                                <td class="style26">
                                    <asp:Label  ID="empid" runat="server"  
                                        ></asp:Label>
                                </td>
                                
                                
                             </tr>
                            
                            <tr>
                                <td class="lable">
                                    Consultant Name
                                    
                                </td>
                                <td>
                                    : </td>
                                <td class="style26">
                                    <asp:Label  ID="txtcname" runat="server"></asp:Label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Client Name
                                </td>
                                <td>
                                    : </td>
                                <td class="style26">
                                    <asp:Label ID="clname" runat="server"></asp:Label>
                                    
                                </td>
                            </tr>
                            
                              <tr>
                                <td class="lable">
                                    Time Period</td>
                                <td>
                                    : </td>
                                <td class="style26">
                              <asp:Label ID="txttime" runat="server"></asp:Label>
                                                                
                                        </td>
                            </tr>
                            
                              <tr>
                                <td class="style28">
                                    From Date
                                </td>
                                <td class="style27">
                                    :</td>
                                <td class="style29">
                                
                                <asp:Label ID="fromdate" runat="server" ></asp:Label>
        
                                </td>
                            </tr>
                            
                            
                              <tr>
                                <td class="lable">
                                    To Date
                                </td>
                                <td>
                                    :</td>
                                <td class="style26">
                                
                                <asp:Label ID="todate" runat="server" ></asp:Label>
        
                                </td>
                            </tr>
                         
                            <tr>
                                <td class="lable" colspan="3">
                                    <table>
                                                             
                        
                        <tr>
                        <td align="left" class="lable">
                        Date
                        </td>
                        <td width="65px"></td><td>:</td>
                        <td class="lable" align="center">
                        1
                        </td>
                        
                        <td class="lable" align="center">
                        2
                        </td>
                        <td class="lable" align="center">
                        3
                        </td>
                        <td class="lable" align="center">
                        4
                        </td>
                        <td class="lable" align="center">
                        5
                        </td>
                        
                        <td class="lable" align="center">
                        6
                        </td>

                        <td class="lable" align="center">
                        7
                        </td>

                        <td class="lable" align="center">
                        8
                        </td>

                        <td class="lable" align="center">
                        9
                        </td>

                        <td class="lable" align="center">
                        10
                        </td>
                       <td class="lable" align="center">
                        11
                        </td>
                        <td class="lable" align="center">
                        12
                        </td>

                        <td class="lable" align="center">
                        13
                        </td>
                        <td class="lable" align="center">
                        14
                        </td>
                        <td class="lable" align="center">
                        15
                        </td>

<td class="lable">
                                    &nbsp;
                                    </td>
                        
                        
                        </tr>
                        
                        
                                    <tr>
                                    <td align="center" class="lable">
                                    Reg.
                                    </td><td width="65px"></td><td>:</td>
                                    <td class="lable" align="center">
                                    <asp:Label  ID="t1" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t2" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t3" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t4" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t5" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t6" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t7" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t8" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t9" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t10" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t11" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label  ID="t12" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t13" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t14" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t15" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    &nbsp;
                                    </td>
                                    </tr>


                                    <tr>
                                    <td align="center" class="lable" align="center">
                                    OT.
                                    </td><td width="65px"></td><td>:</td>
                                    <td class="lable" align="center" align="center">
                                    <asp:Label ID="o1" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o2" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o3" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o4" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:Label ID="o5" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o6" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o7" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o8" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o9" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o10" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o11" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o12" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center"> 
                                    <asp:Label ID="o13" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o14" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o15" runat="server" Width="30"></asp:Label>
                                    </td>
                                    <td class="lable" align="center">
                                    &nbsp;
                                    </td>
                          
                                    
                                    </tr>

                                    <tr height="10px">
                                    <td colspan="16">&nbsp; </td>
                                    </tr>
                                    
                                    
                                     <tr>
                                     <td align="center" class="lable" align="center">
                                    Date
                                    </td><td width="65px"></td><td>:</td>
                        <td class="lable" align="center">
                        16
                        </td>
                        
                        <td class="lable" align="center">
                        17
                        </td>
                        <td class="lable" align="center">
                        18
                        </td>
                        <td class="lable" align="center">
                        19
                        </td>
                        <td class="lable" align="center">
                        20
                        </td>
                        
                        <td class="lable" align="center">
                        21
                        </td>

                        <td class="lable" align="center">
                        22
                        </td>

                        <td class="lable" align="center">
                        23
                        </td>

                        <td class="lable" align="center">
                        24
                        </td>

                        <td class="lable" align="center">
                        25
                        </td>
                       <td class="lable" align="center">
                        26
                        </td>
                        <td class="lable" align="center">
                        27
                        </td>

                        <td class="lable" align="center">
                        28
                        </td>
                        <td class="lable" align="center">
                        29
                        </td>
                        <td class="lable" align="center">
                        30
                        </td>
                        
                        <td class="lable" align="center">
                        31
                        </td>
                        
                        </tr>
                        
                                    <tr>
                                    <td align="center" class="lable" align="center">
                                    Reg.
                                    </td><td width="65px"></td><td>:</td>
                                    <td class="lable" align="center">
                                    <asp:Label ID="t16" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t17" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t18" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t19" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t20" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t21" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t22" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t23" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t24" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t25" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t26" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t27" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t28" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t29" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t30" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="t31" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    </tr>
                                    
                                    
                                    
                                    
                                    <tr>
                                    <td align="center" class="lable">
                                    OT
                                    </td><td width="65px"></td><td>:</td>
                                    <td class="lable" align="center">
                                    <asp:Label  ID="o16" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o17" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o18" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o19" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o20" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o21" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o22" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o23" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o24" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o25" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o26" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o27" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o28" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o29" runat="server" Width="30"></asp:Label>
                                    </td>
                                    
                                    <td class="lable" align="center">
                                    <asp:Label ID="o30" runat="server" Width="30"></asp:Label>
                                    </td>

                                    <td class="lable" align="center">
                                    <asp:Label ID="o31" runat="server" Width="30" ></asp:Label>
                                    </td>

                                    
                                    </tr>
                                    
                                                                         
                                    </table>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="style24">
                                   
                                    Total
                                    Working Hours
                                </td>
                                <td>
                                    : </td>
                                <td class="lable">
                                    <asp:Label  ID="whrs" runat="server" CssClass="lable"
                                        Width="209px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style24">
                                    Total
                                    Over Time
                                </td>
                                <td>
                                    : </td>
                                <td class="lable">
                                    <asp:Label ID="otime" runat="server" Width="209px" CssClass="lable"></asp:Label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="style24">
                                    Remarks</td>
                               <td>
                                    : </td>
                                <td class="lable">
                                    <asp:TextBox ReadOnly="true" ID="txtrem" runat="server" TextMode="MultiLine" BorderWidth="1" 
                                        CssClass="lable" Height="102px" Width="296px"></asp:TextBox>
                                    </td>
                                        </tr>
                                    
                                    <tr>
                                    <td colspan="3">&nbsp; </td>
                                    </tr>    
                                    
                                    <tr>
                                    <td colspan="3" class="lable" align="center" style="font-weight: bold; font-size: 15pt">                                    
                                    Instructions
                                    </td>
                                    </tr>
                                        
                                         <tr>
                              <%-- <td class="style25"></td>
                               --%>
                                <td class="lable" colspan="3">
                                    Please enter regular hours in Reg. cell and over time hours in OT cell. All days 
                                    in the specified time period must be filled.&nbsp; Use Codes as follows:&nbsp; V = 
                                    Vacation, H = Holiday Monthly: 1 - 30/31 days, Mon-Sun.&nbsp; Please submit the 
                                    time sheet before 5th of every month. Otherwise we will not be able to run the 
                                    payroll by 15th of every month for those who have not submitted the IGI Internal 
                                    payroll time sheet. Thanks for your co-operation.</td>
                                   
                                        </tr>
                               
                                    <tr>
                                    <td colspan="3" class="style27">&nbsp; </td>
                                    </tr>        
                                        
                               <tr>
                               <%--<td class="style25"></td>--%>
                               
                               <td class="lable" colspan="3" align="center">
                                    Indus Group Inc. 1033 Sterling Road, Ste. 204, Herndon - VA - 20170, USA.<br />
                                                                        www.1indus.com email: <a href="mailto:accounts@1indus.com">accounts@1indus.com</a>, Phone:&nbsp; 703-291-8299 / Fax: 703-649-6458
                                    </td>
                                   
                                        </tr>
                                        
                                    <tr>
                                    <td colspan="3">&nbsp; </td>
                                    </tr>        
                                        
                                        
                                        
                           
                            
                           
                            <tr>
                                        
                                <td colspan="3">
                                                    
    
                                     </td>
                               
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
      
      
      
      </td>
    </tr>
    
    <tr>
    <td id="cntdata" runat="server">
    
    </td>
    </tr>
  
    </table>
     </center>       
    </form>
</body>
</html>