<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierInfo.aspx.cs" Inherits="SalesMS.Forms.SupplierInfo" %>
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
        <h1>Supplier Information</h1>
        <%--<asp:UpdatePanel ID="upMain" runat="server">
    <ContentTemplate>--%>
    <div>
    <table class="auto-style1" style="width:100%">
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Supplier Code"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtCustCode" Runat="server" Width="100px" LabelWidth="40px" Resize="None" Enabled="False">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Supplier Name"></asp:Label>
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
                            <asp:Label ID="Label60" runat="server" Text="Address"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtAddress" Runat="server" Width="200px" TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label73" runat="server" Text="Cell No"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtMobile" Runat="server" Width="200px" MaxLength="14">
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
                            <asp:Label ID="Label62" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtEmail" Runat="server" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label76" runat="server" Text="Photo"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="80px" Width="80px"/>
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" OnDataBinding="FileUpload1_DataBinding1" OnLoad="FileUpload1_Load" ValidateRequestMode="Inherit" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                         <td colspan="6">
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
                    </tr>
                    </table>
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" CaseSensitive="false" AutoGenerateColumns="False" Width="99%" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" PageSize="10">
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
                    <telerik:GridBoundColumn DataField="SupplierId" FilterControlAltText="Filter CustId column" HeaderText="Supplier Id" SortExpression="SupplierId" UniqueName="SupplierId">
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
