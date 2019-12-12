<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_CareersPost.aspx.cs" Inherits="Admin_jobPost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>: : Indus Group : : - Admin Control Panel -Careerspost</title>
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
<body>
    <form id="form1" runat="server">
    <div>
    <table>
    <tr><td>
    <table border="0" class="border" width="100%">
    <tr height="19">
      <td colspan="2" bgcolor="#336699" class="headings style21" style="height: 14px"> Job Postings</td>
    </tr>
    <tr>
      <td class="lable6" style="height: 19px; width: 132px;"> Job Description</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="txtJobDesc" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="height: 19px; width: 132px;" class="lable6"> Position</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtposition" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px" ForeColor="Black"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 19px;" class="lable6"> Functional Area</td>
      <td style="height: 19px; width: 286px;" class="lable5">
          <asp:DropDownList id="txtfnarea" runat="server" Width="238px" CssClass="lable4">
            <asp:ListItem selected="True">Select</asp:ListItem>
            <asp:ListItem value="Accounts / Finance / Tax / CS / Audit">Accounts / Finance / Tax / CS / Audit</asp:ListItem>
            <asp:ListItem value="Agent">Agent</asp:ListItem>
            <asp:ListItem value="Architecture / Interior Design">Architecture / Interior Design</asp:ListItem>
            <asp:ListItem value="Banking / Insurance">Banking / Insurance</asp:ListItem>
            <asp:ListItem value="Content / Journalism">Content / Journalism</asp:ListItem>
            <asp:ListItem value="Corporate Planning / Consulting">Corporate Planning / Consulting</asp:ListItem>
            <asp:ListItem value="Engineering Design / R and D">Engineering Design / R&amp; D</asp:ListItem>
            <asp:ListItem value="Export / Import / Merchandising">Export / Import / Merchandising</asp:ListItem>
            <asp:ListItem value="Fashion / Garments / Merchandising">Fashion / Garments / Merchandising</asp:ListItem>
            <asp:ListItem value="Guards / Security Services">Guards / Security Services</asp:ListItem>
            <asp:ListItem value="Hotels / Restaurants">Hotels / Restaurants</asp:ListItem>
            <asp:ListItem value="HR / Administration / IR">HR / Administration / IR</asp:ListItem>
            <asp:ListItem value="IT Software - Client Server">IT Software - Client Server</asp:ListItem>
            <asp:ListItem value="IT Software - Mainframe">IT Software - Mainframe</asp:ListItem>
            <asp:ListItem value="IT Software - Middleware">IT Software - Middleware</asp:ListItem>
            <asp:ListItem value="IT Software - Mobile">IT Software - Mobile</asp:ListItem>
            <asp:ListItem value="IT Software - Other">IT Software - Other</asp:ListItem>
            <asp:ListItem value="IT Software - System Programming">IT Software - System Programming</asp:ListItem>
            <asp:ListItem value="IT Software - Telecom Software">IT Software - Telecom Software</asp:ListItem>
            <asp:ListItem value="IT Software- Application Programming / Maintenance">IT Software- Application Programming / Maintenance</asp:ListItem>
            <asp:ListItem value="IT Software- DBA / Datawarehousing">IT Software- DBA / Datawarehousing</asp:ListItem>
            <asp:ListItem value="IT Software- E-Commerce / Internet Technologies">IT Software- E-Commerce / Internet Technologies</asp:ListItem>
            <asp:ListItem value="IT Software- Embedded / EDA / VLSI / ASIC / Chip Design">IT Software- Embedded / EDA / VLSI / ASIC / Chip Design</asp:ListItem>
            <asp:ListItem value="IT Software- ERP / CRM">IT Software- ERP / CRM</asp:ListItem>
            <asp:ListItem value="IT Software- Network Administration / Security">IT Software- Network Administration / Security</asp:ListItem>
            <asp:ListItem value="IT Software- QA and Testing">IT Software- QA &amp; Testing</asp:ListItem>
            <asp:ListItem value="IT Software- Systems / EDP / MIS">IT Software- Systems / EDP / MIS</asp:ListItem>
            <asp:ListItem value="IT- Hardware / Telecom / Technical Staff / Support">IT- Hardware / Telecom / Technical Staff / Support</asp:ListItem>
            <asp:ListItem value="ITES / BPO / KPO / Customer Service / Operations">ITES / BPO / KPO / Customer Service / Operations</asp:ListItem>
            <asp:ListItem value="Legal">Legal</asp:ListItem>
            <asp:ListItem value="Marketing / Advertising / MR / PR">Marketing / Advertising / MR / PR</asp:ListItem>
            <asp:ListItem value="Packaging">Packaging</asp:ListItem>
            <asp:ListItem value="Pharma / Biotech / Healthcare / Medical / R and D">Pharma / Biotech / Healthcare / Medical / R&amp; D</asp:ListItem>
            <asp:ListItem value="Production / Maintenance / Quality">Production / Maintenance / Quality</asp:ListItem>
            <asp:ListItem value="Purchase / Logistics / Supply Chain">Purchase / Logistics / Supply Chain</asp:ListItem>
            <asp:ListItem value="Sales / BD">Sales / BD</asp:ListItem>
            <asp:ListItem value="Secretary / Front Office / Data Entry">Secretary / Front Office / Data Entry</asp:ListItem>
            <asp:ListItem value="Self Employed / Consultants">Self Employed / Consultants</asp:ListItem>
            <asp:ListItem value="Site Engineering / Project Management">Site Engineering / Project Management</asp:ListItem>
            <asp:ListItem value="Teaching / Education">Teaching / Education</asp:ListItem>
            <asp:ListItem value="Ticketing / Travel / Airlines">Ticketing / Travel / Airlines</asp:ListItem>
            <asp:ListItem value="Top Management">Top Management</asp:ListItem>
            <asp:ListItem value="TV / Films / Production">TV / Films / Production</asp:ListItem>
            <asp:ListItem value="Web / Graphic Design / Visualiser">Web / Graphic Design / Visualiser</asp:ListItem>
            <asp:ListItem value="Other">Other</asp:ListItem>
        </asp:DropDownList></td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 19px;" class="lable6"> Location</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtLocation" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Job Function</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtJobFun" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Specialization</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtspecial" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 23px;" class="lable6"> Industry</td>
      <td style="height: 23px; width: 286px;" class="lable5">
          <asp:TextBox  id="txtFuncArea" runat="server"  CssClass="lable4" TextMode="MultiLine" MaxLength="50"></asp:TextBox></td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 22px;" class="lable6"> Qualification</td>
      <td style="height: 22px; width: 286px;" class="lable5">
          <asp:DropDownList ID="lstQuali" runat="server" CssClass="lable4" Width="83px">
            <asp:ListItem selected="True">-Select- </asp:ListItem>
            <asp:ListItem value="MCA">MCA</asp:ListItem>
            <asp:ListItem value="MBA">MBA</asp:ListItem>
            <asp:ListItem value="PGDCA">PGDCA</asp:ListItem>
            <asp:ListItem value="MCOM">MCOM</asp:ListItem>
            <asp:ListItem value="MSc">MSc</asp:ListItem>
            <asp:ListItem value="BTech">BTech</asp:ListItem>
            <asp:ListItem value="B.E">B.E</asp:ListItem>
            <asp:ListItem value="B.S.C">B.S.C</asp:ListItem>
            
        </asp:DropDownList></td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Experience</td>
      <td style="height: 19px; width: 286px;" class="lable5">
          <asp:DropDownList ID="lstExp" runat="server" CssClass="lable4" Width="85px">
            <asp:ListItem selected="True">Select </asp:ListItem>
            <asp:ListItem value="1-2">1-2</asp:ListItem>
            <asp:ListItem value="2-3">2-3</asp:ListItem>
            <asp:ListItem value="3-4">3-4</asp:ListItem>
            <asp:ListItem value="4-5">4-5</asp:ListItem>
            <asp:ListItem value="5-6">5-6</asp:ListItem>
            <asp:ListItem value="6-7">6-7</asp:ListItem>
            <asp:ListItem value="7-8">7-8</asp:ListItem>
            <asp:ListItem value="8-9">8-9</asp:ListItem>
            <asp:ListItem value="9-10">9-10</asp:ListItem>
            <asp:ListItem value="10-11">10-11</asp:ListItem>
            <asp:ListItem value="11-12">11-12</asp:ListItem>
            <asp:ListItem value="12-13">12-13</asp:ListItem>
            <asp:ListItem value="13-14">13-14</asp:ListItem>
            <asp:ListItem value="14-15">14-15</asp:ListItem>
            
        </asp:DropDownList></td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> </td>
      <td style="height: 19px; width: 286px;" class="lable5">&nbsp;</td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  colspan="2" height="17" align="center" class="lable5"><asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#000040"
                        Height="19px" Text=" Save" Width="100px" OnClick="btnsubmit_Click" /></td>
    </tr>
  </table>
    </td></tr></table>
    </div>
    </form>
</body>
</html>
