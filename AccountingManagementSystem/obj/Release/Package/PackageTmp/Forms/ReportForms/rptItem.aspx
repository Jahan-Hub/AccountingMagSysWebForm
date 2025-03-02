<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptItem.aspx.cs" Inherits="SalesMS.Forms.rptItem" %>

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
        <h1>Item</h1>

        <table>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Report Formats"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" Runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="cmReportFormat_SelectedIndexChanged">
                        <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Excel Aid(Items)" Value="Excel Aid(Items)" />
                            <telerik:RadComboBoxItem runat="server" Text="Items" Value="Items" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCommon" runat="server" EnableLoadOnDemand="true" EmptyMessage="Select A Product" OnItemsRequested="cmCommon_ItemsRequested" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="cmCommon_SelectedIndexChanged" Filter="Contains" DropDownAutoWidth="Enabled" Height="400px">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 450px">
                                <tr>
                                    <td style="font-family: Arial; font-size: 12px; width: 100px;">Code</td>
                                    <td style="font-family: Arial; font-size: 12px; width: 100px;">Alias</td>
                                    <td style="font-family: Arial; font-size: 12px; width: 250px;">Name</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 450px">
                                <tr>
                                    <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['ItemCode']")%></td>
                                    <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['ItemAlias']")%></td>
                                    <td style="width: 250px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Item Size"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmItemSize" runat="server" EnableLoadOnDemand="true" AutoPostBack="True" EmptyMessage="Select Item Size" OnItemsRequested="cmItemSize_ItemsRequested">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Expiry Date"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="dpStartDate" runat="server" Culture="en-US">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                        <DateInput DisplayDateFormat="dd-MMM-yy" DateFormat="dd-MMM-yy" LabelWidth="40%">
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

                        <DateInput DisplayDateFormat="dd-MMM-yy" DateFormat="dd-MMM-yy" LabelWidth="40%">
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
                <td>&nbsp;</td>
                <td>
                    <telerik:RadButton ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" class="menuitembold" ForeColor="Blue" Text="Report Format"></asp:Label></td>
                <td>
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" />
                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False" />
                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue" Visible="False" />
                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" Checked="True"/>
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
