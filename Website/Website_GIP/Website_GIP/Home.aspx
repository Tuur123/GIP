<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset='utf-8' />
    <title>Luchtkwaliteit</title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="map.js"></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>

<body onload="drawMap(document.getElementById('<%= TbUser.ClientID %>').value)">
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="header">
            <asp:ImageButton ID="home" runat="server"
                ImageUrl="logo_Luchtkwaliteit.png"
                OnClick="ImageButton_Click" />
        </div>
        <div class="topnav">
        </div>
        <div class="row">
            <div class="leftcolumn">
                <div class="card">
                    <div id='map'></div>                
                </div>
                <div class="card">
                    <h2>Grafieken</h2>
                    <asp:Chart ID="ChartTempHumi" runat="server" DataSourceID="DbCharts" Width="900px" BackColor="DarkGray" BackGradientStyle="TopBottom" BackImageTransparentColor="255, 224, 192" BorderlineColor="Transparent">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                            <asp:Series ChartType="Spline" Name="Temperatuur" XValueMember="Tijd" IsXValueIndexed="true" YValueMembers="Temperatuur">
                            </asp:Series>
                            <asp:Series ChartType="Spline" Name="Vochtigheid" XValueMember="Tijd" IsXValueIndexed="true" YValueMembers="Vochtigheid">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Interval="50"></AxisX>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:Chart ID="ChartCO2" runat="server" DataSourceID="DbCharts" Width="900px" BackColor="DarkGray" BackGradientStyle="TopBottom" BackImageTransparentColor="255, 224, 192" BorderlineColor="Transparent">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                             <asp:Series ChartType="Spline" Name="CO2" XValueMember="Tijd" IsXValueIndexed="true" YValueMembers="CO2">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Interval="50"></AxisX>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="DbCharts" runat="server" ConnectionString="<%$ ConnectionStrings:connectionStringArthur %>" ProviderName="<%$ ConnectionStrings:connectionStringArthur.ProviderName %>" SelectCommand="SELECT [Vochtigheid], [CO2], [Temperatuur], [Lichtsterkte], [Tijd] FROM [Waardes] WHERE ([Gebruiker] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TbUser" DefaultValue="ruben" Name="Gebruiker" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="rightcolumn">
                <div class="card">
                    <asp:TextBox ID="TbUser" runat="server" Width="100%">gebruikersnaam</asp:TextBox>
                    <br />
                    <br />
                    <asp:TextBox ID="TbPassword" runat="server" TextMode="Password" Width="100%">Wachtwoord</asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="BtnLogin" runat="server" Text="Login" Width="75%" OnClick="BtnLogin_Click" />
                    <br />
                    <br />
                    <asp:Button ID="BtnRegister" runat="server" Text="Registreer" Width="75%" OnClick="BtnRegister_Click" />
                    <br />
                    <br />
                    <asp:Label ID="LblUser" runat="server" Text="Log in om persoonlijke metingen te zien!"></asp:Label>
                </div>
                <div class="card">
                    <article class="ac-aircheckr-widget"
                        data-current-location="undifined" data-level="street" data-locale="nl_BE" data-theme="dark"
                        data-timestamp="undefined"
                        data-token="eyJhbGciOiJIUzI1NiJ9.ZTdlODJjZDAtMzY3Zi0xMWU5LWE3MDktMTEyNWJmZDZhNDQw.NuqhuUSOoPgknpqL2zNb3CREAdFiLBDLB_NpDcBuobU" data-type="extended">
                    </article>
                    <script src="https://widget.aircheckr.com/js/client.widget.js"></script>
                </div>
                <div class="card">
                    <h1>Gemeten DATA via van SD kaart:</h1>
                    <input id="oFile" type="file" runat="server"  name="oFile"/>
                    <asp:button id="btnUpload" type="submit" text="Upload" runat="server" OnClick="btnUpload_Click"></asp:button>
                    <asp:Panel ID="frmConfirmation" Visible="False" Runat="server">
                    <asp:Label id="lblUploadResult" Runat="server"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="footer">
            <h2>Footer</h2>
            <asp:Button ID="BtnOverons" runat="server" Text="Over ons" Width="75%" OnClick="BtnOverons_Click" />
        </div>
    </form>
</body>
</html>