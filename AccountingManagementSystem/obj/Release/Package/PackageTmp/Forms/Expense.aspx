<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="SalesMS.Forms.Expense" %>

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
        <h1>Expense Entry</h1>
    <div>
    <table class="auto-style1" style="width:80%">
            <tr>
                <td>
                    <table class="auto-style1">
                        <tr>
                            <td>
                    <asp:Label ID="Label1" runat="server" Text="Expense ID"></asp:Label>
                            </td>
                            <td>
                    <telerik:RadTextBox ID="txtExpenseId" Runat="server" Enabled="False">
                    </telerik:RadTextBox>
                            </td>
                            <td>
                    <asp:Label ID="Label4" runat="server" Text="Expense Date"></asp:Label>
                            </td>
                            <td>
                    <telerik:RadDatePicker ID="dpExpenseDt" Runat="server" Culture="en-US" Width="100px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                            </td>
                            <td>
                    <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                    <asp:Label ID="Label99" runat="server" Text="Cost Center"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="cmCostHead" Runat="server" EnableLoadOnDemand="true" AutoPostBack="True" EmptyMessage="Select Cost Head"  Width="250px" OnSelectedIndexChanged="cmCostHead_SelectedIndexChanged" OnItemsRequested="cmCostHead_ItemsRequested" Filter="Contains" Height="500px" DropDownAutoWidth="Enabled">
                                     <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" style="width: 350px">
                                            <tr>
                                                <td style="font-family: Arial; font-size: 12px; width: 100px;">Alias</td>
                                                <td style="font-family: Arial; font-size: 12px; width: 250px;">Cost Center</td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0" style="width: 350px">
                                            <tr>
                                                <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['Alias']")%></td>
                                                <td style="width: 250px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadComboBox>
                            </td>
                            <td colspan="2" rowspan="6">
                                <fieldset>
                                                            <legend>Cheque Details & Others</legend>
                                                            <table class="auto-style1">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label23" runat="server" Text="Pay Mode"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3">
                                                                        <telerik:RadComboBox ID="cmPayMode" Filter="Contains" runat="server" AutoPostBack="True" EmptyMessage="Select Mode" OnSelectedIndexChanged="cmPayMode_SelectedIndexChanged" Width="100%">
                                                                            <Items>
                                                                                <telerik:RadComboBoxItem runat="server" Text="Cash" Value="Cash" />
                                                                                <telerik:RadComboBoxItem runat="server" Text="Cheque" Value="Cheque" />
                                                                                <telerik:RadComboBoxItem runat="server" Text="Bank Transfer" Value="Bank Transfer" />
                                                                                <telerik:RadComboBoxItem runat="server" Text="TDS" Value="TDS" />
                                                                                <telerik:RadComboBoxItem runat="server" Text="VDS" Value="VDS" />
                                                                            </Items>
                                                                        </telerik:RadComboBox>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                    <td>
                                                                        <asp:HiddenField ID="hfItemSize" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label20" runat="server" Text="Cheque No"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3">
                                                                        <telerik:RadTextBox ID="txtChequeNo" runat="server" LabelWidth="64px" Resize="None" Width="100px">
                                                                        </telerik:RadTextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label21" runat="server" Text="Cheque Date"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <telerik:RadDatePicker ID="dpCheckDate" runat="server" Culture="en-US" Width="100px">
                                                                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                                                                            <DateInput DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" LabelWidth="40%">
                                                                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                                                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                                                                <FocusedStyle Resize="None"></FocusedStyle>

                                                                                <DisabledStyle Resize="None"></DisabledStyle>

                                                                                <InvalidStyle Resize="None"></InvalidStyle>

                                                                                <HoveredStyle Resize="None"></HoveredStyle>

                                                                                <EnabledStyle Resize="None"></EnabledStyle>
                                                                            </DateInput>

                                                                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                                        </telerik:RadDatePicker>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label25" runat="server" Text="Bank Name"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3" colspan="3">
                                                                        <telerik:RadTextBox ID="txtBankName" runat="server" Width="100%">
                                                                        </telerik:RadTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label28" runat="server" Text="Cheque Details"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3" colspan="3">
                                                                        <telerik:RadTextBox ID="txtChequeDetails" runat="server" Width="100%" TextMode="MultiLine">
                                                                        </telerik:RadTextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                    <asp:Label ID="Label98" runat="server" Text="Cost Element"></asp:Label>
                            </td>
                            <td>
                    <telerik:RadComboBox ID="cmExpenseHead" Runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Cost Elements" Width="250px" OnItemsRequested="cmExpenseHead_ItemsRequested" Filter="Contains" Height="500px" DropDownAutoWidth="Enabled">
                        <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" style="width: 500px">
                            <tr>
                                <td style="font-family: Arial; font-size: 12px; width: 100px;">Alias</td>
                                <td style="font-family: Arial; font-size: 12px; width: 200px;">Cost Eletent</td>
                                <td style="font-family: Arial; font-size: 12px; width: 200px;">Cost Center</td>
                            </tr>
                        </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 500px">
                                <tr>
                                    <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['Alias']")%></td>
                                    <td style="width: 200px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                    <td style="width: 200px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['CostCenter']")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                    <asp:Label ID="Label2" runat="server" Text="Pay To"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtHandedTo" Runat="server" Width="100%">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                    <asp:Label ID="Label8" runat="server" Text="Paid Amount"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadNumericTextBox ID="txtAmount" Runat="server">
                                </telerik:RadNumericTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                    <asp:Label ID="Label97" runat="server" Text="Details"></asp:Label>
                            </td>
                            <td>
                    <telerik:RadTextBox ID="txtRemarks" Runat="server" TextMode="MultiLine" Width="100%" LabelWidth="100px" Resize="None">
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
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
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
                                &nbsp;</td>
                            <td colspan="6">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
            </tr>
            <tr>
                <td><telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                            </telerik:RadButton>
                            </td></td>
            </tr>
        </table>
    </div>
        <div style="width:80%;">
        <telerik:RadGrid ID="rgMain" runat="server" AllowPaging="True" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" OnNeedDataSource="rgMain_NeedDataSource" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both">
             <GroupingSettings  CaseSensitive="false"></GroupingSettings>
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
                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter VoucharNo column" HeaderText="Expense Id" SortExpression="Id" UniqueName="Id">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Head" FilterControlAltText="Filter ChallanNo column" HeaderText="Expense Head" SortExpression="Head" UniqueName="Head" Display="False">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Date" FilterControlAltText="Filter TransactionDate column" HeaderText="Expense Date" SortExpression="Date" UniqueName="Date" DataFormatString="{0:d}" DataType="System.DateTime">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CostCenterName" FilterControlAltText="Filter CostHeadName column" HeaderText="Cost Head" SortExpression="CostCenterName" UniqueName="CostCenterName">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CostElementName" FilterControlAltText="Filter CostElementName column" HeaderText="Cost Element" SortExpression="CostElementName" UniqueName="CostElementName">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HandedTo" FilterControlAltText="Filter CustomerName column" HeaderText="Pay To" SortExpression="HandedTo" UniqueName="HandedTo">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter Due column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DataFormatString="{0:F2}" DataType="System.Decimal">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle  HorizontalAlign="Right"/>
                        <FooterStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Remarks" FilterControlAltText="Filter Remarks column" HeaderText="Details" SortExpression="Remarks" UniqueName="Remarks">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PayMode" FilterControlAltText="Filter PayMode column" HeaderText="Pay Mode" SortExpression="PayMode" UniqueName="PayMode">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>

</body>

</html>

