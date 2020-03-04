<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Career.aspx.cs" Inherits="Career" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .hr {
            text-align: center;
            font-size: 20px;
            background-color: #2d5577;
            color: deepskyblue;
        }

        .td {
            padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #fff;
        }
    </style>





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
    <script type="text/javascript" src="js/jquery-1.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <section  class="text-justify" id="background3">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="text-count">
                        <img src="./images/career.jpg"  class="img-fluid">
                        <p><span class="usa-name">CARRER</span></p>

                    </div>
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-1"></div>
                          <div class="col-lg-10">
                              <div class="table-responsive">
                              <table class="table total-table">
                                 
                                  <tr>
                                  


                                      <asp:GridView DataKeyNames="cid" ID="gv" Width="100%" HeaderStyle-Height="40px" RowStyle-CssClass="td" HeaderStyle-HorizontalAlign="Center" runat="server" HeaderStyle-CssClass="hr" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" >
                                          <Columns>
                                              <asp:TemplateField HeaderText="Designation">
                                                  <ItemTemplate>
                                                        <asp:Label ID="lb" runat="server" Text='<%#Eval("designation") %>'></asp:Label>
                                                  </ItemTemplate>
                                                     
                                              </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Job Type">
                                                        <ItemTemplate>
                                                              <asp:Label ID="Label1" runat="server" Text='<%#Eval("jobtype") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        
                                            </asp:TemplateField> 
                                              <asp:TemplateField HeaderText="Experience">
                                                 <ItemTemplate >
                                                       <asp:Label ID="Label2" runat="server" Text='<%#Eval("experience") %>'></asp:Label>
                                                 </ItemTemplate>
                                              </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Location">
                                                 <ItemTemplate >
                                                       <asp:Label ID="Label3" runat="server" Text='<%#Eval("location") %>'></asp:Label>
                                                 </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Application">
                                                  <ItemTemplate>
                                                          <asp:LinkButton ID="btn" runat="server"  Text="View" CommandArgument='<%#Eval("cid") %>'  OnClick="ViewDetails" />

                                                           <asp:LinkButton ID="lnk" runat="server" CssClass="btn btn-danger btn-sm text-white" OnClick="lnk_Click"  CommandArgument='<%#Eval("cid") %>'>Apply</asp:LinkButton>

                                                  </ItemTemplate>
                                              </asp:TemplateField>
                                          </Columns>
                                      </asp:GridView>


                                      
   

                                  </tr>
                               
                                  
                                  <tr>
                                      <td>
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
        <asp:Button ID="btnclose" runat="server" Text="Close" OnClick="btnclose_Click" ForeColor="Black" />
                </td>
            </tr>
          

        </table>

       
    </asp:Panel>
                                           <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground" />
                                      </td>
                                  </tr>
                              </table>
                              </div>
                          </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    

    <%--<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info text-dark">
        <h3>Job Description	</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span class="bg-teal text-danger" aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ol>
                      <li style="list-style:none;">
                          <asp:Label ID="desc" runat="server" Text='<%#Eval("desp") %>'></asp:Label>
                      </li>
                    </ol>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger">Apply</button>
      </div>
    </div>
  </div>
</div>--%>
</asp:Content>

