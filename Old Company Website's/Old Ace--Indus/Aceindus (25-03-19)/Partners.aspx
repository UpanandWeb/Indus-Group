<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Partners.aspx.cs" Inherits="Partners" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding:10px;">
        <div class="row">
            <div class="col-sm-9">
           <img src="img/under.jpg" alt="" width="100%" height="">
           	</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
                
            </div>
        </div>
    </div>
</asp:Content>

