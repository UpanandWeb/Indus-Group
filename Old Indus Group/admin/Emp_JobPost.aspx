<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_JobPost.aspx.cs" Inherits="Emp_JobPost" %>
<%@ Register Src="Usercontrols/Employer_LeftMenu.ascx"TagName="Emp_Left" TagPrefix="uc3" %>

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Emp_Jobpost</title>
    <script language="JavaScript1.2" src="js/statesopt.js" type="text/javascript">
</script>
<script language="JavaScript1.2" src="Jscripts/empregvalidation.js" type="text/javascript"></script>
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

<td colspan="1">
    &nbsp;</td>

</tr>

<tr>

<td width="75%" valign="top">
<table width="100%">
<tr height="19">
               <td width="100%" align="center" class="toplft" style="height: 15px"></td>
              </tr>
              <tr height="190">
                <td  align="center" class="border"  valign="top" width="100%"  style="height: 190px;">
               <table border="0" class="border" width="100%">
    <tr height="19">
      <td colspan="2" bgcolor="#336699" class="headings style21" style="height: 14px"> Job Posting</td>
    </tr>
    <tr>
      <td class="lable6" style="height: 19px; width: 132px;"> Job Title</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="txtjobtitle" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="height: 19px; width: 132px;" class="lable6"> Number of Posts</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtposts" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px" ForeColor="Black"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 19px;" class="lable6"> Key Skills</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtskill" runat="server" MaxLength="50" TextMode="MultiLine" CssClass="lable4" Width="238px" Height="51px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 19px;" class="lable6"> Basic Qualification</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="txtqual" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Minimun Experience</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="expmin" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Maximum Experience</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="expmax" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 23px;" class="lable6"> Functional Area</td>
      <td style="height: 23px; width: 286px;" class="lable5">
          <asp:DropDownList ID="txtfnarea" runat="server" CssClass="lable4" Width="238px">
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
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 22px;" class="lable6"> Minimun Salary (in Lakhs)</td>
      <td style="height: 22px; width: 286px;" class="lable5">
          <asp:DropDownList ID="minsal" runat="server" CssClass="lable4" Width="83px">
            <asp:ListItem selected="True">Select Salary</asp:ListItem>
            <asp:ListItem value="50000">&lt;50K</asp:ListItem>
            <asp:ListItem value="100000">1</asp:ListItem>
            <asp:ListItem value="200000">2</asp:ListItem>
            <asp:ListItem value="300000">3</asp:ListItem>
            <asp:ListItem value="400000">4</asp:ListItem>
            <asp:ListItem value="500000">5</asp:ListItem>
            <asp:ListItem value="600000">6</asp:ListItem>
            <asp:ListItem value="700000">7</asp:ListItem>
            <asp:ListItem value="800000">8</asp:ListItem>
            <asp:ListItem value="900000">9</asp:ListItem>
            <asp:ListItem value="1000000">10</asp:ListItem>
            <asp:ListItem value="1100000">11</asp:ListItem>
            <asp:ListItem value="1200000">12</asp:ListItem>
            <asp:ListItem value="1300000">13</asp:ListItem>
            <asp:ListItem value="1400000">14</asp:ListItem>
            <asp:ListItem value="1500000">15</asp:ListItem>
            <asp:ListItem value="1600000">16</asp:ListItem>
            <asp:ListItem value="1700000">17</asp:ListItem>
            <asp:ListItem value="1800000">18</asp:ListItem>
            <asp:ListItem value="1900000">19</asp:ListItem>
            <asp:ListItem value="2000000">20</asp:ListItem>
            <asp:ListItem value="2100000">21</asp:ListItem>
            <asp:ListItem value="2200000">22</asp:ListItem>
            <asp:ListItem value="2300000">23</asp:ListItem>
            <asp:ListItem value="2400000">24</asp:ListItem>
            <asp:ListItem value="2500000">25</asp:ListItem>
            <asp:ListItem value="2600000">26</asp:ListItem>
            <asp:ListItem value="2700000">27</asp:ListItem>
            <asp:ListItem value="2800000">28</asp:ListItem>
            <asp:ListItem value="2900000">29</asp:ListItem>
            <asp:ListItem value="3000000">30</asp:ListItem>
            <asp:ListItem value="3100000">31</asp:ListItem>
            <asp:ListItem value="3200000">32</asp:ListItem>
            <asp:ListItem value="3300000">33</asp:ListItem>
            <asp:ListItem value="3400000">34</asp:ListItem>
            <asp:ListItem value="3500000">35</asp:ListItem>
            <asp:ListItem value="3600000">36</asp:ListItem>
            <asp:ListItem value="3700000">37</asp:ListItem>
            <asp:ListItem value="3800000">38</asp:ListItem>
            <asp:ListItem value="3900000">39</asp:ListItem>
            <asp:ListItem value="4000000">40</asp:ListItem>
            <asp:ListItem value="4100000">41</asp:ListItem>
            <asp:ListItem value="4200000">42</asp:ListItem>
            <asp:ListItem value="4300000">43</asp:ListItem>
            <asp:ListItem value="4400000">44</asp:ListItem>
            <asp:ListItem value="4500000">45</asp:ListItem>
            <asp:ListItem value="4600000">46</asp:ListItem>
            <asp:ListItem value="4700000">47</asp:ListItem>
            <asp:ListItem value="4800000">48</asp:ListItem>
            <asp:ListItem value="4900000">49</asp:ListItem>
            <asp:ListItem value="5000000">50</asp:ListItem>
            <asp:ListItem value="5100000">51</asp:ListItem>
            <asp:ListItem value="5200000">52</asp:ListItem>
            <asp:ListItem value="5300000">53</asp:ListItem>
            <asp:ListItem value="5400000">54</asp:ListItem>
            <asp:ListItem value="5500000">55</asp:ListItem>
            <asp:ListItem value="5600000">56</asp:ListItem>
            <asp:ListItem value="5700000">57</asp:ListItem>
            <asp:ListItem value="5800000">58</asp:ListItem>
            <asp:ListItem value="5900000">59</asp:ListItem>
            <asp:ListItem value="6000000">60</asp:ListItem>
        </asp:DropDownList></td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Maximum Salary (in Lakhs)</td>
      <td style="height: 19px; width: 286px;" class="lable5">
          <asp:DropDownList ID="maxsal" runat="server" CssClass="lable4" Width="85px">
            <asp:ListItem selected="True">Select Salary</asp:ListItem>
            <asp:ListItem value="50000">&lt;50K</asp:ListItem>
            <asp:ListItem value="100000">1</asp:ListItem>
            <asp:ListItem value="200000">2</asp:ListItem>
            <asp:ListItem value="300000">3</asp:ListItem>
            <asp:ListItem value="400000">4</asp:ListItem>
            <asp:ListItem value="500000">5</asp:ListItem>
            <asp:ListItem value="600000">6</asp:ListItem>
            <asp:ListItem value="700000">7</asp:ListItem>
            <asp:ListItem value="800000">8</asp:ListItem>
            <asp:ListItem value="900000">9</asp:ListItem>
            <asp:ListItem value="1000000">10</asp:ListItem>
            <asp:ListItem value="1100000">11</asp:ListItem>
            <asp:ListItem value="1200000">12</asp:ListItem>
            <asp:ListItem value="1300000">13</asp:ListItem>
            <asp:ListItem value="1400000">14</asp:ListItem>
            <asp:ListItem value="1500000">15</asp:ListItem>
            <asp:ListItem value="1600000">16</asp:ListItem>
            <asp:ListItem value="1700000">17</asp:ListItem>
            <asp:ListItem value="1800000">18</asp:ListItem>
            <asp:ListItem value="1900000">19</asp:ListItem>
            <asp:ListItem value="2000000">20</asp:ListItem>
            <asp:ListItem value="2100000">21</asp:ListItem>
            <asp:ListItem value="2200000">22</asp:ListItem>
            <asp:ListItem value="2300000">23</asp:ListItem>
            <asp:ListItem value="2400000">24</asp:ListItem>
            <asp:ListItem value="2500000">25</asp:ListItem>
            <asp:ListItem value="2600000">26</asp:ListItem>
            <asp:ListItem value="2700000">27</asp:ListItem>
            <asp:ListItem value="2800000">28</asp:ListItem>
            <asp:ListItem value="2900000">29</asp:ListItem>
            <asp:ListItem value="3000000">30</asp:ListItem>
            <asp:ListItem value="3100000">31</asp:ListItem>
            <asp:ListItem value="3200000">32</asp:ListItem>
            <asp:ListItem value="3300000">33</asp:ListItem>
            <asp:ListItem value="3400000">34</asp:ListItem>
            <asp:ListItem value="3500000">35</asp:ListItem>
            <asp:ListItem value="3600000">36</asp:ListItem>
            <asp:ListItem value="3700000">37</asp:ListItem>
            <asp:ListItem value="3800000">38</asp:ListItem>
            <asp:ListItem value="3900000">39</asp:ListItem>
            <asp:ListItem value="4000000">40</asp:ListItem>
            <asp:ListItem value="4100000">41</asp:ListItem>
            <asp:ListItem value="4200000">42</asp:ListItem>
            <asp:ListItem value="4300000">43</asp:ListItem>
            <asp:ListItem value="4400000">44</asp:ListItem>
            <asp:ListItem value="4500000">45</asp:ListItem>
            <asp:ListItem value="4600000">46</asp:ListItem>
            <asp:ListItem value="4700000">47</asp:ListItem>
            <asp:ListItem value="4800000">48</asp:ListItem>
            <asp:ListItem value="4900000">49</asp:ListItem>
            <asp:ListItem value="5000000">50</asp:ListItem>
            <asp:ListItem value="5100000">51</asp:ListItem>
            <asp:ListItem value="5200000">52</asp:ListItem>
            <asp:ListItem value="5300000">53</asp:ListItem>
            <asp:ListItem value="5400000">54</asp:ListItem>
            <asp:ListItem value="5500000">55</asp:ListItem>
            <asp:ListItem value="5600000">56</asp:ListItem>
            <asp:ListItem value="5700000">57</asp:ListItem>
            <asp:ListItem value="5800000">58</asp:ListItem>
            <asp:ListItem value="5900000">59</asp:ListItem>
            <asp:ListItem value="6000000">60</asp:ListItem>
            <asp:ListItem value="6100000">&gt;60</asp:ListItem>
        </asp:DropDownList></td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Currency</td>
      <td style="height: 19px; width: 286px;" class="lable5"><asp:TextBox ID="currency" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px; height: 19px;" class="lable6"> Location</td>
      <td style="height: 19px; width: 286px;" class="lable5"><asp:TextBox ID="txtloc" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 3px"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Condact Person</td>
      <td style="height: 19px; width: 286px;" class="lable5"><asp:TextBox ID="txtcperson" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6">&nbsp;Phone Number</td>
      <td style="height: 19px; width: 286px;" class="lable5"><asp:TextBox ID="txtphno" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> Email Address</td>
      <td style="height: 19px; width: 286px;" class="lable5"><asp:TextBox ID="txtcompmail" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px" onblur='javascript:echeck();'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  colspan="2" height="17" align="center" class="lable5"><asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#000040"
                        Height="19px" Text=" Save" Width="100px" OnClick="btnsubmit_Click" /></td>
    </tr>
  </table>

</td>
</tr>

</table>    
</td>
</tr>   
 
<tr>
<td colspan="1" align="center">
    &nbsp;</td>
 </tr>
 </table>
    
</form>
</body>
</html>
