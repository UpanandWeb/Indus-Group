<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="University-Details.aspx.cs" Inherits="University_Details" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <%--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />

    <style>
        b,
        h3 {
            color: darkblue;
        }

        b {
            font-family: 'Lato', sans-serif;
            font-weight: bold;
        }

        p {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px
        }

        .col-sm-9 ul li {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            padding: 5px 0;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
      <div style="padding:10px;" >
        <div class="row">
            <div class="col-sm-7">
                <h3 style="text-align:center;">
                    University Details of  <asp:Label ID="lblcont" runat="server" Font-Size="26px"></asp:Label>
                </h3>
                   <br />
                <table width="100%" align="center"> 
                    <tr>
                        <td width="100%" align="center" style="padding-left:20px;">
                 <asp:DataList ID="dtl" runat="server" width="100%" align="center"  >
                        <ItemTemplate>
                            <table width="90%" align="center">
                            <tr>
                                <td width="20%"></td>
                                <td width="80%" align="left">
                                       <asp:HyperLink ID="lbl1" runat="server"  Text='<%# Eval("uname") %>' 
                                               NavigateUrl='<%# Eval("Website") %>'   target="_blank"  Font-Size="18px"></asp:HyperLink>
                                </td>
                            </tr>
                                <tr><td><br /></td></tr>
                        </table>
                        </ItemTemplate>
                    </asp:DataList>

                        </td>
                    </tr>
                </table>
            </div>
           
    <div class="col-sm-5" style="padding-right:250px;">
                   <uc1:Right runat="server" ID="Right" />
           </div>
        </div>

        </div>
</asp:Content>

