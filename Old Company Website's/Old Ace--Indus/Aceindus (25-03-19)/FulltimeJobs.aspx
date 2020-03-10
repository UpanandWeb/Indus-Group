<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FulltimeJobs.aspx.cs" Inherits="FulltimeJobs" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="padding: 10px;">
        <div class="row">
            <div class="col-lg-9">
                <h3>Company Overview :
                </h3>

                <div align="justify">
                    Aceindus understands that corporate success is determined by the quality of its people.
                         We are always looking for employees who strive for excellence and will not settle for anything less than 
                        talented, dedicated, responsive, and effective individuals. If you know that you can be an exceptional employee
                         in the delivery of information technologies, please send us your resume as soon as possible.

                </div>
                <br />

                <font class="crentopenings">We are currently looking for candidates to fill the following positions: </font>
                <br />

                <table width="100%" style="margin-left: 0px">
                    <tr>
                        <td>
                            <asp:DataList ID="DataList1" runat="server" Width="100%">
                                <ItemTemplate>
                                   
                                            <table class="data" width="100%">
                                                <tr>
                                                    <td width="100%" valign="top" colspan="2">
                                                        <table width="100%" align="left" class="data">
                                                            <tr>
                                                                <td width="100%" align="left" colspan="2">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <span class="datanew">Job Title</span>
                                                                            </td>
                                                                            <td width="1%" class="datanew">:
                                                                            </td>
                                                                            <td width="83%" class="data" style="color: Red">
                                                                                <asp:Literal ID="ltCategory" runat="server" Text='<%#Eval("JobTitle")%>'></asp:Literal>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" align="left" colspan="2">
                                                                    <table width="100%" class="data">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <span class="datanew">Reqd.Qual.</span>
                                                                            </td>
                                                                            <td width="1%" class="datanew">:
                                                                            </td>
                                                                            <td width="83%" class="data">
                                                                                <asp:Literal ID="Literal5" runat="server" Text='<%#Eval("Qualification")%>'></asp:Literal>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" align="left" colspan="2">
                                                                    <table width="100%" class="data">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <span class="datanew">Reqd. Skills</span>
                                                                            </td>
                                                                            <td width="1%" class="datanew">:
                                                                            </td>
                                                                            <td width="83%" class="data">
                                                                                <asp:Literal ID="Literal6" runat="server" Text='<%#Eval("Skills")%>'></asp:Literal>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" align="left" colspan="2">
                                                                    <table width="100%" class="data">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <span class="datanew">Location</span>
                                                                            </td>
                                                                            <td width="1%" class="datanew">:
                                                                            </td>
                                                                            <td width="83%" class="data">
                                                                                <asp:Literal ID="Literal7" runat="server" Text='<%#Eval("Location")%>'></asp:Literal>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" align="left" colspan="2">
                                                                    <table width="100%" class="data">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <span class="datanew">Job Description</span>
                                                                            </td>
                                                                            <td width="1%" class="datanew">:
                                                                            </td>
                                                                            <td width="83%" class="data">
                                                                                <asp:Literal ID="Literal2" runat="server" Text='<%#Eval("opento")%>'></asp:Literal>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr height="10">
                                                                <td colspan="2">&nbsp;
                                                                </td>
                                                            </tr>
                                                            <hr />
                                                        </table>
                                                    </td>
                                                </tr>
                                                </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table border="0" style="background-color: #D5E6F9; width: 5%; height: 22px;"
                                align="center">
                                <tr>
                                    <td align="center">
                                    </td>
                                    <td align="center">
                                        <asp:LinkButton ID="lnkbtnPrevious" runat="server" OnClick="lnkbtnPrevious_Click1"
                                            Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#00BFFF"
                                            bgcolor="#125CAF">Previous</asp:LinkButton>
                                    </td>
                                    <td align="center">
                                        <asp:DataList ID="dlPaging" runat="server" OnItemDataBound="dlPaging_ItemDataBound"
                                            RepeatDirection="Horizontal" ForeColor="#996633"
                                            OnSelectedIndexChanged="dlPaging_SelectedIndexChanged">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                                    CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %>'>LinkButton</asp:LinkButton>&nbsp;
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                    <td align="left">
                                        <asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="lnkbtnNext_Click1" Font-Bold="True"
                                            Font-Size="Medium" Font-Underline="False" ForeColor="#00BFFF" bgcolor="#125CAF">Next</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="col-lg-3">
                <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>



