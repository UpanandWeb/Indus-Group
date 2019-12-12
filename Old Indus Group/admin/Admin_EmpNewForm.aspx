    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpNewForm.aspx.cs" Inherits="Admin_EmpNewForm" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>: : Indus Group : : Admin Control Panel - Employee Data Sheet</title>
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
<script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
<script language="javascript" type="text/javascript">

function alertcreate() {
    alert("Employee Details has been Created Successfully");
}
function alertedit()
{
    alert("Employee Details has been edited Successfully");
}

function alertdelete() {
    alert("Employee Details has been deleted Successfully");
}
</script>
<script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script>    
<link rel="stylesheet" href="Styles/stylesheet.css" />   
    
    <style type="text/css">
       /* .style24
        {
            height: 18px;
        }
        .style25
        {
            height: 21px;
        }
        */
        
    </style>
    
    <script language="javascript" type="text/javascript" >
        function Sample() {
            var n = document.getElementById("GridView1").rows.length;
            var i;
            var j = 0;
            for (i = 2; i <= n; i++) {
                if (i < 10) {
                    if (document.getElementById("GridView1_ctl0" + i + "_chkselect").checked == true) {
                        if (j > 0) {
                            alert('you can select only one...');
                            document.getElementById("GridView1_ctl0" + i + "_chkselect").checked = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
                else {
                    if (document.getElementById("GridView1_ctl" + i + "_chkselect").checked == true) {
                        if (j > 0) {
                            alert('you can select only one...');
                            document.getElementById("GridView1_ctl0" + i + "_chkselect").checked = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
            }
        }
</script>
  
<script type="text/javascript" language="javascript">
    function confirmMessageDelete(frm)
    {
        for(i = 0; i < frm.length; i++)
        {
            if(frm.elements[i].checked)
            {
                return confirm("Are you sure you want to delete the selected record?");
                return true;
            }            
        }        
      alert('select atleast one Checkbox for Delete!');
      return false;
    }
    </script>    
<script type="text/javascript" language="javascript">
    function selectOne(frm)
    {
     for(i=0;i<frm.length;i++)
     {
       if(frm.elements[i].checked)
       {
         return true;
       }
     }
    alert('select atleast one Checkbox for Edit!');
      return false;
    }
    </script>    
 <script type="text/javascript" language="javascript">
    function selectOneView(frm)
    {
     for(i=0;i<frm.length;i++)
     {
       if(frm.elements[i].checked)
       {
         return true;
       }
     }
    alert('select atleast one Checkbox to View the details!');
      return false;
    }
    </script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/grdiviewScroll.min.js"></script> 
<script type="text/javascript"> 
    $(document).ready(function () { 
        gridviewScroll(); 
    });  
    function gridviewScroll() { 
        $('#<%=GridView1.ClientID%>').gridviewScroll({         
            width: 1000,             
            freezesize: 2 
        }); 
    } 
</script>
<style>
    .pnlbg
    {
    	border:1px solid Gray;
    	
    }
#GridView1
{
	border:1px solid Gray;
	padding:2px;
}
.GridviewScrollHeader TH, .GridviewScrollHeader TD 
{ 
	color: #00277a;
    padding: 5px; 
    font-weight: bold; 
    white-space: nowrap; 
    border-right: 1px solid #CCCCCC; 
    border-bottom: 1px solid #CCCCCC; 
    background-color: #EFEFEF; 
    text-align: center; 
    vertical-align: bottom; 
} 
.GridviewScrollItem TD 
{ 
    padding: 5px; 
    white-space: nowrap; 
    border-right: 1px solid #CCCCCC; 
    border-bottom: 1px solid #CCCCCC; 
    background-color: White; 
} 
.GridviewScrollPager  
{ 
    border-top: 1px solid #AAAAAA; 
    background-color: #FFFFFF; 
} 
.GridviewScrollPager TD 
{ 
    padding-top: 3px; 
    font-size: 14px; 
    padding-left: 5px; 
    padding-right: 5px; 
} 
.GridviewScrollPager A 
{ 
    color: #00277a; 
}
.GridviewScrollPager SPAN
{
    font-size: 16px;
    font-weight: bold;
}
</style>    
</head>

<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server"> 
         <table width="96%" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff" border="0">
              <tr>
        <td valign="top" width='100%' class="lblog" >
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
              <tr>
        <td class="style24">
        &nbsp;
        </td>
    </tr>
              <tr>
        <td align="center" class="style25">
            <font size='5pt' color="#00277a"><b>Employees H1B Visa Details </b></font>
        </td>
    </tr>
              <tr><td>&nbsp;</td></tr>
              <tr id="trbuttons" runat="server">     
      <td align="right">
      <table style="width: 150px">      
      <tr id="tr1" runat="server"> 
          <td>
            <asp:LinkButton ID="lnknew" runat="server" Text="Add New" Font-Size="18px" OnClick="lnknew_Click"></asp:LinkButton>
          </td>     
      <td>
      <asp:ImageButton ID="imgedit" runat="server" ToolTip="Edit" 
              OnClientClick="return selectOne(this.form)" AlternateText="Edit" Height="20px" ImageUrl="images/edit.jpg"
              Width="17px" onclick="imgedit_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgdelete" runat="server" ToolTip="Delete" 
              OnClientClick="return confirmMessageDelete(this.form)" AlternateText="Delete" 
              Height="20px" ImageUrl="images/1371_normalDelete_20_n_g.gif"
              Width="17px" onclick="imgdelete_Click" />
      </td>    
      </tr>
      </table>
      </td>
      </tr>
              <%--<tr>
        <td align="right" bgcolor="white" width="100%" style="padding-right:110px"><font color='#003399' size='1pt'><b><a href="Admin_EmpNewFrmCreate.aspx">Add H1B Form</a></b></font></td>
    </tr>--%>
              <tr>
                  <td height="20px"></td>

              </tr>
              <tr>
                    <td align="center" width="100%">
             
     <%-- <td id="tdcontent" runat="server" valign="top"  style="" class="lable" Width="96%"> --%>
      <%--<asp:Panel ID="pnlGrid" runat="server" Width="96%" CssClass="pnlbg" >   --%>
      <asp:GridView ID="GridView1" runat="server"   AutoGenerateColumns="False" Width="96%"  BorderColor="#CCCCCC"
                BorderWidth="1" CellPadding="3" CellSpacing="0" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="9pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"                
                   OnRowDataBound="GridView1_RowDataBound" DataKeyNames="id">
           
              <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" Width="96%" /> 
    <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
    <PagerStyle CssClass="GridviewScrollPager" /> 

            <Columns>
             <asp:TemplateField  ItemStyle-ForeColor="Gray" HeaderText=""  ItemStyle-BorderColor="#CCCCCC">
      <ItemTemplate >
      <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
      </ItemTemplate>     
      </asp:TemplateField>   
      <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Font-Bold="true">                      
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle ForeColor="Gray" />
                   </asp:TemplateField>   
               <%-- <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />--%>
                <asp:BoundField DataField="FamilyName" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Last Name" SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="FName" ItemStyle-ForeColor="Gray"   ItemStyle-BorderColor="#CCCCCC" HeaderText="First Name" SortExpression="FName" />
                <asp:BoundField DataField="MName" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Middle Name" SortExpression="MName" />
                <asp:BoundField DataField="SSNo" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="SS Number" SortExpression="SSNo" />
                <%--<asp:BoundField DataField="I94No" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="I94 Number" SortExpression="I94No" />--%>
                <asp:BoundField DataField="passportno"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Passport No" SortExpression="passportno" />
                <asp:TemplateField  ItemStyle-ForeColor="Gray" HeaderText="I-94 Number / Valid Untill"  ItemStyle-BorderColor="#CCCCCC" >
                <ItemTemplate>
                <asp:Label ID="lblI94" runat="server" ><%#Eval("I94No")%> / <%#Eval("expdt_I94")%></asp:Label>               
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField  ItemStyle-ForeColor="Gray" HeaderText="H-1B-EAC Number / Valid Untill"  ItemStyle-BorderColor="#CCCCCC" >
                <ItemTemplate>
                <asp:Label ID="lblEAC" runat="server" ><%#Eval("H1B_EAC")%> / <%#Eval("Valid_EAC")%></asp:Label>               
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  ItemStyle-ForeColor="Gray" HeaderText="EAD  Number / Valid Untill"  ItemStyle-BorderColor="#CCCCCC" >
                <ItemTemplate>
                <asp:Label ID="lblEAD" runat="server" ><%#Eval("EAD")%> / <%#Eval("Valid_EAD")%></asp:Label>                
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ItemStyle-ForeColor="Gray" HeaderText="I-140 EAC Number / Valid Untill" ItemStyle-BorderColor="#CCCCCC">
                <ItemTemplate>
               <asp:Label ID="lblIO" runat="server" ><%#Eval("I_EAC")%> / <%#Eval("Valid_IEAC")%></asp:Label> 
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-ForeColor="Gray" HeaderText="I-485 EAC Number / Valid Untill" ItemStyle-BorderColor="#CCCCCC">
                <ItemTemplate>
               <asp:Label ID="lblIO1" runat="server" ><%#Eval("I_485_EAC")%> / <%#Eval("Valid_I485")%></asp:Label> 
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  ItemStyle-ForeColor="Gray" HeaderText="DOL-LCA Number / Valid Untill"  ItemStyle-BorderColor="#CCCCCC" >
                <ItemTemplate>
                <asp:Label ID="lblDOL" runat="server" ><%#Eval("DOL_LCA")%> / <%#Eval("Valid_LCA")%></asp:Label>                
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ItemStyle-ForeColor="Gray" HeaderText="DOL-PERM Number / Valid Untill" ItemStyle-BorderColor="#CCCCCC">
                <ItemTemplate>
               <asp:Label ID="lblPerm" runat="server" ><%#Eval("DOL_PERM")%> / <%#Eval("Valid_PERM")%></asp:Label> 
                </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" >
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" ForeColor="Gray" Text="Edit" NavigateUrl='<%# EditUrl ( (string) Eval("comp_email"),(int) Eval("id") ) %>' runat="server">
                </asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC">
                <ItemTemplate>
                <%--<asp:HyperLink ID="HyperLink1" Text="Delete" NavigateUrl='<%#"Admin_EmpNewForm_Delete.aspx?cid="+DataBinder.Eval(Container.DataItem,"id") %>' runat="server">
                </asp:HyperLink>--%>
                <%--<asp:LinkButton ID="lnkRecDelete" ForeColor="Gray" Text="Delete" runat="server" OnClick="lnkdelrecord"></asp:LinkButton>

                </ItemTemplate>
                </asp:TemplateField>--%>
                
            </Columns>

<%--<HeaderStyle CssClass="lableb"></HeaderStyle>--%>
        </asp:GridView>
      <%-- </asp:Panel>--%>
             <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
      </td>
    </tr>
              <tr>
                  <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
                 </td>
              </tr>
       </table>    
    </form>
</body>
</html>