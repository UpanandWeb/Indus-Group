<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="timecal1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<meta http-equiv="refresh" content="60" />--%>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#txtsdate").datepicker({
                defaultDate: "+1w", dateFormat: 'dd-mm-yy',
                changeMonth: true,
                onClose: function (selectedDate) {
                    $("#txtedate").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#txtedate").datepicker({
                defaultDate: "+1w", dateFormat: 'dd-mm-yy',
                changeMonth: true,
                onClose: function (selectedDate) {
                    $("#txtsdate").datepicker("option", "maxDate", selectedDate);
                }

            });
        })
     
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
            <br />
            <br />
            <asp:LinkButton runat="server" ID="btnoption" Text="Leave Option" OnClick="btnoption_Click"></asp:LinkButton>
            <asp:Label runat="server" ID="lblleavetype" Text="Leave Type:" Visible="false"></asp:Label>
             <asp:DropDownList ID="ddl" runat="server" Visible="false" OnSelectedIndexChanged="ddl_SelectedIndexChanged" AutoPostBack="true">
                  <asp:ListItem Value="">Please Select</asp:ListItem>  
            <asp:ListItem Value="1">Leave </asp:ListItem>  
            <asp:ListItem Value="2">Holiday</asp:ListItem>  
            <asp:ListItem Value="3">Saturday</asp:ListItem>  
            <asp:ListItem Value="4">Sunday</asp:ListItem>  
            </asp:DropDownList><br /><br /><br />
            <asp:Label ID="lblsdate" runat="server" Text="Start Date:" Visible="false"></asp:Label>
            <asp:TextBox ID="txtsdate" runat="server" Visible="false" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:Label ID="lbledate" runat="server" Text="End Date:" Visible="false"></asp:Label> 
            <asp:TextBox ID="txtedate" runat="server" Visible="false" AutoCompleteType="Disabled"></asp:TextBox>
       <asp:Button runat="server" ID="btnoptionsave" Text="Save" OnClick="btnoptionsave_Click" Visible="false" />
             <asp:Button runat="server" ID="btncancel" Text="Cancel" OnClick="btncancel_Click" Visible="false" />
            
            
           <asp:Panel runat="server" ID ="pnl">
             <h2>Create Time Sheet</h2> 
        InDate:
            <asp:TextBox ID="indate" runat="server" BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox>
           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red"
                ControlToValidate="indate" ValidationGroup="check" ErrorMessage="Date format in DD/MM/YYYY"
                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$" 
                SetFocusOnError="true">*</asp:RegularExpressionValidator>--%>
           
        InTime:
            <asp:TextBox ID="intime" runat="server" BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px" ></asp:TextBox>
           <%-- <asp:RegularExpressionValidator
                ID="regextxtSessionTime" runat="server" ForeColor="Red"
                ControlToValidate="intime"
                ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"
                ErrorMessage="Time Format in HH:MM"
                Display="Dynamic"
                SetFocusOnError="true">
            </asp:RegularExpressionValidator>--%>
           
             <asp:Button runat="server" ID="btnin" Text="Save" OnClick="btnin_Click" /><br /><br />
            <asp:Label ID="llo" runat="server" Text="LunchOut:" Visible="false"></asp:Label>
            <asp:TextBox ID="outlunch" runat="server" Visible="false"  BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox>
           <%-- <asp:RegularExpressionValidator
                ID="RegularExpressionValidator2" runat="server" ForeColor="Red"
                ControlToValidate="outlunch"
                ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"
                ErrorMessage="Time Format in HH:MM"
                Display="Dynamic"
                SetFocusOnError="true">
            </asp:RegularExpressionValidator>--%>
            <asp:Button runat="server" ID="btnlo" Text="Save" OnClick="btnlo_Click" Visible="false"/>
          <asp:Label runat="server" ID="lli" Text="LunchIn:" Visible="false"></asp:Label>
            <asp:TextBox ID="inlunch" runat="server" Visible="false" BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox>
            <%--<asp:RegularExpressionValidator
                ID="RegularExpressionValidator5" runat="server" ForeColor="Red"
                ControlToValidate="inlunch"
                ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"
                ErrorMessage="Time Format in HH:MM"
                Display="Dynamic"
                SetFocusOnError="true">
            </asp:RegularExpressionValidator>--%>
            <asp:Button runat="server" ID="btnli" Text="Save" OnClick="btnli_Click" Visible="false"/>
            
    <br />
            <br />
             <asp:Label runat="server" ID="lwo" Text="OutDate:" Visible="false"></asp:Label>
            <asp:TextBox ID="outdate" runat="server" Visible="false" BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox>
           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" 
                ControlToValidate="outdate" ValidationGroup="check" ErrorMessage="Date format in DD/MM/YYYY"
                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$" 
                SetFocusOnError="true"></asp:RegularExpressionValidator>--%>
             <asp:Label runat="server" ID="lot" Text="OutTime:" Visible="false"></asp:Label>
            <asp:TextBox ID="outtime" runat="server"  Visible="false"  BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox>
           <%-- <asp:RegularExpressionValidator
                ID="RegularExpressionValidator3" runat="server" ForeColor="Red"
                ControlToValidate="outtime"
                ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"
                ErrorMessage="Time Format in HH:MM"
                Display="Dynamic"
                SetFocusOnError="true">
            </asp:RegularExpressionValidator><br />--%>
            <br />
            
            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" Visible="false"/><br />
           
        <br />
               <asp:Label runat="server" ID="llh" Text="LunchHour:" Visible="false"></asp:Label>
            <asp:TextBox ID="tlt" runat="server" Visible="false" BackColor="Silver" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox><br /><br />
          <asp:Label runat="server" ID="lwh" Text="WorkHour:" Visible="false"></asp:Label>
            <asp:TextBox ID="worktime" runat="server" Visible="false" BackColor="Gainsboro" ReadOnly="true" AutoPostBack="true" Height="20px"></asp:TextBox>
            
      
</asp:Panel>
         <asp:GridView runat="server" id="gdv" AutoGenerateColumns="false" >
             <Columns>
    <asp:BoundField DataField="Work Date" HeaderText="Work Date" ItemStyle-Width="130" />
    <asp:BoundField DataField="Work In" HeaderText="Work In" ItemStyle-Width="130" />
                 <asp:BoundField DataField="Lunch Out" HeaderText="Lunch Out" ItemStyle-Width="130" />
                 <asp:BoundField DataField="Lunch In" HeaderText="Lunch In" ItemStyle-Width="130" />
                 <asp:BoundField DataField="Lunch Hours" HeaderText="Lunch Hours" ItemStyle-Width="130" />
                 <asp:BoundField DataField="Work Out" HeaderText="Work Out" ItemStyle-Width="130" />
                 <asp:BoundField DataField="Total Hours" HeaderText="Total Hours" ItemStyle-Width="130" />
                 <asp:BoundField DataField="Leave" HeaderText="Leave" ItemStyle-Width="130" />
</Columns>
         </asp:GridView>
              </div>
    </form>
</body>
</html>
