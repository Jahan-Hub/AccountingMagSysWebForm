<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterData.aspx.cs" Inherits="SalesMS.Forms.MasterData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
        }
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.Core.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.jQuery.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.jQueryInclude.js">
            </asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <div>
    <h2>Master Data Information</h2>
    
    <telerik:RadPanelBar ID="RadPanelBar1" Runat="server" Width="90%" Height="100%">
        <Items>
            <telerik:RadPanelItem runat="server" Text="Company" Visible="False">
                <ContentTemplate>
                    <table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtName" Runat="server" Width="280px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtAddress" Runat="server"  TextMode="MultiLine" Width="280px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Contact"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtContact" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtEmail" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Website"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtWebsite" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <telerik:RadButton ID="btnCompanyNew" runat="server" Text="New" OnClick="btnCompanyNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnSaveCompany" runat="server" Text="Save" OnClick="btnSaveCompany_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCompanyFind" runat="server" Text="Find" OnClick="btnCompanyFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCompanyEdit" runat="server" Text="Edit" OnClick="btnCompanyEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCompanyCancel" runat="server" Text="Cancel" OnClick="btnCompanyCancel_Click" >
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                 <asp:Label ID="lblCompany" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Village" Visible="False">
               <ContentTemplate>
                    
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Literal ID="Literal3q" runat="server" Text="Village Code"></asp:Literal>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtVillageCode" Runat="server"  Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblVillageMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literal4" runat="server" Text="Village Name"></asp:Literal>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtVillageName" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literal55" runat="server" Text="Post Name"></asp:Literal>
                            </td>
                            <td colspan="2">
                                <telerik:RadComboBox ID="cmPost" Runat="server" Filter="Contains" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="PostId" Width="200px" EmptyMessage="Select Post Office">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="Lalpur Bazar" Value="Lalpur Bazar" />
                                    </Items>
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [PostId], [Name] FROM [tblPosts]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnVillageNew" runat="server" Text="New" OnClick="btnVillageNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnVillageSave" runat="server" Text="Save" OnClick="btnVillageSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnVillageFind" runat="server"  Text="Find" OnClick="btnVillageFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnVillageEdit" runat="server" Text="Edit" OnClick="btnVillageEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnVillageCancel" runat="server" Text="Cancel" OnClick="btnVillageCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                           
                                <asp:Label ID="lblVillage" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td>
                                <fieldset>
                                    <legend>All Villages</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgVillage" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgVillage_NeedDataSource" PageSize="10" OnSelectedIndexChanged="rgVillage_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="ViId" FilterControlAltText="Filter PI column" HeaderText="Village ID" SortExpression="ViId" UniqueName="ViId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Village Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="PostId" FilterControlAltText="Filter PostId column" SortExpression="PostId" UniqueName="PostId" Display="False" HeaderText="PostId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Post" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>Post Code</td>
                            <td>
                                <telerik:RadTextBox ID="txtPostCode" Runat="server" Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblPostMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Post Name</td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtPostName" Runat="server" >
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label24" runat="server" Text="Post Office Code"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadNumericTextBox ID="txtPostOfficeCode" Runat="server" MaxLength="4">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Thana Name"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadComboBox ID="cmThana" Filter="Contains" Runat="server" DataSourceID="dsThana" DataTextField="Name" DataValueField="ThanaId" EmptyMessage="Select Thana">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsThana" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [ThanaId], [Name] FROM [tblThanas]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnPostNew" runat="server" Text="New" OnClick="btnPostNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPostSave" runat="server" Text="Save" OnClick="btnPostSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPostFind" runat="server" Text="Find" OnClick="btnPostFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPostEdit" runat="server" Text="Edit" OnClick="btnPostEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPostCancel" runat="server" Text="Cancel" OnClick="btnPostCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                  <asp:Label ID="lblPost" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td><fieldset>
                                    <legend>All Post Offices</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgPostOffice" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgPostOffice_NeedDataSource" PageSize="5" OnSelectedIndexChanged="rgPostOffice_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="PostId" FilterControlAltText="Filter PI column" HeaderText="Post Office ID" SortExpression="PostId" UniqueName="PostId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Code" FilterControlAltText="Filter Code column" HeaderText="Post Code" SortExpression="Code" UniqueName="Code">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Post Office Name" SortExpression="Name" UniqueName="Name">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ThanaId" FilterControlAltText="Filter PostId column" SortExpression="ThanaId" UniqueName="ThanaId" Display="False" HeaderText="Thana Id">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Thana" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="Thana Code"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtThanaCode" Runat="server"  Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblThanaMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="Thana Name"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtThanaName" Runat="server" >
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="District Name"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadComboBox ID="cmDistrict" Filter="Contains" Runat="server" DataSourceID="dsDist" DataTextField="Name" DataValueField="DistId" EmptyMessage="Select District">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="Phulpur" Value="Phulpur" />
                                    </Items>
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsDist" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [DistId], [Name] FROM [tblDistricts]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnThanaNew" runat="server" Text="New" OnClick="btnThanaNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnThanaSave" runat="server" Text="Save" OnClick="btnThanaSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnThanaFind" runat="server" Text="Find" OnClick="btnThanaFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnThanaEdit" runat="server" Text="Edit" OnClick="btnThanaEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnThanaCancel" runat="server" Text="Cancel" OnClick="btnThanaCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblThana" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td><fieldset>
                                    <legend>All Thanas</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgThana" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgThana_NeedDataSource" PageSize="10" OnSelectedIndexChanged="rgThana_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="ThanaId" FilterControlAltText="Filter PostId column" HeaderText="Thana Id" SortExpression="ThanaId" UniqueName="ThanaId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Thana Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="DistId" FilterControlAltText="Filter PI column" HeaderText="Dist Id" SortExpression="DistId" UniqueName="DistId" Display="False">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ColumnValidationSettings>
                                                             <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="District" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="District Code"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtDistrictCode" Runat="server" Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblDistrictMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="District Name"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtDistrictName" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnDistrictNew" runat="server" Text="New" OnClick="btnDistrictNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDistrictSave" runat="server" Text="Save" OnClick="btnDistrictSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDistrictFind" runat="server" OnClick="btnDistrictFind_Click" Text="Find">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDistrictEdit" runat="server" OnClick="btnDistrictEdit_Click" Text="Edit">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDistrictCancel" runat="server" Text="Cancel" OnClick="btnDistrictCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                 <asp:Label ID="lblDistrict" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td><fieldset>
                                    <legend>All Districts</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgDistrict" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgDistrict_NeedDataSource" PageSize="5" OnSelectedIndexChanged="rgDistrict_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="DistId" FilterControlAltText="Filter PI column" HeaderText="District Id" SortExpression="DistId" UniqueName="DistId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="District Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Category">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label15" runat="server" Text="Category Code"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtCategoryCode" Runat="server" Width="100px" Enabled="False">
                                </telerik:RadTextBox>
                                <asp:Label ID="lblCategoryMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="Category Name"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtCategoryName" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <telerik:RadButton ID="btnCategoryNew" runat="server" Text="New" OnClick="btnCategoryNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCategorySave" runat="server" Text="Save" OnClick="btnCategorySave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCategoryFind" runat="server" Text="Find" OnClick="btnCategoryFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCategoryEdit" runat="server" Text="Edit" OnClick="btnCategoryEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCategoryDelete" runat="server" Text="Delete" OnClick="btnCategoryDelete_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCategoryCancel" runat="server" OnClick="btnCategoryCancel_Click" Text="Cancel">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblCategory" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                            </td>
                            <td>
                                <fieldset>
                                    <legend>All Categories</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgCategory" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True"  PageSize="5" OnNeedDataSource="rgCategory_NeedDataSource" OnSelectedIndexChanged="rgCategory_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="CatId" FilterControlAltText="Filter PI column" HeaderText="Category Id" SortExpression="CatId" UniqueName="CatId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Category Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                    
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Packing">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Literal ID="Literal6" runat="server" Text="Packing Code"></asp:Literal>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtPackingCode" Runat="server"  Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblPackingMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literal7" runat="server" Text="Packing Name"></asp:Literal>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtPackingName" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnPackingNew" runat="server" Text="New" OnClick="btnPackingNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPackingSave" runat="server" Text="Save" OnClick="btnPackingSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPackingFind" runat="server"  Text="Find" OnClick="btnPackingFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPackingEdit" runat="server" Text="Edit" OnClick="btnPackingEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPackingDelete" runat="server" OnClick="btnPackingDelete_Click" Text="Delete">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnPackingCancel" runat="server" Text="Cancel" OnClick="btnPackingCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                           
                                <asp:Label ID="lblPacking" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td>
                                <fieldset>
                                    <legend>All Packing Types</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgPacking" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgPacking_NeedDataSource" PageSize="5" OnSelectedIndexChanged="rgPacking_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Packing Code" SortExpression="Id" UniqueName="Id">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Packing Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Product Size">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Literal ID="Literal3" runat="server" Text="Product Size Code"></asp:Literal>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtItemSizeCode" Runat="server"  Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblItemSizeMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literal5" runat="server" Text="Product Size Name"></asp:Literal>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtItemSizeName" Runat="server" Width="250px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnItemSizeNew" runat="server" Text="New" OnClick="btnItemSizeNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnItemSizeSave" runat="server" Text="Save" OnClick="btnItemSizeSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnItemSizeFind" runat="server"  Text="Find" OnClick="btnItemSizeFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnItemSizeEdit" runat="server" Text="Edit" OnClick="btnItemSizeEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnItemSizeDelete" runat="server" OnClick="btnItemSizeDelete_Click" Text="Delete">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnItemSizeCancel" runat="server" Text="Cancel" OnClick="btnItemSizeCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                           
                                <asp:Label ID="lblItemSize" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td>
                                <fieldset>
                                    <legend>All Product Sizes</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgItemSize" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgItemSize_NeedDataSource" PageSize="10" OnSelectedIndexChanged="rgItemSize_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Product Size Id" SortExpression="Id" UniqueName="Id">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Product Size Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Unit/Weight" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label20" runat="server" Text="Weight Code"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <telerik:RadTextBox ID="txtWeightCode" Runat="server" Enabled="False" Width="100px">
                                </telerik:RadTextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="lblWeightMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                </td>
                            <td class="auto-style1">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label21" runat="server" Text="Weight Name"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtWeightName" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Description"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtWeightDesr" Runat="server" TextMode="MultiLine">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnWeightNew" runat="server" Text="New" OnClick="btnWeightNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnWeightSave" runat="server" Text="Save" OnClick="btnWeightSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnWeightFind" runat="server" Text="Find" OnClick="btnWeightFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnWeightEdit" runat="server" Text="Edit" OnClick="btnWeightEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnWeightCancel" runat="server" Text="Cancel" OnClick="btnWeightCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                 <asp:Label ID="lblWeight" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td><fieldset>
                                    <legend>All Unit/Weights</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgWeight"  Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True"  PageSize="5" OnNeedDataSource="rgWeight_NeedDataSource" OnSelectedIndexChanged="rgWeight_SelectedIndexChanged" >
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="WgtId" FilterControlAltText="Filter PI column" HeaderText="Weight Id" SortExpression="WgtId" UniqueName="WgtId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Unit" FilterControlAltText="Filter Name column" HeaderText="Unit/Weight" SortExpression="Unit" UniqueName="Unit">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="Description" UniqueName="Description">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset></td>
                        </tr>
                    </table>
                    
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Item" Visible="False">
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Owner="RadPanelBarItem" 

                Text="Occupation" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" Text="Occupation Code"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtDesignationCode" Runat="server"  Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblDesignationMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label23" runat="server" Text="Occupation Name"></asp:Label>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtDesignationName" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnDesignationNew" runat="server"  Text="New" OnClick="btnDesignationNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDesignationSave" runat="server"  Text="Save" OnClick="btnDesignationSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDesignationFind" runat="server" Text="Find" OnClick="btnDesignationFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDesignationEdit" runat="server" Text="Edit" OnClick="btnDesignationEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDesignationCancel" runat="server" Text="Cancel" OnClick="btnDesignationCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                  <asp:Label ID="lblDesignation" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td><fieldset>
                                    <legend>All Occupations</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgOccupation" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgOccupation_NeedDataSource" PageSize="10" OnSelectedIndexChanged="rgOccupation_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="DesigId" FilterControlAltText="Filter PI column" HeaderText="Occupation Id" SortExpression="DesigId" UniqueName="DesigId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Occupation Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset></td>
                        </tr>
                    </table>
                    
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Department" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Department Code"></asp:Label></td>
                            <td>
                                <telerik:RadTextBox ID="txtDepartmentCode" Runat="server"  Width="80px" Enabled="False">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblDepartmentMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Department Name"></asp:Label></td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtDepartmentName" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnDepartmentNew" runat="server" Text="New" OnClick="btnDepartmentNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDepartmentSave" runat="server" Text="Save" OnClick="btnDepartmentSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDepartmentFind" runat="server" Text="Find" OnClick="btnDepartmentFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDepartmentEdit" runat="server" Text="Edit" OnClick="btnDepartmentEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnDepartmentCancel" runat="server" Text="Cancel" OnClick="btnDepartmentCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblDepartment" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td><fieldset>
                                    <legend>All Departments</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgDepartment" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgDepartment_NeedDataSource" PageSize="10" OnSelectedIndexChanged="rgDepartment_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="DeptId" FilterControlAltText="Filter PI column" HeaderText="Department Id" SortExpression="DeptId" UniqueName="DeptId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Department Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                
                                            </MasterTableView>
                                                
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset></td>
                        </tr>
                    </table>
                    
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="User" Visible="False">
                <ContentTemplate>
                    <table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="User Code"></asp:Label></td>
                            <td>
                                <telerik:RadTextBox ID="txtUserCode" Runat="server" Enabled="False" Width="100px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblUserMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="User Name"></asp:Label></td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtUserName" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnUserNew" runat="server" Text="New">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnUserSave" runat="server" Text="Save">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnUserFind" runat="server" Text="Find">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnUserEdit" runat="server" Text="Edit">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnUserCancel" runat="server" Text="Cancel">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblUser" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Educational Degree" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1" style="width:100%">
                                    <tr>
                                        <td>
                                            <asp:Literal ID="lbldeg" runat="server" Text="Degree Code"></asp:Literal>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtDegreeCode" Runat="server" Width="80px" Enabled="False">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDegreeMode" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal4dd" runat="server" Text="Degree Name"></asp:Literal>
                                        </td>
                                        <td colspan="2">
                                            <telerik:RadTextBox ID="txtDegreeName" Runat="server" Width="200px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="2">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <telerik:RadButton ID="btnDegreeNew" runat="server" OnClick="btnDegreeNew_Click" Text="New">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnDegreeSave" runat="server" OnClick="btnDegreeSave_Click" Text="Save">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnDegreeFind" runat="server" OnClick="btnDegreeFind_Click" Text="Find">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnDegreeEdit" runat="server" OnClick="btnDegreeEdit_Click" Text="Edit">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnDegreeCancel" runat="server" OnClick="btnDegreeCancel_Click" Text="Cancel">
                                            </telerik:RadButton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblDegree" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <fieldset>
                                    <legend>All Degrees</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                        <telerik:RadGrid ID="rgDegree" runat="server" AllowFilteringByColumn="True" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" GridLines="Both" OnNeedDataSource="rgDegree_NeedDataSource" OnSelectedIndexChanged="rgDegree_SelectedIndexChanged" PageSize="5" Width="100%">
                                            <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView BorderWidth="0" Width="100%">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="DegreeId" FilterControlAltText="Filter PI column" HeaderText="Degree ID" SortExpression="DegreeId" UniqueName="DegreeId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Degree Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                            <FilterMenu EnableEmbeddedSkins="False">
                                            </FilterMenu>
                                            <HeaderContextMenu EnableEmbeddedSkins="False">
                                            </HeaderContextMenu>
                                        </telerik:RadGrid>
                                    </div>
                                </fieldset> </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Cost Center">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Literal ID="Literal8" runat="server" Text="Cost Center Code"></asp:Literal>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtCostCode" Runat="server"  Width="80px" Enabled="False">
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
                                        <asp:Literal ID="Literal10" runat="server" Text="Cost Center Alias"></asp:Literal>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="txtCostAlias" Runat="server">
                                            <NegativeStyle Resize="None" />
                                            <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCostMode" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literal9" runat="server" Text="Cost Center Name"></asp:Literal>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtCostName" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnCostNew" runat="server" Text="New" OnClick="btnCostNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCostSave" runat="server" Text="Save" OnClick="btnCostSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCostFind" runat="server"  Text="Find" OnClick="btnCostFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCostEdit" runat="server" Text="Edit" OnClick="btnCostEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCostDelete" runat="server" OnClick="btnCostDelete_Click" Text="Delete">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnCostCancel" runat="server" Text="Cancel" OnClick="btnCostCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                           
                                <asp:Label ID="lblCost" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td>
                                <fieldset>
                                    <legend>All Cost Centers</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgCostCenter" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgCostCenter_NeedDataSource" PageSize="5" OnSelectedIndexChanged="rgCostCenter_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Cost Center Code" SortExpression="Id" UniqueName="Id">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Alias" FilterControlAltText="Filter Alias column" HeaderText="Alias" SortExpression="Alias" UniqueName="Alias">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Cost Center Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Cost Element">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1" style="width:100%">
                                    <tr>
                                        <td>
                                            <asp:Literal ID="lblCostEle" runat="server" Text="Cost Element Code"></asp:Literal>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtCostElementCode" Runat="server" Width="80px" Enabled="False">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="lblCostEle0" runat="server" Text="Cost Element Alias"></asp:Literal>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtCostElementAlias" Runat="server">
                                                <NegativeStyle Resize="None" />
                                                <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCostElementMode" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal559" runat="server" Text="Cost Element Name"></asp:Literal>
                                        </td>
                                        <td colspan="2">
                                            <telerik:RadTextBox ID="txtCostElementName" Runat="server" Width="200px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal560" runat="server" Text="Cost Center Name"></asp:Literal>
                                        </td>
                                        <td colspan="2">
                                            <telerik:RadComboBox ID="cmCostCenter" Runat="server" DataSourceID="dsCostCenter" DataTextField="Name" DataValueField="Id" EmptyMessage="Select Cost Center" Width="200px">
                                            </telerik:RadComboBox>
                                            <asp:SqlDataSource ID="dsCostCenter" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT * FROM [tblCostCenters]"></asp:SqlDataSource>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="2">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <telerik:RadButton ID="btnCostElementNew" runat="server" Text="New" OnClick="btnCostElementNew_Click">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnCostElementSave" runat="server" Text="Save" OnClick="btnCostElementSave_Click">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnCostElementFind" runat="server" Text="Find" OnClick="btnCostElementFind_Click">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnCostElementEdit" runat="server" Text="Edit" OnClick="btnCostElementEdit_Click">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnCostElementDelete" runat="server" OnClick="btnCostElementDelete_Click" Text="Delete">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnCostElementCancel" runat="server" Text="Cancel" OnClick="btnCostElementCancel_Click">
                                            </telerik:RadButton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblCostElement" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <fieldset>
                                    <legend>All Cost Elements</legend>
                                    <div style="overflow:scroll;width:auto">
                                        <telerik:RadGrid ID="rgCostElements" runat="server" AllowFilteringByColumn="True" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" GridLines="Both" Height="200px" OnNeedDataSource="rgCostElements_NeedDataSource" OnSelectedIndexChanged="rgCostElements_SelectedIndexChanged" PageSize="5" Width="100%">
                                            <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView BorderWidth="0" Width="100%">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Cost Element Code" SortExpression="Id" UniqueName="Id">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Alias" FilterControlAltText="Filter Alias column" HeaderText="Alias" SortExpression="Alias" UniqueName="Alias">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Cost Element Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="CostCenterID" Display="False" FilterControlAltText="Filter CostCenterID column" HeaderText="Cost Center ID" SortExpression="CostCenterID" UniqueName="CostCenterID">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                            <FilterMenu EnableEmbeddedSkins="False">
                                            </FilterMenu>
                                            <HeaderContextMenu EnableEmbeddedSkins="False">
                                            </HeaderContextMenu>
                                        </telerik:RadGrid>
                                    </div>
                                </fieldset> </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Visible="false" Text="Region">
                    <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    <table class="style1" style="width:100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label118" runat="server" Text="Region Code"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtRegionCode" Runat="server" Enabled="False" Width="80px">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblRegionMode" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label119" runat="server" Text="Region Name"></asp:Label>
                                            </td>
                                            <td colspan="2">
                                                <telerik:RadTextBox ID="txtRegionName" Runat="server">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="2">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <telerik:RadButton ID="btnRegionNew" runat="server" OnClick="btnRegionNew_Click" Text="New">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnRegionSave" runat="server" OnClick="btnRegionSave_Click" Text="Save">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnRegionFind" runat="server" OnClick="btnRegionFind_Click" Text="Find">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnRegionEdit" runat="server" OnClick="btnRegionEdit_Click" Text="Edit">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnRegionCancel" runat="server" OnClick="btnRegionCancel_Click" Text="Cancel">
                                                </telerik:RadButton>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblRegion" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <fieldset>
                                        <legend>All Regions</legend>
                                        <div style="overflow:scroll;height:200px;width:auto">
                                            <telerik:RadGrid ID="rgRegion" runat="server" AllowFilteringByColumn="True" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" GridLines="Both" Height="200px" OnNeedDataSource="rgRegion_NeedDataSource" OnSelectedIndexChanged="rgRegion_SelectedIndexChanged" PageSize="5" Width="100%">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                                <clientsettings enablepostbackonrowclick="True" selecting-allowrowselect="true">
                                                    <Selecting AllowRowSelect="True" />
                                                </clientsettings>
                                                <HeaderStyle CssClass="RadGridHeader" />
                                                <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                <ItemStyle CssClass="RadGridItem" />
                                                <mastertableview borderwidth="0" width="100%">
                                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                    <rowindicatorcolumn filterimageurl="Filter.gif" sortascimageurl="SortAsc.gif" sortdescimageurl="SortDesc.gif">
                                                    </rowindicatorcolumn>
                                                    <expandcollapsecolumn collapseimageurl="SingleMinus.gif" expandimageurl="SinglePlus.gif" filterimageurl="Filter.gif" sortascimageurl="SortAsc.gif" sortdescimageurl="SortDesc.gif">
                                                    </expandcollapsecolumn>
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="RegionId" FilterControlAltText="Filter RegionId column" HeaderText="Region Id" SortExpression="RegionId" UniqueName="RegionId">
                                                            <columnvalidationsettings>
                                                                <ModelErrorMessage Text="" />
                                                            </columnvalidationsettings>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Region Name" SortExpression="Name" UniqueName="Name">
                                                            <columnvalidationsettings>
                                                                <ModelErrorMessage Text="" />
                                                            </columnvalidationsettings>
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                    <editformsettings>
                                                        <editcolumn cancelimageurl="Cancel.gif" filterimageurl="Filter.gif" insertimageurl="Update.gif" sortascimageurl="SortAsc.gif" sortdescimageurl="SortDesc.gif" updateimageurl="Update.gif">
                                                        </editcolumn>
                                                    </editformsettings>
                                                </mastertableview>
                                                <filtermenu enableembeddedskins="False">
                                                </filtermenu>
                                                <headercontextmenu enableembeddedskins="False">
                                                </headercontextmenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </fieldset></td>
                            </tr>
                        </table>
                    </ContentTemplate>               
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Visible="false" Text="Area">
                <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    <table class="style1" style="width:100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label116" runat="server" Text="Area Code"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtAreaCode" Runat="server" Enabled="False" Width="80px">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblAreaMode" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label117" runat="server" Text="Area Name"></asp:Label>
                                            </td>
                                            <td colspan="2">
                                                <telerik:RadTextBox ID="txtAreaName" Runat="server">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1117" runat="server" Text="Region Name"></asp:Label>
                                            </td>
                                            <td colspan="2">
                                                <telerik:RadComboBox ID="cmRegion" Runat="server" DataSourceID="dsRegion" DataTextField="Name" DataValueField="RegionId" EmptyMessage="Select Region" Filter="Contains">
                                                </telerik:RadComboBox>
                                                <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT [RegionId], [Name] FROM [tblRegion]"></asp:SqlDataSource>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="2">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <telerik:RadButton ID="btnAreaNew" runat="server" OnClick="btnAreaNew_Click" Text="New">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnAreaSave" runat="server" OnClick="btnAreaSave_Click" Text="Save">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnAreaFind" runat="server" OnClick="btnAreaFind_Click" Text="Find">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnAreaEdit" runat="server" OnClick="btnAreaEdit_Click" Text="Edit">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="btnAreaCancel" runat="server" OnClick="btnAreaCancel_Click" Text="Cancel">
                                                </telerik:RadButton>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblArea" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <fieldset>
                                        <legend>All Areas</legend>
                                        <div style="overflow:scroll;height:200px;width:auto">
                                            <telerik:RadGrid ID="rgArea" runat="server" AllowFilteringByColumn="True" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" GridLines="Both" Height="200px" OnNeedDataSource="rgArea_NeedDataSource" OnSelectedIndexChanged="rgArea_SelectedIndexChanged" Width="100%">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                                <clientsettings enablepostbackonrowclick="True" selecting-allowrowselect="true">
                                                    <Selecting AllowRowSelect="True" />
                                                </clientsettings>
                                                <HeaderStyle CssClass="RadGridHeader" />
                                                <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                <ItemStyle CssClass="RadGridItem" />
                                                <mastertableview borderwidth="0" width="100%">
                                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                    <rowindicatorcolumn filterimageurl="Filter.gif" sortascimageurl="SortAsc.gif" sortdescimageurl="SortDesc.gif">
                                                    </rowindicatorcolumn>
                                                    <expandcollapsecolumn collapseimageurl="SingleMinus.gif" expandimageurl="SinglePlus.gif" filterimageurl="Filter.gif" sortascimageurl="SortAsc.gif" sortdescimageurl="SortDesc.gif">
                                                    </expandcollapsecolumn>
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="AreaId" FilterControlAltText="Filter AreaId column" HeaderText="Area Id" SortExpression="AreaId" UniqueName="AreaId">
                                                            <columnvalidationsettings>
                                                                <ModelErrorMessage Text="" />
                                                            </columnvalidationsettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Area Name" SortExpression="Name" UniqueName="Name">
                                                            <columnvalidationsettings>
                                                                <ModelErrorMessage Text="" />
                                                            </columnvalidationsettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="RegionId" Display="False" FilterControlAltText="Filter RegionId column" HeaderText="Region" SortExpression="RegionId" UniqueName="RegionId">
                                                            <columnvalidationsettings>
                                                                <ModelErrorMessage Text="" />
                                                            </columnvalidationsettings>
                                                            <columnvalidationsettings>
                                                                <ModelErrorMessage Text="" />
                                                            </columnvalidationsettings>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                    <editformsettings>
                                                        <editcolumn cancelimageurl="Cancel.gif" filterimageurl="Filter.gif" insertimageurl="Update.gif" sortascimageurl="SortAsc.gif" sortdescimageurl="SortDesc.gif" updateimageurl="Update.gif">
                                                        </editcolumn>
                                                    </editformsettings>
                                                </mastertableview>
                                                <filtermenu enableembeddedskins="False">
                                                </filtermenu>
                                                <headercontextmenu enableembeddedskins="False">
                                                </headercontextmenu>
                                            </telerik:RadGrid>
                                        </div>
                                    </fieldset></td>
                            </tr>
                        </table>
                    </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Visible="false" Text="Teritory">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1" style="width:100%">
                                    <tr>
                                        <td>
                                            <asp:Literal ID="lblTeritoryCode" runat="server" Text="Teritory Code"></asp:Literal>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtTeritoryCode" Runat="server" Enabled="False" Width="80px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblTeritoryMode" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal123" runat="server" Text="Teritory Name"></asp:Literal>
                                        </td>
                                        <td colspan="2">
                                            <telerik:RadTextBox ID="txtTeritoryName" Runat="server" Width="200px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal320" runat="server" Text="Area Name"></asp:Literal>
                                        </td>
                                        <td colspan="2">
                                            <telerik:RadComboBox ID="cmArea" Runat="server" DataSourceID="dsArea" DataTextField="Name" DataValueField="AreaId" EmptyMessage="Select Area" Width="200px">
                                            </telerik:RadComboBox>
                                            <asp:SqlDataSource ID="dsArea" runat="server" ConnectionString="<%$ ConnectionStrings:SalesMSConnectionString %>" SelectCommand="SELECT * FROM [tblArea]"></asp:SqlDataSource>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="2">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <telerik:RadButton ID="btnTeritoryNew" runat="server" OnClick="btnTeritoryNew_Click" Text="New">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnTeritorySave" runat="server" OnClick="btnTeritorySave_Click" Text="Save">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnTeritoryFind" runat="server" OnClick="btnTeritoryFind_Click" Text="Find">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnTeritoryEdit" runat="server" OnClick="btnTeritoryEdit_Click" Text="Edit">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnTeritoryDelete" runat="server" OnClick="btnTeritoryDelete_Click" Text="Delete">
                                            </telerik:RadButton>
                                            <telerik:RadButton ID="btnTeritoryCancel" runat="server" OnClick="btnTeritoryCancel_Click" Text="Cancel">
                                            </telerik:RadButton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblTeritory" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <fieldset>
                                    <legend>All Teritories</legend>
                                    <div style="overflow:scroll;width:auto">
                                        <telerik:RadGrid ID="rgTeritorys" runat="server" AllowFilteringByColumn="True" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" GridLines="Both" Height="200px" OnNeedDataSource="rgTeritorys_NeedDataSource" OnSelectedIndexChanged="rgTeritorys_SelectedIndexChanged" PageSize="5" Width="100%">
                                            <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView BorderWidth="0" Width="100%">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="TeritoryId" FilterControlAltText="Filter TeritoryId column" HeaderText="Teritory Code" SortExpression="TeritoryId" UniqueName="TeritoryId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText=" Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="AreaId" Display="False" FilterControlAltText="Filter AreaId column" HeaderText="AreaId" SortExpression="AreaId" UniqueName="AreaId">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                            </MasterTableView>
                                            <FilterMenu EnableEmbeddedSkins="False">
                                            </FilterMenu>
                                            <HeaderContextMenu EnableEmbeddedSkins="False">
                                            </HeaderContextMenu>
                                        </telerik:RadGrid>
                                    </div>
                                </fieldset> </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
    </telerik:RadPanelBar>

    &nbsp;</div>
    </form>
</body>
</html>
