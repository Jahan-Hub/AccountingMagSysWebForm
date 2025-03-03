<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AccountingManagementSystem.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" id="telerikClientEvents1">      
</script>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-repeat: no-repeat; background-position: center;">
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <div id="banner">
            <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
        </div>
        <br />
        <br />
        <br />
        <br />

        <telerik:RadAjaxManager runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="MainMenu">
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <div id="leftmenu">
            <telerik:RadPanelBar ID="MainMenu" runat="server"
                OnItemClick="MainMenu_ItemClick1">
                <Items>

                    <telerik:RadPanelItem runat="server" Text="Settings" PostBack="False"
                        ImageUrl="~/PNG/Home.png">
                        <Items>
                            <telerik:RadPanelItem runat="server" Text="Company Info"
                                onclick="dept_Click">
                            </telerik:RadPanelItem>
                            <telerik:RadPanelItem runat="server" Text="Dashboard">
                            </telerik:RadPanelItem>
                            <telerik:RadPanelItem runat="server" Text="DB Backup">
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelItem>

                    <telerik:RadPanelItem runat="server" Text="Chart Of Accounts" ImageUrl="~/PNG/Files.png">
                    </telerik:RadPanelItem>

                    <telerik:RadPanelItem runat="server" Text="Debit Voucher" ImageUrl="~/PNG/Money.png">
                    </telerik:RadPanelItem>

                    <telerik:RadPanelItem runat="server" Text="Credit Voucher" ImageUrl="~/PNG/Gold Bar.png">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Journal Voucher" ImageUrl="~/PNG/Notes.png">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Opening Balance" ImageUrl="~/PNG/Coin.png">
                    </telerik:RadPanelItem>

                    <telerik:RadPanelItem runat="server" Text="Reports" ImageUrl="~/PNG/Preview.png" PostBack="False">
                        <Items>
                            <telerik:RadPanelItem runat="server" Text="Transaction Entry">
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelBar>

        </div>
        <div id="divDateTime" style="float: left; margin: -89px 200px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    <asp:Label ID="lblDateTime" runat="server" ForeColor="Crimson"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Timer ID="Timer1" runat="server" Interval="1000">
            </asp:Timer>
        </div>

        <div id="divWelcome" style="float: left; margin: -89px 300px">
            <asp:Label ID="lblWelcome" ForeColor="Crimson" runat="server"></asp:Label>
        </div>
        <div id="divGreetings" style="float: left; margin: -89px 550px">
            <asp:Label ID="lblGreetings" ForeColor="Green" runat="server"></asp:Label>
        </div>
        <div id="divDayName" style="float: left; margin: -89px 750px">
            <asp:Label ID="lblDayName" ForeColor="Crimson" runat="server"></asp:Label>
        </div>
        <div id="divLogOut" style="float: right; margin: -89px 0px">
            <asp:HyperLink ID="btnLogin" Font-Underline="false" ForeColor="#0000cc" runat="server" NavigateUrl="~/LogIn.aspx">Log Out</asp:HyperLink>
        </div>

        <div id="container" style="width: 88%">
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%" Height="100%">
                <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" Height="100%">
                    <telerik:RadPane ID="RadPane2" runat="server" Width="100%" Height="100%">
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadAjaxPanel>
        </div>
    </form>
</body>

</html>
<script type="text/javascript">
    var myDate = new Date();
    var hrs = myDate.getHours();
    var greet;
    if (hrs < 12)
        greet = 'Good Morning';
    else if (hrs >= 12 && hrs <= 17)
        greet = 'Good Afternoon';
    else if (hrs >= 17 && hrs <= 24)
        greet = 'Good Evening';
    document.getElementById('lblGreetings').innerHTML = greet;
</script>
