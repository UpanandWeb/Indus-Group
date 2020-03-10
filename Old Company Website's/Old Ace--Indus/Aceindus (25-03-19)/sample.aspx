<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sample.aspx.cs" Inherits="sample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView runat="server" ID="gvrecords"  AutoGenerateColumns="false" 
        HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="White" DataKeyNames="UserId"> 
            <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <a href ='<%#"UpdateGridviewvalues.aspx?UserId="+DataBinder.Eval(Container.DataItem,"UserId") %>'> <%#Eval("UserName") %>  </a>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            
            </Columns>
        </asp:GridView>
</div>

    </form>
</body>
</html>
