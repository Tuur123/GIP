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
                            <td style="width: 70%; background-color: #7499A9; border-top-right-radius:100px; border-bottom-right-radius:100px">                      
                                <img src="logo_Luchtkwaliteit.png" class="logoAnimation" style="background-color: #7499A9"/>
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
                            <td >
                                    <div id='map'></div>

                                    <script>

                                        mapboxgl.accessToken = 'pk.eyJ1IjoicnViZW5hcnRodXIiLCJhIjoiY2pycXR6dnljMGJ3NDN5cGV5dGRlOWpqcSJ9.IeEQqzqf_kgs8J3rj2U5xw';

                                        var map = new mapboxgl.Map({
                                          container: 'map',
                                          style: 'mapbox://styles/mapbox/streets-v9',
                                            center: [4.471421, 51.386688],
                                          zoom: 13
                                        });

                                // Code voor de marker
                                        var geojson = {
                                            type: 'FeatureCollection',
                                            features: [{
                                                type: 'Feature',
                                                geometry: {
                                                    type: 'Point',
                                                    coordinates: [4.471421, 51.386688]
                                                },
                                                properties: {
                                                    title: 'Mapbox',
                                                    description: 'Washington, D.C.'
                                                }
                                            },
                                            {
                                                type: 'Feature',
                                                geometry: {
                                                    type: 'Point',
                                                    coordinates: [4, 51]
                                                },
                                                properties: {
                                                    title: 'Meeting door: Ruben',
                                                    description: 'San Francisco, California'
                                                }
                                            }]
                                        };
                                        // add markers to map
                                        geojson.features.forEach(function (marker)
                                        {
                                          // create a HTML element for each feature
                                          var el = document.createElement('div');
                                          el.className = 'marker';

                                          // make a marker for each feature and add to the map
                                          new mapboxgl.Marker(el)
                                              .setLngLat(marker.geometry.coordinates)
                                              .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
                                                  .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>'))
                                            .addTo(map);
                                                });
                                        map.addControl(new mapboxgl.NavigationControl());
                                </script>
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
                                        <td>&nbsp;</td>
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
