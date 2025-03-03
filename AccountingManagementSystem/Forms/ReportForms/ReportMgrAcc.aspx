<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMgrAcc.aspx.cs" Inherits="AccountingManagementSystem.Forms.ReportForms.ReportMgrAcc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }

        .auto-style3 {
            width: 230px;
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
        <h1>Report Manager Accounts</h1>
        <div>
            <table class="auto-style1" style="width: 1045px">

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Report Format"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmReportFormat" runat="server" Width="400px" AutoPostBack="True" EmptyMessage="Select Category" OnSelectedIndexChanged="cmReportFormat_SelectedIndexChanged">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Chart of Accounts" Value="Chart of Accounts" />
                                <telerik:RadComboBoxItem runat="server" Text="Voucher Register" Value="Voucher Register" />
                                <telerik:RadComboBoxItem runat="server" Text="Income Statement" Value="Income Statement" />
                                <telerik:RadComboBoxItem runat="server" Text="General Ledger" Value="General Ledger" />
                                <telerik:RadComboBoxItem runat="server" Text="Trial Balance" Value="Trial Balance" />
                                <telerik:RadComboBoxItem runat="server" Text="Balance Sheet" Value="Balance Sheet" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Account Head"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmAccountHead" Filter="Contains" runat="server" EmptyMessage="Select Account Head" DataSourceID="dsML" DataTextField="acc_name" DataValueField="acc_code" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="cmAccountHead_SelectedIndexChanged" OnItemsRequested="cmAccountHead_ItemsRequested">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsML" runat="server" ConnectionString="<%$ ConnectionStrings:AccountingManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [acct] WHERE ([acc_head] = @acc_head)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmSubType" Name="acc_head" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label111" runat="server" Text="Account Name"></asp:Label>
                    </td>
                    <td>
                                <telerik:RadComboBox ID="cmACC_Name" EnableLoadOnDemand="true" DropDownWidth="350px" Filter="Contains" Runat="server" Width="400px" OnItemsRequested="cmACC_Name_ItemsRequested" AutoPostBack="True" OnSelectedIndexChanged="cmACC_Name_SelectedIndexChanged" TabIndex="3">
                                    <%--<HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="font-family: Arial; font-size: 10px; width: 250px;">Account Head</td>
                                                <td style="font-family: Arial; font-size: 10px; width: 100px;">Account Code</td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>--%>
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="font-family: Arial; font-size: 10px;width: 250px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                <td style="font-family: Arial; font-size: 10px; width: 100px;"><%# DataBinder.Eval(Container, "Attributes['acc_code']")%></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadComboBox>
                    <telerik:RadTextBox ID="txtACC_Code" Runat="server" Width="80px" TabIndex="4">
                    </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label109" runat="server" Text="Voucher Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmVoucherType" runat="server" Width="80px" AutoPostBack="True" EmptyMessage="Select">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="ALL" />
                                <telerik:RadComboBoxItem runat="server" Text="CP" Value="CP" />
                                <telerik:RadComboBoxItem runat="server" Text="BP" Value="BP" />
                                <telerik:RadComboBoxItem runat="server" Text="CR" Value="CR" />
                                <telerik:RadComboBoxItem runat="server" Text="BR" Value="BR" />
                                <telerik:RadComboBoxItem runat="server" Text="JV" Value="JV" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label108" runat="server" Text="Voucher No"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtVoucherNo" runat="server">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label112" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="dpStartDate" runat="server" Culture="en-US">
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
                        <telerik:RadDatePicker ID="dpEndDate" runat="server" Culture="en-US">
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label17" runat="server" class="menuitembold" ForeColor="Blue" Text="Report Format"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnPdf" runat="server" Text="PDF" GroupName="a" ForeColor="Blue" Checked="True" />
                        <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="a" ForeColor="Blue" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadButton ID="btnPreview" runat="server" OnClick="btnPreview_Click" Text="Report Preview" TabIndex="21">
                        </telerik:RadButton>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
