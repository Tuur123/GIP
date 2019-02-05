<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset='utf-8' />
    <title>Luchtkwaliteit</title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.css' rel='stylesheet' />

    <style type="text/css">
        .auto-style1 {
            width: 1300px;
        }
        .auto-style2 {
            width: 1300px;
            height: 500px;
        }
        .auto-style3 {
            width: 1300px;
            margin-left: 80px;
            }
        .auto-style4 {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 0px;
            height: 64px;
        }
        .auto-style8 {
            width: 100%;
            height: 527px;
        }
        .auto-style9 {
            width: 190px;
        }
        .auto-style10 {
            width: 724px;
        }
        .auto-style11 {
            width: 99%;
            height: 535px;
            background-color: lightblue;
        }
        .auto-style15 {
            height: 10%;
        }
        .auto-style16 {
            height: 54px;
            width: 176px;
            text-align: center;       
            padding-left: 5px;
        }
        .auto-style17 {
            height: 50px;
            width: 736px;           
            padding-right: 15%;
        }
        .auto-style18 {
            height: 54px;
            text-align: center;
        }
        body {
            font-family: Cambria;
            background-color: aliceblue;
        }
        p {
            text-align: left;          
        }
        .auto-style19 {
            width: 1301px;
        }
        .auto-style20 {
            height: 20%;
        }
        .auto-style21 {
            height: 20%;
        }
        .auto-style23 {
            height: 20%;
        }
        .auto-style24 {
            height: 20%;
        }
        .auto-style25 {
            width: 171px;
        }
        .auto-style26 {
            width: 707px;
            height: 527px;
            margin-top: 0px;
        }
        .auto-style27 {
            margin-top: 1px;
        }

        .auto-style28 {
            width: 100%;
        }
        .auto-style29 {
            width: 60%;
        }
        #map {
            position: absolute;
            top: 18%;
            bottom: 16%;
            width: 45%;
        }
        .marker {
            background-image: url('marker.png');
            background-size: cover;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="auto-style19">
            <table>
                <tr>
                    <td class="auto-style3">
                                               
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style17">
                                    <asp:Image ID="Logo" runat="server" ImageUrl="~/logo.jpg" Width="721px" Height="97px" CssClass="auto-style27" />
                                </td>
                                <td class="auto-style25">
                                    <p>Email: 
                                        <asp:TextBox ID="TbUser" runat="server" Height="22px"></asp:TextBox>
                                        Password:
                                        <asp:TextBox ID="TbPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    </p>
                                </td>
                                <td class="auto-style16">
                                    <asp:ImageButton ID="BtnLogin" runat="server" Height="48px" ImageUrl="~/login.jpg" Width="174px" ImageAlign="AbsMiddle" OnClick="BtnLogin_Click" />
                                </td>
                                <td class="auto-style18">
                                    <asp:ImageButton ID="BtnRegister" runat="server" Height="48px" ImageUrl="~/register.png" Width="174px" ImageAlign="AbsMiddle" OnClick="BtnRegister_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                        <table class="auto-style8">
                            <tr>
                                <td class="auto-style9">
                                    <asp:Image ID="SideImage" runat="server" Height="520px" ImageUrl="~/sideImage.png" Width="193px" />
                                </td>
                                <td class="auto-style10">
                                    <!-- Hier komt gmaps kaart -->
                                    <!--
                                    <div id="map"></div>
                                    <script src="GMaps.js"></script>
                                     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5h3EfLBv1dxTEdvPJ2KM6dYDVaULzIn4&callback=initMap"
                                      async defer></script>-->
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
                                    <table class="auto-style11">
                                        <tr>
                                            <td class="auto-style15">
                                                <table class="auto-style28">
                                                    <tr>
                                                        <td class="auto-style29">Gebruiker: <asp:Label ID="LblUser" runat="server" Text="Niet ingelogd"></asp:Label>
                                                        </td>
                                                        <td>Metingen:</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style23">
                                                <p><asp:CheckBox ID="CheckBox1" runat="server" Text="Lichtsterkte" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server"></asp:Label></p>
                                                <p>&nbsp;</p>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style20">
                                                <p><asp:CheckBox ID="CheckBox2" runat="server" Text="CO₂" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:Label ID="Label2" runat="server"></asp:Label></p>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">
                                                <p><asp:CheckBox ID="CheckBox3" runat="server"  Text="Luchtvochtigheid" />&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <asp:Label ID="Label3" runat="server"></asp:Label></p>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style21">
                                                <p><asp:CheckBox ID="CheckBox4" runat="server" Text="Temperatuur" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label4" runat="server"></asp:Label></p>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <p>over ons:</p>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
