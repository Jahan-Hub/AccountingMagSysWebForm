﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptCustomer.aspx.cs" Inherits="SalesMS.Forms.rptCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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
         <h1>Customer</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Report Formats"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" Runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="cmReportFormat_SelectedIndexChanged">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Customer (Excel Aid)" Value="Customer (Excel Aid)" />
                            <telerik:RadComboBoxItem runat="server" Text="Customer" Value="Customer" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCommon" Runat="server" Filter="Contains" EnableLoadOnDemand="true" EmptyMessage="Select A Customer" OnItemsRequested="cmCommon_ItemsRequested" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="cmCommon_SelectedIndexChanged" Enabled="False">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <telerik:RadButton ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label17" runat="server" ForeColor="Blue" Text="Report Format"></asp:Label></td>
                <td>
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" />
                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False"/>
                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue" Visible="False"/>
                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" Checked="True" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    <div>
    
        <asp:Label ID="lblMessage" runat="server" ForeColor="#990033"></asp:Label>
    
    </div>
    </form>
</body>
</html>
