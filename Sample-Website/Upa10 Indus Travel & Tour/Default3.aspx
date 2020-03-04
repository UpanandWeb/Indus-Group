<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=50);
            opacity: 0.7;
            z-index:999999999!important;
        }
        .pnlBackGround
        {
            position: fixed;
            top: 10%;
            left: 10px;
            width: 600px;
            height: 125px;
            text-align: center;
            background-color: #fff;
            border: solid 3px black;
            padding: 15px;
    border-bottom: 1px solid #e5e5e5;
    
       
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="true">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    View Details
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("cid")%>'
                        OnClick="ViewDetails" Text="View Details" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="location" HeaderText="ID" />
            <asp:BoundField DataField="designation" HeaderText="Name" />
        </Columns>
    </asp:GridView>
    <asp:Panel ID="pnlGridViewDetails" runat="server" Width="600px" Height="500px" Style="display: none;"
        CssClass="pnlBackGround">
        <%--Add other controls here--%>
        <table >
            
            <tr>
                <td>
                    <h2 style="color:
#c4115c;">Job Description</h2>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="Details"></asp:Label>
        <asp:Button ID="btnclose" runat="server" Text="Close" OnClick="btnclose_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger">Apply</button>
      </div>
                </td>
            </tr>

        </table>

       
    </asp:Panel>
    <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground" />

</asp:Content>

