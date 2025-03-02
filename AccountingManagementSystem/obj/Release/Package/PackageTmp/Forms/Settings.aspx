<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="SalesMS.Forms.Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 24px;
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
        <h1>Company Setting</h1>
        <div>
            <table class="auto-style1" border="1" style="width: 50%;border-color:gray">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Invoice Header"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkInvoiceHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkInvoiceHeader_CheckedChanged" />
                        
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0066"></asp:Label>
        </div>
    </form>
</body>
</html>