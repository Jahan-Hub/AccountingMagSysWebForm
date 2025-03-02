<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="SalesMS.Forms.CustomerInfo" %>

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
        <h1>Customer Information</h1>
        <%--<asp:UpdatePanel ID="upMain" runat="server">
    <ContentTemplate>--%>
    <div>
    <table class="auto-style1" style="width:100%">
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Customer ID"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtCustCode" Runat="server" Width="100px" LabelWidth="40px" Resize="None" Enabled="False">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Customer Name"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtName" Runat="server" Width="220px" LabelWidth="80px" Resize="None">
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
                            <asp:Label ID="Label62" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtEmail" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label73" runat="server" Text="Cell No"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtMobile" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label68" runat="server" Text="Land Phone"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtTelephone" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label60" runat="server" Text="Billing Address"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtAddress" Runat="server" Width="200px" TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label77" runat="server" Text="Delivery Address"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtDeliveryAddress" Runat="server" Width="200px" TextMode="MultiLine" EmptyMessage="Details Address (ex-Person,Phone etc)">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label76" runat="server" Text="Photo"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="80px" Width="80px"/>
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" OnDataBinding="FileUpload1_DataBinding1" OnLoad="FileUpload1_Load" ValidateRequestMode="Inherit" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label78" runat="server" Text="Customer Territory Code"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtCustomerTeritoryCode" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label79" runat="server" Text="Employee Name"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadComboBox ID="cmReference" runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Reference"  Width="300px" Filter="Contains" Height="500px" AutoPostBack="True" OnItemsRequested="cmReference_ItemsRequested">
                                    </telerik:RadComboBox>

                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr hidden="hidden">
                        <td>
                            <asp:Label ID="Label80" runat="server" Text="Region"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadComboBox ID="cmRegion" runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Region"  Width="200px" Filter="Contains" Height="500px" AutoPostBack="True" OnItemsRequested="cmRegion_ItemsRequested">
                                    </telerik:RadComboBox>

                        </td>
                        <td>
                            <asp:Label ID="Label81" runat="server" Text="Area"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadComboBox ID="cmArea" runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Area"  Width="200px" Filter="Contains" Height="500px" AutoPostBack="True" OnItemsRequested="cmArea_ItemsRequested">
                                    </telerik:RadComboBox>

                        </td>
                        <td>
                            <asp:Label ID="Label82" runat="server" Text="Teritory"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadComboBox ID="cmTeritory" runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Teritory"  Width="200px" Filter="Contains" Height="500px" AutoPostBack="True" OnItemsRequested="cmTeritory_ItemsRequested">
                                    </telerik:RadComboBox>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
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
                            <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click">
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
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Width="99%" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowFilteringByColumn="True">
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
                    <telerik:GridBoundColumn DataField="CustId" FilterControlAltText="Filter CustId column" HeaderText="Customer Id" SortExpression="CustId" UniqueName="CustId">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Mobile" FilterControlAltText="Filter Mobile column" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address">
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
    function previewFile() {
        var preview = document.querySelector('#<%=Image1.ClientID %>');
        var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
</script>

