<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommonControl.ascx.cs" Inherits="Usercontrols_CommonControl" %>
<%@ Register Src="~/admin/Usercontrols/Admin_TopMenu.ascx" TagPrefix="uc1" TagName="Admin_TopMenu" %>
<%@ Register Src="~/Usercontrols/Emp_topmenu.ascx" TagPrefix="uc2" TagName="Emp_topmenu" %>
<%@ Register Src="~/Usercontrols/Header1.ascx" TagPrefix="uc1" TagName="Header1" %>



<uc1:Admin_TopMenu runat="server" ID="Admin_TopMenu" />
<uc1:Header1 runat="server" ID="Header1" />

<uc2:Emp_topmenu runat="server" ID="Emp_topmenu" />
