<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesReturn.aspx.cs" Inherits="SalesMS.Forms.SalesReturn" %>

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
        .auto-style3 {
            height: 36px;
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
        <h1>Sales Return</h1>
    <div>
    
        <table class="auto-style1" style="width: 70%">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Customer Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCustomer" Filter="Contains" EnableLoadOnDemand="true" Runat="server" EmptyMessage="Select Customer" AutoPostBack="True" OnItemsRequested="cmCustomer_ItemsRequested" Width="250px" DropDownAutoWidth="Enabled" Height="400px">
                        <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width:350px">
                                        <tr>
                                            <td style="font-family: Arial; font-size: 8px; width: 100px;">Code</td>
                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 350px">
                                        <tr>
                                            <td style="width: 100px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['CustCode']")%></td>
                                           <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
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
                <td>
                    <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Invoice No"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmInvoice" Filter="Contains" EnableLoadOnDemand="true" Runat="server" EmptyMessage="Select Invoice" OnItemsRequested="cmInvoice_ItemsRequested" AutoPostBack="True" OnSelectedIndexChanged="cmInvoice_SelectedIndexChanged">
                    </telerik:RadComboBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Width="100px">
                    </telerik:RadDatePicker>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label22" runat="server" Text="Remarks"></asp:Label>
                </td>
                <td colspan="3" class="auto-style3">
                    <telerik:RadTextBox ID="txtRemarks" Runat="server" TextMode="MultiLine" Width="400px">
                    </telerik:RadTextBox>
                </td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td colspan="6" class="auto-style2"><telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                            </telerik:RadButton>
                    <telerik:RadButton ID="btnPreview" runat="server" OnClick="btnPreview_Click" Text="Preview">
                    </telerik:RadButton>
                        </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
    
    </div>
        <telerik:RadGrid ID="rgMain" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" Width="60%" OnNeedDataSource="rgMain_NeedDataSource">
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
                    <telerik:GridBoundColumn DataField="ItemCode" FilterControlAltText="Filter TransID column" HeaderText="Item Code" SortExpression="ItemCode" UniqueName="ItemCode">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesId" Display="False" FilterControlAltText="Filter SalesId column" HeaderText="SalesId" SortExpression="SalesId" UniqueName="SalesId">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemName" FilterControlAltText="Filter ItemName column" HeaderText="Item Name" SortExpression="ItemName" UniqueName="ItemName">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemSize" FilterControlAltText="Filter ItemSize column" HeaderText="Item Size" SortExpression="ItemSize" UniqueName="ItemSize">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Pack" FilterControlAltText="Filter Pack column" HeaderText="Pack" SortExpression="Pack" UniqueName="Pack">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LotNumber" FilterControlAltText="Filter LotNumber column" HeaderText="Lot Number" SortExpression="LotNumber" UniqueName="LotNumber">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Category" FilterControlAltText="Filter Category column" HeaderText="Category" SortExpression="Category" UniqueName="Category">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExpiryDate" FilterControlAltText="Filter ExpiryDate column" HeaderText="Expiry Date" SortExpression="ExpiryDate" UniqueName="ExpiryDate" DataFormatString="{0:d}">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Qty" FilterControlAltText="Filter Qty column" HeaderText="Qty" SortExpression="Qty" UniqueName="Qty" DataFormatString="{0:N0}">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UnitPrice" FilterControlAltText="Filter UnitPrice column" HeaderText="Unit Price" SortExpression="UnitPrice" UniqueName="UnitPrice" DataFormatString="{0:N0}">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DataFormatString="{0:N0}">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
    
</body>
</html>