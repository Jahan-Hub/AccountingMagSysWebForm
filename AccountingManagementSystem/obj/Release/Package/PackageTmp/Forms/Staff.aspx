<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="SalesMS.Forms.Staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
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
        <h1>Staff Information</h1>
        <%--<asp:UpdatePanel ID="upMain" runat="server">
    <ContentTemplate>--%>
    <div>
    <table class="auto-style1" style="width:100%">
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Staff Code"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtStaffCode" Runat="server" Width="100px" LabelWidth="40px" Resize="None" EmptyMessage="Auto Generated Id">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtName" Runat="server" Width="200px" LabelWidth="80px" Resize="None">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                    <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label72" runat="server" Text="Father Name"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtFatherName" Runat="server" Width="180px" LabelWidth="80px" Resize="None">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label73" runat="server" Text="Mobile"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtMobile" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label68" runat="server" Text="Telephone"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtTelephone" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label74" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtPhone" Runat="server" Width="180px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label62" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtEmail" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                         <td colspan="4">
                            <telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                            </telerik:RadButton>
                        </td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                    </tr>
                    </table>
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Width="99%" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AllowFilteringByColumn="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True">
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
                    <telerik:GridBoundColumn DataField="StaffId" FilterControlAltText="Filter CustId column" HeaderText="Staff Id" SortExpression="StaffId" UniqueName="StaffId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FatherName" FilterControlAltText="Filter FatherName column" HeaderText="Father Name" SortExpression="FatherName" UniqueName="FatherName">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Mobile" FilterControlAltText="Filter Mobile column" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="Phone" SortExpression="Phone" UniqueName="Phone" Display="False">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Telephone" FilterControlAltText="Filter Telephone column" HeaderText="Telephone" SortExpression="Telephone" UniqueName="Telephone" Display="False">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Email" Display="False" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Religion" Display="False" FilterControlAltText="Filter Religion column" HeaderText="Religion" SortExpression="Religion" UniqueName="Religion">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OccupId" Display="False" FilterControlAltText="Filter OccupId column" HeaderText="OccupId" SortExpression="OccupId" UniqueName="OccupId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Reference" Display="False" FilterControlAltText="Filter Reference column" HeaderText="Reference" SortExpression="Reference" UniqueName="Reference">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DistId" Display="False" FilterControlAltText="Filter DistId column" HeaderText="DistId" SortExpression="DistId" UniqueName="DistId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ThanaId" Display="False" FilterControlAltText="Filter ThanaId column" HeaderText="ThanaId" SortExpression="ThanaId" UniqueName="ThanaId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PostId" Display="False" FilterControlAltText="Filter PostId column" HeaderText="PostId" SortExpression="PostId" UniqueName="PostId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ViId" Display="False" FilterControlAltText="Filter ViId column" HeaderText="ViId" SortExpression="ViId" UniqueName="ViId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Address" Display="False" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Remarks" Display="False" FilterControlAltText="Filter Remarks column" HeaderText="Remarks" SortExpression="Remarks" UniqueName="Remarks">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Photo" Display="False" FilterControlAltText="Filter Photo column" HeaderText="Photo" SortExpression="Photo" UniqueName="Photo">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--    </ContentTemplate>
</asp:UpdatePanel>--%>
    </form>
</body>
</html>
<script type="text/javascript">
    function OnClientClicked(button, args) {
        if (window.confirm("Are you sure you want to delete?")) {
            button.set_autoPostBack(true);
        }
        else {
            button.set_autoPostBack(false);
        }
    }
</script>
