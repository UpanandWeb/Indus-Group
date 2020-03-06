<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript" src="_scripts/jquery-1.4.1.min.js"></script>

<script type="text/javascript">

    var i = 1;

    $(document).ready(function () {

        $("#addfile").click(function () {

            $("#dvfiles").append("<input name=" + i + "fu type=file /><br>");

            i++;

        });

    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   




<%--<form id="form1" runat="server" enctype="multipart/form-data">--%>

<div id="dvfiles">

 

</div>

<a href="#" id="addfile">Add file..</a><br />

<asp:Label ID="lblMessage" runat="server"></asp:Label><br />

<asp:Button ID="btnUpload" runat="server" Text="Upload"

        />

<%--</form>--%>
</asp:Content>

