<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptSales.aspx.cs" Inherits="SalesMS.Forms.ReportForms.rptSales" %>


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
          <h1>Sales Info</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Report Formats"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" Runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="cmReportFormat_SelectedIndexChanged">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Product Sales by Customer" Value="Product Sales by Customer" />
                            <telerik:RadComboBoxItem runat="server" Text="Excel Aid (Item Wise)" Value="Excel Aid (Item Wise)" />
                            <telerik:RadComboBoxItem runat="server" Text="Customer Wise Sales Report" Value="Customer Wise Sales Report" />
                            <telerik:RadComboBoxItem runat="server" Text="Details" Value="Details" />
                            <telerik:RadComboBoxItem runat="server" Text="Item Wise" Value="Item Wise" />
                            <telerik:RadComboBoxItem runat="server" Text="Customer Wise" Value="Customer Wise" />
                        </Items>
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
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCustomer" Filter="Contains" Runat="server" EnableLoadOnDemand="true" EmptyMessage="Select A Customer" OnItemsRequested="cmCustomer_ItemsRequested" Width="100%" OnSelectedIndexChanged="cmCustomer_SelectedIndexChanged">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label21" runat="server" Text="Item Category"></asp:Label>
                </td>
                <td class="auto-style1">
                    <telerik:RadComboBox ID="cmCategory" Filter="Contains" Runat="server" DataSourceID="dsCat" DataTextField="Name" DataValueField="CatId" EmptyMessage="Select Category" AutoPostBack="True" OnSelectedIndexChanged="cmCategory_SelectedIndexChanged" Width="100%" EnableLoadOnDemand="True">
                    </telerik:RadComboBox>
                    <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [Name], [CatId] FROM [tblCategory]"></asp:SqlDataSource>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label20" runat="server" Text="Item Name"></asp:Label>
                </td>
                <td class="auto-style1">
                            <telerik:RadComboBox ID="cmItemName" Filter="Contains" Runat="server" Width="100%" AutoPostBack="True" EmptyMessage="Select Product" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" Height="400px">
                                    <HeaderTemplate>
                                    <table  style="width: 450px">
                                        <tr>
                                            <td style="font-family: Arial; font-size: 8px; width: 30px;">Code</td>
                                            <td style="font-family: Arial; font-size: 8px; width: 170px;">Alias</td>
                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table style="width: 450px">
                                        <tr>
                                            <td style="width: 30px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['ItemCode']")%></td>
                                            <td style="width: 150px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['ItemAlias']")%></td>
                                           <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="Territory Code"></asp:Label>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtTerritoryCode" Runat="server">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
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
