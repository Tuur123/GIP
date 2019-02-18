<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset='utf-8' />
    <title>Luchtkwaliteit</title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>

<body>
    <form id="form1" runat="server">
        <table class="mainTable">
            <tr>
                <td>
                    <table class="mainTable">
                        <tr class="logo">
                            <td style="width: 70%; background-color: #7499A9">                      
                                <img src="cloud_animation.png" class="logoAnimation"/>
                            </td>
                            <td>
                                <table class="mainTable">
                                    <tr>
                                        <td style="width: 50%">
                                            <asp:TextBox ID="TbUser" runat="server" Width="100%">Username</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnLogin" runat="server" Text="Login" Width="100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TbPassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnRegister" runat="server" Text="Register" Width="100%" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="mainTable">
                        <tr>
                            <td style="width: 70%">
                                <div id='map'></div>
                                <script src="Maps.js"></script>
                            </td>
                            <td>
                                <table class="mainTable">
                                    <tr>
                                        <td>
                                            <table class="mainTable">
                                                <tr>
                                                    <td style="width: 50%">
                                                        <asp:Label ID="LblUser" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
