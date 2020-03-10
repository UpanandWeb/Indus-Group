<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddModifyDelete.ascx.cs" Inherits="Usercontrols_AddModifyDelete" %>

<table border="0" 
            cellspacing="0" cellpadding="0" style="height: 28px; width: 100%">
              
              <tr>
                <td>
                <table border="0" cellspacing="2" cellpadding="2">
                  <tr>
                    <td>&nbsp;</td>
                    <td  id="tdnew" runat="server">
                        <asp:ImageButton ID="ibtnNew" runat="server" ImageUrl="~/images/i16.jpg" 
                             ToolTip="New" onclick="ibtnNew_Click"  /><%--OnClick="ibtnNew_Click"--%>
                    </td><td>&nbsp;</td>
                    <td id="tdview" runat="server">
                        <asp:ImageButton ID="ibtnPreview" runat="server" ImageUrl="~/images/pirc.GIF"
                            ToolTip="Preview" Height="19px" 
                            onclick="ibtnPreview_Click" /><%-- OnClick="ibtnPreview_Click"--%>
                    </td><td>&nbsp;</td>
                    <td  id="tdedit" runat="server">
                    <asp:ImageButton ID="editbtn" runat="server" ImageUrl="~/images/i18.jpg" 
                             ToolTip="Edit"    /><%--Onclick="btnedit_Click"--%>
                             
                    </td><td>&nbsp;</td>
                    <td  id="tddel" runat="server">
                        <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/images/i21.jpg" 
                             ToolTip="Delete" /><%--OnClick="ibtnDelete_Click"--%>
                    </td><td>&nbsp;</td>
                    <td id="tdmail" runat="server">
                    <asp:ImageButton ID="mailbtn" runat="server" ImageUrl="~/images/i29.jpg" 
                            ToolTip="Mail"  style="width: 16px" onclick="mailbtn_Click" /><%--OnClick="mailbtn_Click"--%>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table>