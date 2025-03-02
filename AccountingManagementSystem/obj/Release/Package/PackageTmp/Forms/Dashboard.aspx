<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SalesMS.Forms.Dashboard" %>

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
        <div>
            <center>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 33%">
                                        &nbsp;</td>
                                    <td style="width: 33%">
                                        <telerik:RadGrid ID="rgCount" MasterTableView-Caption="Total Summary" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                                            <MasterTableView>
                                                 <Columns>
                                                    <telerik:GridBoundColumn DataField="TotalCustomer" FilterControlAltText="Filter TotalDistricts column" HeaderText="Customer" SortExpression="TotalCustomer" UniqueName="TotalCustomer">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="TotalSupplier" FilterControlAltText="Filter TotalThanas column" HeaderText="Supplier" SortExpression="TotalSupplier" UniqueName="TotalSupplier">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="TotalItems" FilterControlAltText="Filter TotalVenues column" HeaderText="Items" SortExpression="TotalItems" UniqueName="TotalItems">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="TotalCostCenter" FilterControlAltText="Filter TotalClubs column" HeaderText="Cost Center" SortExpression="TotalCostCenter" UniqueName="TotalCostCenter">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="TotalCostElement" FilterControlAltText="Filter TotalVillages column" HeaderText="Cost Element" SortExpression="TotalCostElement" UniqueName="TotalCostElement">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                    <td style="width: 33%">&nbsp;</td>
                                </tr>
                                </table>
                        </center>
        </div>
    </form>
</body>
</html>
