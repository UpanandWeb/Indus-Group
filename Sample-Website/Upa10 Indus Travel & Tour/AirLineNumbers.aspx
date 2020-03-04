<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="AirLineNumbers.aspx.cs" Inherits="AirLineNumbers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Indus Tours &amp; Travels</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/aos.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/full-slider.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="jquery/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!--menu_links-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--menu_links-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section  class="text-justify " id="air-numbers">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="text-count">
                        <img src="./images/air-number-img.jpg"  class="img-fluid">
                    </div>
                    <div class="col-lg-10">
                        <div class="col-lg-2"></div>
                        <div class="row p-5">

                            <br />
                            <br />

                              <br />
                            <br />
                            <h4>Toll Free Number For Airlines :</h4>

                            <asp:TextBox ID="txt" runat="server" placeholder="enter airlines name" Width="300px" Font-Size="20px" Height="50px"></asp:TextBox>&nbsp;&nbsp;  <asp:Button ID="btn" CssClass="btn btn-danger btn-sm text-white" Text="SEARCH" Height="50px" runat="server" OnClick="btn_Click" />
                            <table class="table table-hover text-danger border" width="100%">
                                <tr>
                                    <td>
                                        <asp:GridView ID="gv" Width="100%" runat="server" GridLines="Horizontal" AutoGenerateColumns="false" PageSize="25" HeaderStyle-Font-Size="22px" AllowPaging="true" HeaderStyle-CssClass="bg-success text-white" OnPageIndexChanging="gv_PageIndexChanging">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.no">
                                                    <ItemTemplate>
                                                          <asp:Label ID="lblid" runat="server" Text= '<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Company">
                                                    <ItemTemplate>
                                                          <asp:Label ID="lbname" runat="server" Text= '<%# Eval("name") %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Toll Free number">
                                                    <ItemTemplate>
                                                          <asp:Label ID="lbcont" runat="server" Text= '<%# Eval("mobile") %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </section>

</asp:Content>

