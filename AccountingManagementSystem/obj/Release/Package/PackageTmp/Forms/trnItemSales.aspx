<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trnItemSales.aspx.cs" Inherits="SalesMS.Forms.trnItemSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 26px;
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
        <h1>Product Sales</h1>
        <div>
            <table class="auto-style1" style="width: 99%">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Main Info</legend>
                            <div style="height: 200px; overflow: scroll">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Sales/Invoice No"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtSalesID" runat="server" Width="80px" Enabled="False">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td colspan="2">
                                            <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Customer Name"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmCustomerName" runat="server" Filter="Contains" Width="100%" EmptyMessage="Select Customer" EnableLoadOnDemand="true" Height="500px" DropDownAutoWidth="Enabled" OnItemsRequested="cmCustomerName_ItemsRequested">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 12px; width: 50px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 12px; width: 350px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                                        <tr>
                                                            <td style="width: 50px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['CustId']")%></td>
                                                            <td style="width: 350px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Sales Date"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpSalesDt" runat="server" Culture="en-US" Width="100px">
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
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label3" runat="server" Text="Challan No"></asp:Label>
                                        </td>
                                        <td class="auto-style2">
                                            <telerik:RadTextBox ID="txtChallanNo" runat="server" Enabled="False">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label8" runat="server" Text="Remarks"></asp:Label>
                                        </td>
                                        <td class="auto-style2">
                                            <telerik:RadTextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="100%" LabelWidth="100px" Resize="None">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label37" runat="server" Text="PO No"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtPONo" runat="server" Width="100px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label38" runat="server" Text="PO Date"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpPODate" runat="server" Culture="en-US" Width="100px">
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
                                    </tr>
                                </table>
                            </div>
                        </fieldset>

                    </td>
                    <td>
                        <fieldset>
                            <legend>Add Product</legend>
                            <div style="height: 200px; overflow: scroll">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label36" runat="server" Text="Category"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmCategory" runat="server" Filter="Contains" DataSourceID="dsCat" DataTextField="Name" DataValueField="CatId" EmptyMessage="Select Category" AutoPostBack="True" OnSelectedIndexChanged="cmCategory_SelectedIndexChanged">
                                            </telerik:RadComboBox>
                                            <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [Name], [CatId] FROM [tblCategory]"></asp:SqlDataSource>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label39" runat="server" Text="AD" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpAmendmentDate" runat="server" Width="100px" Enabled="False" Visible="False">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Product Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label35" runat="server" Text="Lot Number"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="Unit Price"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Qty"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text="Amount"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadComboBox ID="cmItemName" runat="server" Width="100%" Filter="Contains" AutoPostBack="True" EmptyMessage="Select Product" 
                                                OnSelectedIndexChanged="cmItemName_SelectedIndexChanged" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" Height="400px" OnItemsRequested="cmItemName_ItemsRequested">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 450px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 12px; width: 50px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 12px; width: 400px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 450px">
                                                        <tr>
                                                            <td style="width: 50px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['ItemCode']")%></td>
                                                            <td style="width: 400px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmLotNumber" Filter="Contains" DropDownAutoWidth="Enabled" EnableLoadOnDemand="true" runat="server" EmptyMessage="Select Lot Number" 
                                                Width="100px" OnItemsRequested="cmLotNumber_ItemsRequested" AutoPostBack="True" Height="300px" OnSelectedIndexChanged="cmLotNumber_SelectedIndexChanged">
                                                 <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 300px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 12px; width: 100px;">Entry Date</td>
                                                            <td style="font-family: Arial; font-size: 12px; width: 100px;">Stock Qty</td>
                                                            <td style="font-family: Arial; font-size: 12px; width: 100px;">Lot Number</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 300px">
                                                        <tr>
                                                            <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['EntryDate']")%></td>
                                                            <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Attributes['StockQty']")%></td>
                                                            <td style="width: 100px; font-size: 12px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtUnitPrice" runat="server" AutoPostBack="True" OnTextChanged="txtUnitPrice_TextChanged" Width="80px">
                                            </telerik:RadNumericTextBox>
                                            <asp:Label ID="lblAvailableStock" runat="server" ForeColor="#006666"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtQty" runat="server" Width="60px" AutoPostBack="True" OnTextChanged="txtQty_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtAmount" runat="server" Width="80px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label33" runat="server" Text="Maf. Date"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpMafDate" runat="server" Culture="en-US" Width="100px">
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
                                            <asp:Label ID="Label34" runat="server" Text="Expiry Date"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpExpiryDate" runat="server" Culture="en-US" Width="100px">
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
                                            <telerik:RadButton ID="btnAdd" runat="server" Text="Add Product" OnClick="btnAdd_Click" Width="120px">
                                            </telerik:RadButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" ShowFooter="True" Width="100%">
                                                <MasterTableView>
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemCode" FilterControlAltText="Filter ItemCode column" HeaderText="Product Code" SortExpression="ItemCode" UniqueName="ItemCode">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemName" FilterControlAltText="Filter ItemName column" HeaderText="Product Name" SortExpression="ItemName" UniqueName="ItemName">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemSize" FilterControlAltText="Filter ItemSize column" HeaderText="Item Size" SortExpression="ItemSize" UniqueName="ItemSize">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="LotNumber" FilterControlAltText="Filter LotNumber column" HeaderText="Lot Number" SortExpression="LotNumber" UniqueName="LotNumber">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Qty" DataType="System.Decimal" FilterControlAltText="Filter YardQty column" HeaderText="Qty" SortExpression="Qty" UniqueName="Qty" DataFormatString="{0:F2}">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="UnitPrice" DataType="System.Decimal" FilterControlAltText="Filter UnitRate column" HeaderText="Unit Price" SortExpression="UnitPrice" UniqueName="UnitPrice" DataFormatString="{0:N0}">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Amount" DataType="System.Decimal" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DataFormatString="{0:N0}">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataField="Delete" FilterControlAltText="Filter Delete column" HeaderText="Delete" SortExpression="Delete" UniqueName="Delete">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="DeleteTextBox" runat="server" Text='<%# Bind("Delete") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="rbtDeleteGrid" runat="server" ImageUrl="~/Images/Delete.png" OnClick="rbtDeleteGrid_Click" TabIndex="5" ToolTip="Delete" CommandName="GridDelete" />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Pay Details</legend>
                            <div style="height: 320px; overflow: scroll">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td>
                                                                    <asp:LinkButton ID="btnVAT" runat="server" OnClick="btnVAT_Click">VAT</asp:LinkButton>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtVATTotal" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtVATTotal_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label31" runat="server" Text="Others"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtOtherCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtOtherCost_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label15" runat="server" Text="Discount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtDiscount" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtDiscount_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label24" runat="server" Text="Net Amount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNetAmount" runat="server" ForeColor="#006666" Text="0.00" Font-Bold="True"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label17" runat="server" Text="Due Amount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblDueAmount" runat="server" ForeColor="#CC0000" Text="0.00"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label16" runat="server" Text="Paid Amount" Visible="False"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtPaidAmount" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtPaidAmount_TextChanged" Enabled="False" Visible="False">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
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
                                                </tr>
                                            </table>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>

                    </td>
                    <td>
                        <fieldset>
                            <legend>Sales Details</legend>
                            <div style="height: 320px; overflow: scroll">
                                <telerik:RadGrid ID="rgMain"  runat="server" Height="100px" AllowMultiRowSelection="True" AutoGenerateColumns="False" 
                                    OnSelectedIndexChanged="rgMain_SelectedIndexChanged" AllowFilteringByColumn="true" Width="100%" OnNeedDataSource="rgMain_NeedDataSource">
                                    <GroupingSettings  CaseSensitive="false"></GroupingSettings>
                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling UseStaticHeaders="True" />
                                    </ClientSettings>
                                    <MasterTableView AllowSorting="true" AllowFilteringByColumn="true">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SalesId" FilterControlAltText="Filter VoucharNo column" HeaderText="Sales Id" SortExpression="SalesId" UniqueName="SalesId">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SalesDate" FilterControlAltText="Filter TransactionDate column" HeaderText="Sales Date" SortExpression="SalesDate" UniqueName="SalesDate" DataFormatString="{0:d}">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CustomerName" FilterControlAltText="Filter CustomerName column" HeaderText="Customer Name" SortExpression="CustomerName" UniqueName="CustomerName">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="NetAmount" FilterControlAltText="Filter NetAmount column" HeaderText="Total" SortExpression="NetAmount" UniqueName="NetAmount" DataFormatString="{0:N0}" DataType="System.Decimal">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Discount" DataFormatString="{0:N0}" HeaderText="Discount" SortExpression="Discount" UniqueName="Discount" DataType="System.Decimal" FilterControlAltText="Filter Discount column">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text=""></ModelErrorMessage>
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LabourCost" FilterControlAltText="Filter LabourCost column" HeaderText="Labour Cost" SortExpression="LabourCost" UniqueName="LabourCost" DataFormatString="{0:N0}" DataType="System.Decimal" Display="False">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Paid" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Paid column" HeaderText="Money Received" SortExpression="Paid" UniqueName="Paid">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text=""></ModelErrorMessage>
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Due" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Due column" HeaderText="Due" SortExpression="Due" UniqueName="Due">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text=""></ModelErrorMessage>
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSave" SingleClick="true" SingleClickText="Working..." runat="server" Text="Save" OnClick="btnSave_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnDelete" runat="server" OnClick="btnDelete_Click" OnClientClicked="OnClientClicked" Text="Delete">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnPrintPreview" runat="server" Text="Print Preview" OnClick="btnPrintPreview_Click">
                        </telerik:RadButton>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Print Challan" />
                        <asp:CheckBox ID="ckDiscountYN" runat="server" Text="With Discount" />
                        <asp:CheckBox ID="ckVatYN" runat="server" Text="With VAT" Checked="True" />
                    </td>
                </tr>
            </table>
        </div>
        <%# DataBinder.Eval(Container, "Attributes['CustId']")%>
        <telerik:RadWindow ID="RadWindow1" runat="server" Height="200px" Width="500px" ShowOnTopWhenMaximized="false" VisibleTitlebar="False">
                    <ContentTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Label ID="Label242" runat="server" Text="Net Amount"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="txtPaidAmountPopup" runat="server" AutoPostBack="True" Enabled="False" OnTextChanged="txtPaidAmount_TextChanged" Width="160px">
                                    </telerik:RadNumericTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblInsertType" runat="server" ForeColor="#CC0000"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label106" runat="server" Text="VAT Percentage"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="txtVATPercentage" Runat="server" AutoPostBack="True" OnTextChanged="txtVATPercentage_TextChanged">
                                    </telerik:RadNumericTextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label107" runat="server" Text="VAT Amout"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <telerik:RadNumericTextBox ID="txtVATAmount" Runat="server">
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <telerik:RadButton ID="btnOkMaster" runat="server" OnClick="btnOkMaster_Click" Text="Ok">
                                    </telerik:RadButton>
                                    <telerik:RadButton ID="btnCancelMaster" runat="server" OnClick="btnCancelMaster_Click" Text="Cancel">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="lblMessagePopup" runat="server" ForeColor="#CC0000"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </telerik:RadWindow>
    </form>

</body>
</html>
<script>
    function OnClientClicked(button, args) {
        if (window.confirm("Are you sure you want to delete?")) {
            button.set_autoPostBack(true);
        }
        else {
            button.set_autoPostBack(false);
        }
    }
</script>
