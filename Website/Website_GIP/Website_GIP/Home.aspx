<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Luchtkwaliteit</title>

    <style type="text/css">
        .auto-style1 {
            width: 1300px;
        }
        .auto-style2 {
            width: 1300px;
            height: 500px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div>
            <table>
                <tr>
                    <td class="auto-style1">

                        <asp:Menu ID="Menu" runat="server" ForeColor="Blue" Orientation="Horizontal">
                            <Items>
                                <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home" Value="Home"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#3366FF" />
                            <StaticMenuItemStyle BackColor="#3399FF" Font-Bold="True" ForeColor="#000066" />
                        </asp:Menu>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
