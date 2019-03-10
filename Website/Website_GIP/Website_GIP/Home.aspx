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
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>

<body>
    <form id="form1" runat="server">
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
                    <!--<script src="map.js"></script>-->
                    <script>mapboxgl.accessToken = 'pk.eyJ1IjoicnViZW5hcnRodXIiLCJhIjoiY2pycXR6dnljMGJ3NDN5cGV5dGRlOWpqcSJ9.IeEQqzqf_kgs8J3rj2U5xw';

                        var map = new mapboxgl.Map({
                            container: 'map',
                            style: 'mapbox://styles/mapbox/streets-v9',
                            center: [4.471421, 51.386688],
                            zoom: 10
                        });

                        // Code voor de marker
                        var geojson = {
                            type: 'FeatureCollection',
                            features: [{
                                type: 'Feature',
                                geometry: {
                                    type: 'Point',
                                    coordinates: [("<%=result[0] %>").valueOf(), ("<%=result[1] %>").valueOf()]
                                },
                                properties: {
                                    title: 'Meeting door: ' + ("<%=result[2] %>").valueOf(),
                                    description: 'Temperatuur: ' + ("<%=result[4] %>").valueOf()
                                        + '<br\>Vochtigheid: ' + ("<%=result[3] %>").valueOf()
                                        + '<br\>CO²: ' + ("<%=result[5] %>").valueOf()
                                        + '<br\>Lichtsterkte: ' + ("<%=result[6] %>").valueOf()
                                        + '<br\>Tijd van meting: ' + ("<%=result[7] %>").valueOf()
                                }
                            },
                                {
                                    type: 'Feature',
                                    geometry: {
                                        type: 'Point',
                                        coordinates: [4, 51]
                                    },
                                    properties: {
                                    title: 'Meeting door: ' + ("<%=result[2] %>").valueOf(),
                                    description: 'Temperatuur: ' + ("<%=result[4] %>").valueOf()
                                        + '<br\>Vochtigheid: ' + ("<%=result[3] %>").valueOf()
                                        + '<br\>CO²: ' + ("<%=result[5] %>").valueOf()
                                        + '<br\>Lichtsterkte: ' + ("<%=result[6] %>").valueOf()
                                        + '<br\>Tijd van meting: ' + ("<%=result[7] %>").valueOf()
                                }
                                }]
                        };
                        
                        // haalt de markers uit de JSON file, elke 'feature' is een marker
                        geojson.features.forEach(function (marker) {
                            // HTML element maken voor elke feature
                            var el = document.createElement('div');
                            el.className = 'marker';

                            // voor elke feature een marker maken en op de map tonen
                            new mapboxgl.Marker(el).setLngLat(marker.geometry.coordinates).setPopup(new mapboxgl.Popup({ offset: 25 })
                                .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>')).addTo(map);
                        });
                        //control voor navigatie
                        map.addControl(new mapboxgl.NavigationControl());</script>
                </div>
                <div class="card">
                    <h2>Grafieken</h2>
                    <asp:Chart ID="ChartTemp" runat="server" DataSourceID="Db" Width="1090px">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                            <asp:Series ChartType="Spline" Name="Temperatuur" XValueMember="Tijd" IsXValueIndexed="true" YValueMembers="Temperatuur">
                            </asp:Series>
                            <asp:Series ChartType="Spline" Name="Vochtigheid" XValueMember="Tijd" YValueMembers="Vochtigheid">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Interval="50"></AxisX>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="Db" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringArthur %>" ProviderName="<%$ ConnectionStrings:ConnectionStringArthur.ProviderName %>" SelectCommand="SELECT [Vochtigheid], [Temperatuur], [CO2], [Lichtsterkte], [Tijd], [Breedtegraad], [Lengtegraad] FROM [Waardes] WHERE ([Gebruiker] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TbUser" Name="Gebruiker" PropertyName="Text" Type="String" DefaultValue="ruben" />
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
                    <asp:Button ID="BtnLogin" runat="server" Text="Login" Width="75%" OnClick="BtnLogin_Click1" />
                    <br />
                    <br />
                    <asp:Button ID="BtnRegister" runat="server" Text="Registreer" Width="75%" OnClick="BtnRegister_Click1" />
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
                </div>
            </div>
        </div>
        <div class="footer">
            <h2>Footer</h2>
            <asp:Button ID="BtnOverons" runat="server" Text="Over ons" Width="75%" OnClick="BtnOverons_Click1" />
        </div>
    </form>
</body>
</html>
