<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-GalleryEdit.aspx.cs" Inherits="admin_Admin_GalleryEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
	<h1 align="center" style="color:red;font-weight:bold">Edit Gallery Details</h1>   
	
    <table width="80%" align="center" style="background-color:#E8F8F5">
        <tr><td style="width:80%;border:solid 1px #006699" align="center"><table  width="80%" align="center" >
	
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
           
	<tr id="trid" runat="server" visible="false" align="center">    
		<td align="right" style=" width:40%;padding-right:5px;font-weight:bold" >
		Details ID  :
		</td>
		<td align="left" style="padding-left:5px">
       
		<asp:Label ID="lblgid2" runat="server"></asp:Label>
		</td>
	</tr>

	
    <tr id="Tr1" runat="server">
		<td align="right" style=" width:40%;padding-right:5px;font-weight:bold" >
		     Title :
		</td>
		<td align="left" style="padding-left:5px">
        <asp:TextBox ID="txtimgname2" runat="server" Width="240px" Height="25px" BorderColor="Black"  />
		</td>
	</tr>

	<%--<tr>
		<td align="right" style=" width:25%;padding-right:5px;font-weight:bold" >
		  Category :
		</td>
		<%--<td align="left" style="padding-left:5px">
        <asp:TextBox ID="txtactor2" runat="server"  Width="250px" Height="45px"  TextMode="MultiLine" />
		
		</td>--%>
	<%--</tr>--%>    
    <tr id="Tr2" runat="server" visible="false">
		<td align="right" style=" width:25%;padding-right:5px;font-weight:bold" >
		Date  :
		</td>
		<td align="left" style="padding-left:5px">
        <asp:TextBox ID="txtdate2" runat="server" Width="250px" Height="20px" 
                ToolTip="Select Date" />
                <%--<asp:ImageButton ID="imgbtnCalendar" runat="server" ImageUrl="~/Admin/images/CalendarImage.gif" />--%>
		</td>
        <td>
    <%--       <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtdate2" PopupButtonID="imgbtnCalendar" runat="server" />--%>
        </td>
	</tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>

    <tr>
		<td align="right" style=" width:25%;padding-right:5px;font-weight:bold" >  Category :   </td>
        <td align="left" style="padding-left:5px">   
             
      <asp:DropDownList ID="ddl" runat="server" Height="25px" AutoPostBack="true" AppendDataBoundItems="true" Font-Size="20px" Width="150px" OnSelectedIndexChanged="ddl_SelectedIndexChanged1">
                             <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">Multiple Images</asp:ListItem>
                           <asp:ListItem Value="2">Home Images</asp:ListItem>

                                     </asp:DropDownList>
            <asp:RequiredFieldValidator ID="ddlrfv" runat="server" InitialValue="0" ErrorMessage="Select Image type" ControlToValidate="ddl" ForeColor="Red" ValidationGroup="val" />

        </td>
        	</tr>

 <%-- <tr>
      <td align="right" style=" width:25%;padding-right:5px;font-weight:bold">Sub Catagory : </td>
      <td align="left" style="padding-left:5px"><asp:DropDownList ID="ddsub" runat="server" Width="250px" >
    
            </asp:DropDownList></td>   
  </tr>--%>
            
 <tr>
  <td>
  
  <br /></td>
 </tr>


	<tr>    
        <td></td><td><asp:Button ID="btnupdatecontent" runat="server" Text="Update Content" OnClick="btnupdatecontent_Click" ValidationGroup="val"/></td>
        </tr>
         <tr>
  <td>
  
  <br /></td>
 </tr>
            <tr >
    	<td align="right" style=" width:25%;padding-right:5px;font-weight:bold">If u want change Main Image  :</td>
    <td align="left" style="padding-left:5px">  <asp:FileUpload ID="FileUpload1" runat="server" /> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        <asp:Button runat="server" Text="Change Main Image" id="uploadmainimage" OnClick="uploadmainimage_Click"/>  </td>
    </tr>
     <tr>
  <td>
  
  <br /></td>
 </tr>
              <tr>
                  <td runat="server" visible="false" id="displayformore" align="center" colspan="2">
                      <table>
                          <tr>
    	<td align="right" style=" width:35%;padding-right:5px;font-weight:bold">If u want change More Images For This Record  :</td>
    <td align="left" style="padding-left:5px">  <asp:DropDownList runat="server" ID="ddlinnertype" AutoPostBack="true" OnSelectedIndexChanged="ddlinnertype_SelectedIndexChanged">
        <asp:ListItem>Select</asp:ListItem>
        <%--<asp:ListItem>Changed All Images</asp:ListItem>--%>
        <asp:ListItem>Changes In Single Image</asp:ListItem>
                                                </asp:DropDownList></td>
                              </tr>
                          </table>
                      </td>
                 
    </tr> 
             <tr>
                   <td runat="server" visible="false" id="changetomultiple" align="center">
                                <td>
                                <asp:FileUpload ID="FileUpload4"  runat="server" AllowMultiple="true"  /> <br />
                                    <asp:Button ID="Button1" runat="server" Text="Upload for multiple" OnClick="Button1_Click" />
                            </td>                          
                            </td>
                        </tr>
            <tr>
        <td>
            <br />
        </td>
          </tr>
            <tr><td colspan="2" runat="server" visible="false" id="moreimage" align="center">
                <asp:Panel ID="Panel1" runat="server" Width="85%" Height="200px" ScrollBars="Both">
                    <table width="80%"><tr><td>
                     <asp:Label ID="lblchangeallimages" runat="server" Text="You want to change all images please upload multiple  : "></asp:Label>
            
                       <asp:FileUpload ID="FileUpload2" class="multi" runat="server" AllowMultiple="true"  />  <%--AllowMultiple="true"--%>
                        </td>
                        </tr>
                     <tr>
                    <td>
                        <asp:Button ID="btnUpload" runat="server" Text="Multiple_Images_Upload" 
                              onclick="btnUpload_Click"/><br />
                      </td>
                     <td colspan="2" align="center">
                     <asp:Label ID="lblMessage" runat="server" /> 
                     
                     </td></tr>  
                                      
                    </table>
                </asp:Panel>
                     </td>
                </tr>      
                 <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                          
                            <td runat="server" visible="false" id="editsingleimage" align="center">
                                <td>
                                <asp:FileUpload ID="FileUpload3"  runat="server"  /> <br />
                                    <asp:Button ID="btnupload1" runat="server" Text="Upload for single" OnClick="btnupload1_Click" />
                            </td>                          
                            </td>
                        </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr><td colspan="2" runat="server" visible="false" id="singleimage" align="center">

                   <asp:Panel ID="Panel2" runat="server" Width="90%" Height="450px" ScrollBars="Both">
              <asp:DataList ID="ddlgetimages" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" DataKeyField="did" OnItemCommand="ddlgetimages_ItemCommand">
                  <ItemTemplate>
                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagename", "~/photos/gallery/{0}") %>' Width="150px" Height="130px" Style="margin:3px 3px 3px 3px"  CommandName="editsingle" CommandArgument='<%# Eval("did") %>'/>
                  </ItemTemplate>
              </asp:DataList>
          </asp:Panel>
                </td></tr>
    <tr>
        <td align="right">
           
           </td>
           <td align="center">
            <asp:Button ID="btnCancel2" runat="server" Text="Cancel" Height="30px" 
                Width="160px" onclick="btnCancel2_Click" />
        </td>
        
            </tr>
            <tr>
                <td>
                    <br />
                </td>
                </tr>

            </table>
            
            </td></tr>
</table>
    <br />
    
</asp:Content>

