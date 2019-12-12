<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Vendors.aspx.cs" Inherits="Admin_Vendor" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Vendor</title>
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
        function alertedit() {
            alert("Vendor Details has been edited Successfully");
        }
        function alertdelete() {
            alert("Vendor Details has been deleted Successfully");
        }
    </script>

    <style type="text/css">
    </style>

    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <style type="text/css">
        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            font-size: 25px;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }

        .GVPager {
            /*width: 1500px;*/
            border-right-style: solid;
            position: absolute;
            height: 35px;
            font-size: 25px;
            text-align: center;
            border-right-color: navy;
        }
    </style>

    <script type="text/javascript">
        function Check_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //If checked change color to Aqua
                row.style.backgroundColor = "aqua";
            }
            else {
                row.style.backgroundColor = "white";
            }
            //else {
            //    //If not checked change back to original color
            //    if (row.rowIndex % 2 == 0) {
            //        //Alternating Row Color
            //        row.style.backgroundColor = "#C2D69B";
            //    }
            //    else {
            //        row.style.backgroundColor = "white";
            //    }
            //}

            //Get the reference of GridView
            var GridView = row.parentNode;

            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];

                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }

        function CheckGridList() {
            var count = 0;
            for (i = 0; i < document.forms[0].elements.length; i++) {
                if ((document.forms[0].elements[i].type == 'checkbox') &&
                    (document.forms[0].elements[i].name.indexOf('CheckBox1') > -1)) {
                    if (document.forms[0].elements[i].checked == true) {
                        count++;
                        if (count > 1) {
                            document.forms[0].elements[i].checked = false;
                            break;
                        }
                    }
                }
            }
            if (count > 1) {
                alert('Please select only one checkbox from grid');
                var row = objRef.parentNode.parentNode;
                row.style.backgroundColor = "white";
                return false;
            }
            else { return true; }
        }
    </script>


    <%-- <script type = "text/javascript">
        function MouseEvents(objRef, evt) {
            var checkbox = objRef.getElementsByTagName("input")[0];
            if (evt.type == "mouseover") {
                objRef.style.backgroundColor = "orange";
            }
            //else {
            //    if (checkbox.checked) {
            //        objRef.style.backgroundColor = "aqua";
            //    }
            //    else if (evt.type == "mouseout") {
            //        if (objRef.rowIndex % 2 == 0) {
            //            //Alternating Row Color
            //            objRef.style.backgroundColor = "#C2D69B";
            //        }
            //        else {
            //            objRef.style.backgroundColor = "white";
            //        }
            //    }
            //}
        }
</script>--%>


    <%--  <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $('#<%=MyGrid.ClientID %>').find('input:checkbox[id$="CheckBox1"]').click(function () {
            var isChecked = $(this).prop("checked");
            var $selectedRow = $(this).parent("td").parent("tr");
            var selectedIndex = $selectedRow[0].rowIndex;
            var sColor = '';

            if (selectedIndex % 2 == 0) {
                row.style.backgroundColor = "aqua";

                //sColor = 'PaleGoldenrod';
            }
            else
                sColor = 'LightGoldenrodYellow';

            if (isChecked)
                $selectedRow.css({
                    "background-color": "DarkSlateBlue",
                    "color": "GhostWhite"
                });
            else
                $selectedRow.css({
                    "background-color": sColor,
                    "color": "black"
                });
        });
    });
    </script>--%>

    <%--  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        // Header Checkbox click function
        //$('[id$=chkHeader]').click(function () {
        //    if ($('[id$=chkHeader]:checked').length > 0) {
        //        $('[id$=chkChild]').parent().parent().addClass('highlightRow');
        //    }
        //    else {
        //        $('[id$=chkChild]').parent().parent().removeClass('highlightRow');
        //    }
        //    $("[id$=chkChild]").attr('checked', this.checked);
        //});

        // Child Checkbox click function
        $("[id$=CheckBox1]").click(function () {
            if (this.checked) {
                $(this).parent().parent().addClass('highlightRow');
            }
            else {
                $(this).parent().parent().removeClass('highlightRow');
            }

            if ($('[id$=CheckBox1]').length == $('[id$=CheckBox1]:checked').length) {
                $('[id$=chkHeader]').attr("checked", "checked");
            }
            else {
                $('[id$=chkHeader]').removeAttr("checked");
            }
        });
    });
</script>
<style type="text/css">
.highlightRow
{
background-color:Green;
Color:White;
}
</style>--%>


    <%--    <script language="javascript">
        function Highlight(chk) {
            if (chk.checked) {
                $("#" + chk.id).parent("td").parent("tr").css("background-color", "Red");
            } else {
                $("#" + chk.id).parent("td").parent("tr").css("background-color", "white");
            }
        }
</script>--%>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#MyGrid').find('input:checkbox[id$="CheckBox1"]').click(function () {
                var isChecked = $(this).prop("checked");
                var $selectedRow = $(this).parent("td").parent("tr");
                var selectedIndex = $selectedRow[0].rowIndex;
                var sColor = '';

                if (selectedIndex % 2 == 0)
                    sColor = 'PaleGoldenrod';
                else
                    sColor = 'LightGoldenrodYellow';

                if (isChecked) {
                    $selectedRow.css({
                        "background-color": "DarkSlateBlue",
                        "color": "GhostWhite"
                    });
                }
                else {
                    $selectedRow.css({
                        "background-color": sColor,
                        "color": "black"
                    });
                }
            });
        });
    </script>
</head>


<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD" oncontextmenu="return false;" onselectstart="return false">
    <form id="form1" runat="server">
        <%--           <asp:textbox id="TextBoxCopysss" runat="server" onmousedown="DisableRightClick(event)" Visible="false">  </asp:textbox>
        <asp:textbox id="TextBox2sssss" runat="server" onkeydown="return DisableCtrlKey(event)" Visible="false">   </asp:textbox>--%>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='1500px' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td align="center" valign="top" width="1500px" class="lable">
                    <table>
                         <tr>
                    <td align="center" width="100%" colspan="3">
                        <font color='#003399' size='6pt'><b>Vendor List</b></font>
                    </td>
                </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                            </td>
                        </tr>

                        <tr>
                          <%--  <td>
                                <asp:Label ID="lbltitle" runat="server" Text="Vendors List" Font-Bold="true" Font-Size="22px"></asp:Label>&nbsp;&nbsp;&nbsp;
                            </td>--%>
                             <td width="30%" align="left">
                                    <asp:TextBox ID="txtsrchven" runat="server" Font-Size="16px" Width="200px" Height="30px"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                               
                                    <asp:Button ID="btnVendor" runat="server" Text="Search" OnClick="btnVendor_Click"  Font-Size="16px" />
                                </td>
                            <td style="font-size: 22px;" width="40%" align="center">
                                <asp:LinkButton ID="LinkButton" runat="server" Text="A" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="B" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" Text="C" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" runat="server" Text="D" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                <asp:LinkButton ID="LinkButton4" runat="server" Text="E" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton5" runat="server" Text="F" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton6" runat="server" Text="G" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton7" runat="server" Text="H" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton8" runat="server" Text="I" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton9" runat="server" Text="J" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                <asp:LinkButton ID="LinkButton10" runat="server" Text="K" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton11" runat="server" Text="L" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton12" runat="server" Text="M" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton13" runat="server" Text="N" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton14" runat="server" Text="O" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                <asp:LinkButton ID="LinkButton15" runat="server" Text="P" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton16" runat="server" Text="Q" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton17" runat="server" Text="R" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton18" runat="server" Text="S" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton19" runat="server" Text="T" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton20" runat="server" Text="U" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton21" runat="server" Text="V" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                <asp:LinkButton ID="LinkButton22" runat="server" Text="W" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton23" runat="server" Text="X" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton24" runat="server" Text="Y" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton25" runat="server" Text="Z" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>&nbsp;&nbsp;&nbsp;

                            </td>
                            <td width="30%" align="center">
                                <asp:LinkButton ID="create" runat="server" Text="Create New Vendor" Font-Bold="true" Font-Underline="false" PostBackUrl="Admin_Createvendor.aspx" Font-Size="22px"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                    <hr />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" width="90%" class="lable" colspan="3">
                    <%--<div style="height: auto; width: 1500px; overflow: auto;">--%>
                    <div>

                        <asp:GridView ID="MyGrid" runat="server" Width="90%" DataKeyNames="vid"
                            AutoGenerateColumns="False" BorderColor="#CCCCCC"
                            BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                            Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"
                            Font-Underline="False" BackColor="White"
                            PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound"
                            OnPageIndexChanging="MyGrid_PageIndexChanging"
                            AllowPaging="true" PageSize="25" PagerSettings-Mode="Numeric">
                            <%--<SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />--%>

                            <Columns>

                                <%--  <asp:TemplateField HeaderText="Select" >--%>
                                <%--  <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EditItemTemplate><%--Check_Click(this)--%>
                                <%--<ItemTemplate>
                                         <asp:CheckBox ID="CheckBox1" runat="server"  onclick ="CheckGridList()" Width="20px"  />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <%--"--%>
                                <%--         <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex %>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                    <HeaderStyle Width="5%" />
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                        <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("vid") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="300px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%--<%#  DataBinder.Eval(Container.DataItem, "Firm_Name")%>--%>
                                        <asp:LinkButton ID="lbl1" runat="server" Text='<%# Eval("Firm_Name") %>' Font-Size="17px" Width="200px" CommandName="ss" CommandArgument='<%# Eval("vid") %>' OnCommand="lbl1_Command"></asp:LinkButton>
                                        <span class="glyphicon glyphicon-pencil" style="vertical-align: top;"></span>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Contact Person" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="180px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%--<%#  DataBinder.Eval(Container.DataItem, "name")%>--%>
                                        <asp:Label ID="lbl333" runat="server" Text='<%# Eval("name") %>' Font-Size="17px" Width="180px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Designation" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="17px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%--<%#  DataBinder.Eval(Container.DataItem, "title")%>--%>
                                        <asp:Label ID="lbl3333" runat="server" Text='<%# Eval("title") %>' Font-Size="17px" Width="60px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="17px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="150px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%--<%#  DataBinder.Eval(Container.DataItem, "venmail")%>--%>
                                        <asp:Label ID="lbl33331" runat="server" Text='<%# Eval("venmail") %>' Font-Size="17px" Width="320px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <%-- <asp:TemplateField HeaderText="Company Website" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="150px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>

                                        <asp:Label ID="lbl333dd" runat="server" Text='<%# Eval("website") %>' Font-Size="18px" Width="220px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%-- <asp:TemplateField HeaderText="Tax ID" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="150px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl3t33" runat="server" Text='<%# Eval("taxid") %>' Font-Size="18px" Width="100px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="Mobile" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl333m" runat="server" Text='<%# Eval("mobile") %>' Font-Size="17px" Width="120px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText="Work" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl333wm" runat="server" Text='<%# Eval("work") %>' Font-Size="18px" Width="120px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%--  <asp:TemplateField HeaderText="Direct" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl333mfsqw" runat="server" Text='<%# Eval("direct") %>' Font-Size="18px" Width="120px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%--                                <asp:TemplateField HeaderText="Fax" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl333mf" runat="server" Text='<%# Eval("fax") %>' Font-Size="18px" Width="120px"></asp:Label>

                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%--      <asp:TemplateField HeaderText="Address" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="400px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl2s" runat="server" Text='<%# Eval("address").ToString() + Eval("city").ToString() + "," + Eval("state").ToString() + "," + Eval("country").ToString() + "," + Eval("zip").ToString()  %>' Font-Size="18px" Width="500px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%--                  <asp:TemplateField HeaderText="City" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "city")%>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>
                                <%--      <asp:TemplateField HeaderText="State" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "state")%>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>
                                <%--   <asp:TemplateField HeaderText="Zip Code" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "zip")%>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "country")%>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%-- <asp:TemplateField HeaderText="Headquarters" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl333mss" runat="server" Text='<%# Eval("headquarter") %>' Font-Size="18px" Width="150px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="President/Principal Owner" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "ppowner")%>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <%--         <asp:TemplateField HeaderText="Type" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl333mssc" runat="server" Text='<%# Eval("check") %>' Font-Size="18px" Width="150px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Current Customers" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "lcurrentpurchase")%>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>--%>

                                <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="18px" Font-Names="arial" VerticalAlign="Middle" Width="6%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkactivate" runat="server" ForeColor="Green" CommandArgument='<%# Eval("vid") %>' OnCommand="lnkactivate" Width="80px"></asp:LinkButton>
                                        &nbsp; 
                                 <br />
                                    </ItemTemplate>
                                    <ItemStyle Width="8%"></ItemStyle>
                                </asp:TemplateField>


                                <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtneditc" Width='30' Height='30' runat="server" ImageUrl="images/preview.png" OnClick="lnkviewrecord" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtneditb" Width='30' Height='30' runat="server" ImageUrl="images/edit.gif" OnClick="lnkviewrecord1" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtndela" Width='30' Height='30' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" OnClientClick="return confirm('Are you sure to delete this record?');" />
                                        <br />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                            <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                Font-Strikeout="False" Font-Underline="False" />
                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                Font-Bold="True" Font-Italic="True" Font-Size="X-Large" 
                                Font-Underline="False" />
                            <%--CssClass = "GridPager"--%> <%--CssClass="GVPager"--%>
                            <%--<PagerSettings Mode="NextPrevious"  NextPageText="Next" PreviousPageText="Previous" />--%>
                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                ForeColor="#00277a" Height="30px" />

                        </asp:GridView>
                    </div>

                </td>
            </tr>
            <%--   <tr>
                <td align="center" runat="server" id="letter1">
                  <asp:LinkButton ID="lnkprev" runat="server" Text="Previous" Font-Bold="true" OnClick="lnkprev_Click" Font-Size="19px"></asp:LinkButton> &nbsp;&nbsp;
                  <asp:LinkButton ID="lnknxt" runat="server" Text="Next"  Font-Bold="true" OnClick="lnknxt_Click" Font-Size="19px" CausesValidation="true"></asp:LinkButton>
                </td>
            </tr>--%>
            <%--<tr runat="server" id="serletter">
                <td align="center">
                  <asp:LinkButton ID="lnkprev1" runat="server" Text="Previous" Font-Bold="true" OnClick="lnkprev_Click1" Font-Size="19px"></asp:LinkButton> &nbsp;&nbsp;
                  <asp:LinkButton ID="lnknxt1" runat="server" Text="Next"  Font-Bold="true" OnClick="lnknxt_Click1" Font-Size="19px" CausesValidation="true"></asp:LinkButton>
                </td>
            </tr>--%>
        </table>

        <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
        <br />
        <br />
        <script type="text/javascript">
            function changeColor(CheckBoxObj) {
                if (CheckBoxObj.checked == true) {

                    CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
                }
                else {
                    CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
                }
            }
        </script>
    </form>
</body>
</html>
