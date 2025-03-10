﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ApogeeHRProjects.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<%--    <body style="background-image:url(Rice3.jpg); background-repeat:no-repeat; background-position:center; background-color:lightgray" >--%>
<body style="background-repeat:no-repeat; background-position:center; background-color:lightgray" >
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
         <div style="width:410px;margin-left:40%;margin-right:40%;margin-top:20%;background-color:green;color:blue; border-radius:5px 6px;text-align:center">
             <h1>
                 <asp:Label ID="lblHeading" runat="server" Text="Label"></asp:Label>
             </h1>
         </div>
    <div style="width:410px;margin-left:40%;margin-right:40%;background-color:green;border-radius:5px 6px">
        <table class="auto-style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp; &nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="RadComboBox1" EmptyMessage="Select Username" Runat="server" DataSourceID="dsUser" DataTextField="UserName" DataValueField="Id">
                    </telerik:RadComboBox>
                    <asp:SqlDataSource ID="dsUser" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [Id], [UserName] FROM [tblLogIn]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtPassword" Runat="server" TextMode="Password" LabelWidth="64px" Resize="None" type="password" Width="160px">
                    </telerik:RadTextBox>
                </td>
                <td>
                    &nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    <telerik:RadButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="LogIn">
                    </telerik:RadButton>
&nbsp;<telerik:RadButton ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset">
                    </telerik:RadButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
