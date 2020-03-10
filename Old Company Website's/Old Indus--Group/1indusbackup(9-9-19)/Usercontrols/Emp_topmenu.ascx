<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Emp_topmenu.ascx.cs" Inherits="usercontrols_Emp_topmenu" %>

<style type "text/css">
    <!--
    /* @group Blink */
    .blink {
        -webkit-animation: blink .75s linear infinite;
        -moz-animation: blink .75s linear infinite;
        -ms-animation: blink .75s linear infinite;
        -o-animation: blink .75s linear infinite;
        animation: blink .75s linear infinite;
    }

    @-webkit-keyframes blink {
        0% {
            opacity: 1;
        }

        50% {
            opacity: 1;
        }

        50.01% {
            opacity: 0;
        }

        100% {
            opacity: 0;
        }
    }

    @-moz-keyframes blink {
        0% {
            opacity: 1;
        }

        50% {
            opacity: 1;
        }

        50.01% {
            opacity: 0;
        }

        100% {
            opacity: 0;
        }
    }

    @-ms-keyframes blink {
        0% {
            opacity: 1;
        }

        50% {
            opacity: 1;
        }

        50.01% {
            opacity: 0;
        }

        100% {
            opacity: 0;
        }
    }

    @-o-keyframes blink {
        0%;

    {
        opacity: 1;
    }

    50% {
        opacity: 1;
    }

    50.01% {
        opacity: 0;
    }

    100% {
        opacity: 0;
    }

    }

    @keyframes blink {
        0% {
            opacity: 1;
        }

        50% {
            opacity: 1;
        }

        50.01% {
            opacity: 0;
        }

        100% {
            opacity: 0;
        }
    }
    /* @end */
    -->
</style>
<style type="text/css">
    body {
    }

    a1 {
        width: 100px;
        border: 0;
        border-spacing: 0;
        border-width: 0;
    }

    a3 {
        border-spacing: 0;
        border-width: 0;
        border: 0;
    }

    a2 {
        border-spacing: 0;
        border-width: 0;
    }

    img {
        border: 0;
    }

    b1 {
        border-spacing: 0;
        border-width: 0;
    }

    .img-responsive .b2 {
        border-width: 0px;
    }
</style>
 <script>
     $(function () {
         var path = window.location.pathname;
         path = path.replace(/\/$/, "");
         path = decodeURIComponent(path);

         $(".nav li a").each(function () {
             var href = $(this).attr('href');
             if (path.substring((path.lastIndexOf('/') + 1), path.lenght) === href) {
                 $(this).closest('li').addClass('active');
             } else {
                 $(this).closest('li').removeClass();
             }
         });
     });
    </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="highlightNav.js"></script>

<%--<table><tr><td style="vertical-align:top;">
                      <ul class="menu"  style="list-style:none;display:inline; padding:-5px 10px 5px 10px;background-color:#1176a9; " >
                            <li style="display:inline; padding:10px;color:white;"><a style="color:white;"  href="Emp_Home.aspx" >Home</a></li>
                            <li style="display:inline;padding:10px;line-height:29px;color:white;" ><a style="color:white;"  href="Emp_profile.aspx" >Profile  </a></li>
                            <li style="display:inline;padding:10px;color:white;"><a style="color:white;"  href="Emp_EmployeeInfo.aspx" >Employee Info</a></li>
                            <li style="display:inline;padding:10px;color:white;"><a style="color:white;"  href="Emp_Careers.aspx" >Careers </a></li>
                            <li style="display:inline;padding:10px;color:white;"><a style="color:white;"  href="Emp_Timesheet.aspx" >TimeSheet</a></li>
                            <li style="display:inline;padding:10px;color:white;"><a style="color:white;"  href="Uploaddocs.aspx" >All Docs </a></li>
                      </ul></td></tr></table>--%>

<%--<div width="100%" align="center">

<ul class="menucontrol">
    <li><a href="Emp_Home.aspx">Home</a></li>
    <li><a href="Emp_profile.aspx">Profile</a></li>
    <li><a href="Emp_EmployeeInfo.aspx">Employee Info</a></l--%>
	<%--<li><a href="Emp_Careers.aspx">Careers</a></li>--%>
	<%--<li><a href="Emp_Timesheet.aspx">TimeSheet</a></li>--%>
<%--	<li><asp:LinkButton ID="lnktime" runat="server" Text="TimeSheet" Font-Underline="false" OnClick="lnktime_Click"></asp:LinkButton></li>

	<li><a href="Uploaddocs.aspx">All Docs</a></li>
</ul>


</div>--%>
<style>
    .dff {
    line-height:40px;
    }
</style>

<br />
 <table border="0" cellspacing="0" cellpadding="0" width="90%" align="center" >
                    <tr>
                        <td width="10%" align="left" valign="top">
                              <asp:LinkButton ID="lnkhome" runat="server" Text="Home" PostBackUrl="../Emp_Home.aspx" Font-Size="18px" Font-Names="arial" Font-Underline="false" ></asp:LinkButton> 
                        </td> 
                        <td width="80%" align="center" valign="top">
                               <asp:DataList ID="dlitems" runat="server" RepeatDirection="Horizontal" width="100%"  CellPadding="5" CellSpacing="17" >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkitems" runat="server"  Font-Size="18px" Font-Underline= "false"  Text='<%#Eval("item") %>'
                                         OnCommand="lnkitems_Command" CommandArgument="itemlist" CssClass="dff" ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td width="10%" align="right" valign="top">
                            <asp:LinkButton ID="lnkout" runat="server" Text="LogOut" OnClick="lnkALog_click" Font-Size="18px" Font-Underline="false"  ></asp:LinkButton>
                        </td>
                    </tr>
               </table>

<br />
<br />
<br />

<table width="90%" align="center">
    <tr>
        <td width="50%" align="left">
   Employee  Name :&nbsp;    &nbsp;       <asp:Label ID="lblfname" runat="server" Font-Size="18px"></asp:Label> &nbsp;
            <asp:Label ID="lbllastname" runat="server" Font-Size="18px"></asp:Label>
        </td>
      
    </tr>
</table>
<br />