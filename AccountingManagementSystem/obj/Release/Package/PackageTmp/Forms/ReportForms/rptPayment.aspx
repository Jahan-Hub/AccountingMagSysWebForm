﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptPayment.aspx.cs" Inherits="SalesMS.Forms.ReportForms.rptPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
    </style>
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
        <h1>Payment</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Report Formats"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" Runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="cmReportFormat_SelectedIndexChanged">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Payment(Excel Aid)" Value="Payment(Excel Aid)" />
                            <telerik:RadComboBoxItem runat="server" Text="Payment" Value="Payment" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Supplier Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCommon" Runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Supplier" OnItemsRequested="cmCommon_ItemsRequested" Filter="Contains" Height="500px" DropDownAutoWidth="Enabled" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="cmCommon_SelectedIndexChanged">
                        <HeaderTemplate>
                            <table style="width: 450px">
                                <tr>
                                    <td style="font-family: Arial; font-size: 12px; width: 100px;">Code</td>
                                    <td style="font-family: Arial; font-size: 12px; width: 250px;">Name</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 450px">
                                <tr>
                                    <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['SupplierId']")%></td>
                                    <td style="width: 250px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblStartDate" runat="server" Text="Date Options"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="dpStartDate" Runat="server">
                    </telerik:RadDatePicker>
                    <telerik:RadDatePicker ID="dpEndDate" Runat="server">
                    </telerik:RadDatePicker>
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
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue"/>
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