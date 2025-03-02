﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accDebitVoucher.aspx.cs" Inherits="AccountingManagementSystem.Forms.accDebitVoucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style4 {
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 214px;
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
         <h1 style="background-color:blue;color:white" >Debit Voucher</h1>
    <div>
    <table class="auto-style1" style="width: 100%">
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblVoucherType" runat="server" ForeColor="Green" Font-Size="Large"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width:120px">
                    <asp:Label ID="Label1" runat="server" Text="Voucher Type"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmVoucherType" Runat="server" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="cmVoucherType_SelectedIndexChanged" EmptyMessage="Select">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="CP" Value="CP" />
                            <telerik:RadComboBoxItem runat="server" Text="BP" Value="BP" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
                <td style="width:120px">
                    <asp:Label ID="Label7" style="float:right" runat="server" Text="Voucher No"></asp:Label>
                </td>
                <td>
                    <telerik:RadNumericTextBox ID="txtVoucherNo" Runat="server" AutoPostBack="True" OnTextChanged="txtVoucherNo_TextChanged" TabIndex="1" Width="100px">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                    </telerik:RadNumericTextBox>
                </td>
                <td>
                   <asp:Label ID="Label8" style="float:right" runat="server" Text="Date" ></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="dpVouDate" Runat="server" Culture="en-US" TabIndex="2" Width="100px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" TabIndex="2">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" TabIndex="2"></DatePopupButton>
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <fieldset>
                        <legend>Credit From</legend>
                        <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">
                    <asp:Label ID="Label22" runat="server" Text="Select Credit"></asp:Label>
                            </td>
                            <td class="auto-style5">
                    <asp:Label ID="Label18" runat="server" Text="Credit Code"></asp:Label>
                            </td>
                            <td class="auto-style5">
                    <asp:Label ID="Label11" runat="server" Text="Cheque No"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <telerik:RadComboBox ID="cmCredit" EnableLoadOnDemand="true" DropDownWidth="350px" Filter="Contains" Runat="server" OnItemsRequested="cmCredit_ItemsRequested" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="cmCredit_SelectedIndexChanged" TabIndex="3">
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
                            </td>
                            <td class="auto-style4">
                    <telerik:RadTextBox ID="txtCreditCode" Runat="server" Width="80px" TabIndex="4">
                    </telerik:RadTextBox>
                            </td>
                            <td>
                    <telerik:RadTextBox ID="txtCheckNo" Runat="server" TabIndex="5" Width="150px" Enabled="False">
                    </telerik:RadTextBox>
                                <asp:HiddenField ID="txtTrackingID" runat="server" Value="0" />
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                    
                </td>
            </tr>
        <tr>
                <td colspan="6">
                    <fieldset>
                        <legend>Debit To</legend>
                        <table class="auto-style1">
                        <tr>
                            <td class="auto-style6">
                    <asp:Label ID="Label23" runat="server" Text="Select Debit"></asp:Label>
                            </td>
                            <td class="auto-style4">
                    <asp:Label ID="Label13" runat="server" Text="Debit Code"></asp:Label>
                            </td>
                            <td>
                    <asp:Label ID="Label14" runat="server" Text="Debit Amount"></asp:Label>
                            </td>
                            <td>
                    <asp:Label ID="Label15" runat="server" Text="Credit Amount"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <telerik:RadComboBox ID="cmDebit" EnableLoadOnDemand="true" DropDownWidth="350px" Filter="Contains" Runat="server" Width="100%" OnItemsRequested="cmDebit_ItemsRequested" AutoPostBack="True" OnSelectedIndexChanged="cmDebit_SelectedIndexChanged" TabIndex="6">
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
                            </td>
                            <td class="auto-style4">
                    <telerik:RadTextBox ID="txtDebitCodeParticular" Runat="server" Width="80px" TabIndex="7">
                    </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadNumericTextBox ID="txtDebitAmount" Runat="server" Width="100%" TabIndex="8" AutoPostBack="True" OnTextChanged="txtDebitAmount_TextChanged">
                                </telerik:RadNumericTextBox>
                            </td>
                            <td>
                                <telerik:RadNumericTextBox ID="txtCreditAmount" Runat="server" Width="100%" ReadOnly="True" TabIndex="9">
                                </telerik:RadNumericTextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style4" colspan="4">
                    <asp:Label ID="Label19" runat="server" Text="Narration"></asp:Label>
                    &nbsp;<telerik:RadTextBox ID="txtNarattion" Runat="server" Width="90%" TabIndex="14" OnTextChanged="txtNarattion_TextChanged" TextMode="MultiLine">
                    </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" colspan="4">
                 <div style="height:200px;overflow:scroll">
                     <telerik:RadGrid ID="RadGrid1" Width="100%" ShowFooter="True" Height="200px" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False"  OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged">
                         <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                            <Selecting AllowRowSelect="True" />
                                <Scrolling UseStaticHeaders="True" />
                            </ClientSettings>
                        <MasterTableView ShowFooter="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="rowid" FilterControlAltText="Filter rowid column" HeaderText="S/N" SortExpression="rowid" UniqueName="rowid" DataType="System.Int32">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="track_id" Display="False" FilterControlAltText="Filter track_id column" HeaderText="track_id" SortExpression="track_id" UniqueName="track_id">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Particulars" FilterControlAltText="Filter Particulars column" HeaderText="Particulars" SortExpression="Particulars" UniqueName="Particulars">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Debit" FilterControlAltText="Filter Debit column" HeaderText="Debit" SortExpression="Debit" UniqueName="Debit" DataType="System.Decimal" DataFormatString="{0:F2}">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Credit" FilterControlAltText="Filter Credit column" HeaderText="Credit" SortExpression="Credit" UniqueName="Credit" DataType="System.Decimal" DataFormatString="{0:F2}">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Narration" FilterControlAltText="Filter Narration column" HeaderText="Narration" SortExpression="Narration" UniqueName="Narration">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ParticularCode" Display="False" FilterControlAltText="Filter ParticularCode column" HeaderText="Particular Code" SortExpression="ParticularCode" UniqueName="ParticularCode">
<ColumnValidationSettings>
<ModelErrorMessage Text=""></ModelErrorMessage>
</ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="post_state" FilterControlAltText="Filter post_state column" HeaderText="State" SortExpression="post_state" UniqueName="post_state">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="Delete" FilterControlAltText="Filter Delete column" HeaderText="Delete" SortExpression="Delete" UniqueName="Delete">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="DeleteTextBox" runat="server" Text='<%# Bind("Delete") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="rbtDeleteGrid" runat="server" ImageUrl="~/Images/Delete.png" OnClick="rbtDeleteGrid_Click" TabIndex="5" ToolTip="Delete" CommandName="GridDelete" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="OfficeName" Display="False" FilterControlAltText="Filter OfficeName column" HeaderText="OfficeName" SortExpression="OfficeName" UniqueName="OfficeName">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Department" Display="False" FilterControlAltText="Filter Department column" HeaderText="Department" SortExpression="Department" UniqueName="Department">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DepartmentName" Display="False" FilterControlAltText="Filter DepartmentName column" HeaderText="DepartmentName" SortExpression="DepartmentName" UniqueName="DepartmentName">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="salesmancode" Display="False" FilterControlAltText="Filter salesmancode column" HeaderText="salesmancode" SortExpression="salesmancode" UniqueName="salesmancode">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Emp_nam" Display="False" FilterControlAltText="Filter Emp_nam column" HeaderText="Emp_nam" SortExpression="Emp_nam" UniqueName="Emp_nam">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                 </div>
                    
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                    
                </td>
            </tr>
            
            
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsProject" runat="server" ConnectionString="<%$ ConnectionStrings:AccountingManagementSystemConnectionString %>" SelectCommand="SELECT [prj_code], [prj_name] FROM [project]"></asp:SqlDataSource>
                </td>
                <td>
                                <telerik:RadNumericTextBox ID="txtTotalDebit" Runat="server" Width="100px" ReadOnly="True" TabIndex="25">
                                </telerik:RadNumericTextBox>
                </td>
                <td>
                                <telerik:RadNumericTextBox ID="txtTotalCredit" Runat="server" Width="100px" ReadOnly="True" TabIndex="26">
                                </telerik:RadNumericTextBox>
                </td>
            </tr>
            
            
            <tr>
                <td class="auto-style2" colspan="6"><telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" TabIndex="17">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" TabIndex="15">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnPosting" runat="server" Text="Posting" OnClick="btnPosting_Click" TabIndex="16">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnNext" runat="server" Text="&gt;&gt;&gt;" OnClick="btnNext_Click" TabIndex="18">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnPrevious" runat="server" Text="&lt;&lt;&lt;" OnClick="btnPrevious_Click" TabIndex="19">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" TabIndex="22">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" TabIndex="23">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" TabIndex="24">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnPreview" runat="server" Text="Print Preview" OnClick="btnPreview_Click" TabIndex="20">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnPreviewAll" runat="server" Text="Print Preview (All)" OnClick="btnPreviewAll_Click" TabIndex="20">
                            </telerik:RadButton></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
