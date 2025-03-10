﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpeningBalance.aspx.cs" Inherits="AccountingManagementSystem.Forms.OpeningBalance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <h1>Account Opening Balance</h1>
        <div>
            <table style="width: 90%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Opening Date"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Account Code"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Account Head"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Debit Amount"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Credit Amount"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadDatePicker ID="dpOPDate" runat="server" Culture="en-US" TabIndex="2" Width="100px">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="2">
                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                <FocusedStyle Resize="None"></FocusedStyle>

                                <DisabledStyle Resize="None"></DisabledStyle>

                                <InvalidStyle Resize="None"></InvalidStyle>

                                <HoveredStyle Resize="None"></HoveredStyle>

                                <EnabledStyle Resize="None"></EnabledStyle>
                            </DateInput>

                            <DatePopupButton ImageUrl="" HoverImageUrl="" TabIndex="2"></DatePopupButton>
                        </telerik:RadDatePicker>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <telerik:RadComboBox ID="cmAcctCode" EnableLoadOnDemand="true" DropDownWidth="350px" Filter="Contains" runat="server" OnItemsRequested="cmAcctCode_ItemsRequested" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="cmAcctCode_SelectedIndexChanged" TabIndex="3">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="font-family: Arial; font-size: 10px; width: 250px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                        <td style="font-family: Arial; font-size: 10px; width: 100px;"><%# DataBinder.Eval(Container, "Attributes['acc_code']")%></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadComboBox>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtAcctCode" runat="server" Width="160px" TabIndex="4" Height="20px" Enabled="False">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadTextBox>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtDebitAmt" runat="server" AutoPostBack="True" OnTextChanged="txtDebitAmt_TextChanged" Height="20px">
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtCreditAmt" runat="server" AutoPostBack="True" OnTextChanged="txtCreditAmt_TextChanged">
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0066"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7">
                        <telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                        </telerik:RadButton>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadGrid ID="rgMain" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" Width="90%" OnNeedDataSource="rgMain_NeedDataSource">
            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                <Selecting AllowRowSelect="True" />

                <Scrolling UseStaticHeaders="True" />

            </ClientSettings>
            <MasterTableView>
                <Columns>
                    <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="S/N" SortExpression="rowid" UniqueName="rowid">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vou_date" FilterControlAltText="Filter vou_date column" HeaderText="Date" SortExpression="vou_date" UniqueName="vou_date" DataFormatString="{0:dd-MM-yyyy}">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acc_code" FilterControlAltText="Filter acc_code column" HeaderText="Account Code" SortExpression="acc_code" UniqueName="acc_code">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acc_name" FilterControlAltText="Filter acc_name column" HeaderText="Account Name" SortExpression="acc_name" UniqueName="acc_name">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vou_no" FilterControlAltText="Filter vou_no column" HeaderText="Voucher No" SortExpression="vou_no" UniqueName="vou_no" Display="False">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="dr_amt" FilterControlAltText="Filter dr_amt column" HeaderText="Debit Amount" SortExpression="dr_amt" UniqueName="dr_amt">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cr_amt" HeaderText="Credit Amount" SortExpression="cr_amt" UniqueName="cr_amt" FilterControlAltText="Filter cr_amt column">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
