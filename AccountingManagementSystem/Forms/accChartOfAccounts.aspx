<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accChartOfAccounts.aspx.cs" Inherits="AccountingManagementSystem.Forms.accChartOfAccounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 23px;
        }

        .auto-style3 {
            height: 22px;
        }

        .auto-style4 {
            height: 24px;
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
        <h1>Chart of Accounts</h1>
        <div>
            <%-- <asp:UpdatePanel runat="server" ID="up1">
                <ContentTemplate>--%>
            <table class="auto-style1" style="width: 60%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Account Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmAccType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmAccType_SelectedIndexChanged" EmptyMessage="Select Account Type" DataSourceID="dsMG" DataTextField="MainGroupText" DataValueField="MainGroup">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsMG" runat="server" ConnectionString="<%$ ConnectionStrings:AccountingManagementSystemConnectionString %>" SelectCommand="SELECT DISTINCT MainGroup, MainGroupText FROM tblAccGroup"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Sub Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmSubType" ViewStateMode="Enabled" runat="server" EmptyMessage="Select Sub Type" AutoPostBack="True" DataSourceID="dsSG" DataTextField="SubGroupText" DataValueField="SubGroup" Width="250px" OnSelectedIndexChanged="cmSubType_SelectedIndexChanged" AccessibilityMode="True">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsSG" runat="server" ConnectionString="<%$ ConnectionStrings:AccountingManagementSystemConnectionString %>" SelectCommand="SELECT SubGroup, SubGroupText, MainGroup FROM tblAccGroup WHERE (MainGroup = @MainGroup)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmAccType" Name="MainGroup" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server" Text="Main Ledger"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <telerik:RadComboBox ID="cmMainLedger" Filter="Contains" runat="server" EmptyMessage="Select Main Ledger" DataSourceID="dsML" DataTextField="acc_name" DataValueField="acc_code" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="cmMainLedger_SelectedIndexChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsML" runat="server" ConnectionString="<%$ ConnectionStrings:AccountingManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [acct] WHERE ([acc_head] = @acc_head)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmSubType" Name="acc_head" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Accounts Head"></asp:Label>
                    </td>
                    <td class="auto-style2" colspan="3">
                        <telerik:RadTextBox ID="txtAccountHeadCode" runat="server" Width="100px" OnTextChanged="txtAccountHeadCode_TextChanged">
                        </telerik:RadTextBox>
                        <telerik:RadTextBox ID="txtAccountsHead" runat="server" Width="300px">
                        </telerik:RadTextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" colspan="4">
                        <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnPreview" runat="server" OnClick="btnPreview_Click" TabIndex="23" Text="Print Preview">
                        </telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="4">
                        <telerik:RadGrid ID="rgMain" runat="server" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" Width="100%" OnNeedDataSource="rgMain_NeedDataSource">
                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                <Selecting AllowRowSelect="True" />

                                <Scrolling UseStaticHeaders="True" />

                            </ClientSettings>
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Acc_code" FilterControlAltText="Filter TransID column" HeaderText="Account Code" SortExpression="Acc_code" UniqueName="Acc_code">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="acc_name" FilterControlAltText="Filter ChallanNo column" HeaderText="Account Name" SortExpression="acc_name" UniqueName="acc_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="acc_budg" FilterControlAltText="Filter VoucharNo column" HeaderText="Account Budget" SortExpression="acc_budg" UniqueName="acc_budg" DataType="System.Decimal">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="acc_head" FilterControlAltText="Filter CustomerName column" HeaderText="Account Head" SortExpression="acc_head" UniqueName="acc_head">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="acc_status" FilterControlAltText="Filter TotalAmount column" HeaderText="Account Status" SortExpression="acc_status" UniqueName="acc_status">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SubGroupText" FilterControlAltText="Filter SubGroupText column" HeaderText="Acct Group" SortExpression="SubGroupText" UniqueName="SubGroupText">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </form>
</body>
</html>
