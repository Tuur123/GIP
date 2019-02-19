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
    <div class="header">
        <img src="logo_Luchtkwaliteit.png"/>
    </div>
    <div class="topnav">

    </div>
    <div class="row">
        <div class="leftcolumn">
            <div class="card">
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
            </div>
            <div class="card">
              <h2>TITLE HEADING</h2>
              <h5>Title description, Sep 2, 2017</h5>
              <div class="fakeimg" style="height:200px;">Image</div>
              <p>Some text..</p>
              <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
            </div>
        </div>
        <div class="rightcolumn">
            <div class="card">
            <form id="form1" runat="server">
                <asp:TextBox ID="TbUser" runat="server" Width="100%">gebruikersnaam</asp:TextBox>
                <br />
                <br />
                <asp:TextBox ID="TbPassword" runat="server" TextMode="Password" Width="100%">Wachtwoord</asp:TextBox>
                <br />
                <br />
                <asp:Button ID="BtnLogin" runat="server" Text="Login" Width="75%"/>
                <br />
                <br />
                <asp:Button ID="BtnRegister" runat="server" Text="Registreer" Width="75%" />
                <br />
                <br />
                <asp:Label ID="LblUser" runat="server" Text="Log in om persoonlijke metingen te zien!"></asp:Label>
            </form>
            </div>
            <div class="card">
              <h3>Popular Post</h3>
              <div class="fakeimg"><p>Image</p></div>
              <div class="fakeimg"><p>Image</p></div>
              <div class="fakeimg"><p>Image</p></div>
            </div>
                <div class="card">
                  <h3>Follow Me</h3>
                  <p>Some text..</p>
                </div>
            </div>
        </div>
    
    <div class="footer">
      <h2>Footer</h2>
    </div>

</body>
</html>
