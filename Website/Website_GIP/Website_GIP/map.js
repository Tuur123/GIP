﻿function drawMap(user) {
    mapboxgl.accessToken = 'pk.eyJ1IjoicnViZW5hcnRodXIiLCJhIjoiY2pycXR6dnljMGJ3NDN5cGV5dGRlOWpqcSJ9.IeEQqzqf_kgs8J3rj2U5xw';

    var json;

    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [4.471421, 51.386688],
        zoom: 13
    });


    var query = `/api/GeoJsonController/` + user;
    console.log(user);
    $.ajax
        ({
            type: "GET",
            url: query,
            dataType: 'application/json',

            complete: function (data) {
                console.log(data.status);
                var data_parsed = JSON.parse(data.responseText);
                json = data_parsed;
                console.log(data_parsed);
            }
        });

    // add markers to map
    json.features.forEach(function (marker) {
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
}