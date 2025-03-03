<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptTransactionEntry.aspx.cs" Inherits="AccountingManagementSystem.Forms.ReportForms.rptTransactionEntry" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style7 {
            width: 176px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <h1>Transaction Entry Reports</h1>
        <div>
            <table style="width: 40%">
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label24" runat="server" Text="Voucher Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmVoucherType" runat="server" Width="100%" EmptyMessage="Select">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="CP" Value="CP" />
                                <telerik:RadComboBoxItem runat="server" Text="BP" Value="BP" />
                                <telerik:RadComboBoxItem runat="server" Text="CR" Value="CR" />
                                <telerik:RadComboBoxItem runat="server" Text="BR" Value="BR" />
                                <telerik:RadComboBoxItem runat="server" Text="JV" Value="JV" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label25" runat="server" Text="Report Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmReportType" runat="server" Width="100%">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Trial Balance" Value="Trial Balance" />
                                <telerik:RadComboBoxItem runat="server" Text="General Ledger" Value="General Ledger" />
                                <telerik:RadComboBoxItem runat="server" Text="Balance Sheet" Value="Balance Sheet" />
                                <telerik:RadComboBoxItem runat="server" Text="Income Statement" Value="Income Statement" />
                                <telerik:RadComboBoxItem runat="server" Text="Export" Value="Export" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label7" runat="server" Text="Voucher No"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtVoucherNo" runat="server" Width="100%">
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label26" runat="server" Text="Report Format"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" Checked="True"/>
                        <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadButton ID="btnGenerateReport" runat="server" Text="Generate Report" TabIndex="20" OnClick="btnGenerateReport_Click">
                        </telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#990033"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
