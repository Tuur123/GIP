<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Luchtkwaliteit</title>
    <link rel="stylesheet" href="styles.css" />
</head>

<body>  
    <form id="form1" runat="server">
    <div>
        <table class="mainTable">
        <tr>
            <td class="banner">
                <table class="header">
                    <tr>
                        <td style="width: 70%;">
                            <asp:Image ID="ImgBanner" runat="server" ImageUrl="~/logo.jpg" ImageAlign="Left" Width="100%"/>
                        </td>
                        <td style="width: 10%">                            
                            <table class="login">
                                <tr>
                                    <td><asp:TextBox ID="TbUser" runat="server" EnableViewState="true">Username</asp:TextBox>
                            </td>
                                </tr>
                                <tr>
                                    <td><asp:TextBox ID="TbPassword" runat="server" TextMode="Password" TabIndex="1">Password</asp:TextBox></td>
                                </tr>
                            </table>                            
                        </td>
                        <td style="width: 10%">
                            <asp:Button ID="BtnLogin" runat="server" Font-Names="Arial Black" Height="50px" Text="Login" Width="100px" OnClick="BtnLogin_Click"/>
                        </td>
                        <td style="width: 10%">
                            <asp:Button ID="BtnRegister" runat="server" Font-Names="Arial Black" Height="50px" Text="Register" Width="100px" OnClick="BtnRegister_Click"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="mainPage">
                <table class="elements">
                    <tr>
                        <td class="settings"></td>
                        <td class="map">&nbsp;</td>
                        <td class="data">
                            <table class="charts">
                                <tr>
                                    <td>
                                        <asp:Label ID="LblUser" runat="server" Text="User:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="LblData" runat="server" Text="Metingen:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Chart ID="ChartTemp" runat="server" DataSourceID="Database" Height="200px">
                                            <series>
                                                <asp:Series ChartType="Spline" Name="Series1" XValueMember="Tijd" YValueMembers="Temperatuur">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                        <asp:SqlDataSource ID="Database" runat="server" ConnectionString="<%$ ConnectionStrings:test %>" ProviderName="<%$ ConnectionStrings:test.ProviderName %>" SelectCommand="SELECT [Tijd], [Temperatuur], [Vochtigheid], [CO2], [Lichtsterkte] FROM [Waardes] WHERE ([Gebruiker] = ?)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="TbUser" Name="Gebruiker" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:Chart ID="ChartLicht" runat="server" Height="200px" DataSourceID="Database">
                                            <series>
                                                <asp:Series Name="Series1" ChartType="Spline" XValueMember="Tijd" YValueMembers="Lichtsterkte">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Chart ID="ChartVocht" runat="server" Height="200px" DataSourceID="Database">
                                            <series>
                                                <asp:Series Name="Series1" ChartType="Spline" XValueMember="Tijd" YValueMembers="Vochtigheid">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                    </td>
                                    <td>
                                        <asp:Chart ID="ChartCO2" runat="server" Height="200px" DataSourceID="Database">
                                            <series>
                                                <asp:Series Name="Series1" ChartType="Spline" XValueMember="Tijd" YValueMembers="CO2">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>                           
        </tr>
        <tr>
            <td class="footer"></td>                        
        </tr>
    </table>
    </div>  
    </form>
</body>
</html>
