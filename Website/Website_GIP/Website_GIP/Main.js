$(document).ready(function () {

    mapboxgl.accessToken = 'pk.eyJ1IjoicnViZW5hcnRodXIiLCJhIjoiY2pycXR6dnljMGJ3NDN5cGV5dGRlOWpqcSJ9.IeEQqzqf_kgs8J3rj2U5xw';

    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [4.471421, 51.386688],
        zoom: 13
    });

    PageMethods.GetData(drawElements);

    function drawElements(response) {

        var data = JSON.parse(response);

        console.log(data)

        drawMap(data);
        drawCharts(data);
    }

    function drawMap(data) {

        // add markers to map
        data.features.forEach(function (marker) {
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

    function drawCharts(data) {

        var ctx = document.getElementById('coChart').getContext('2d');
        var coChart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'line',

            // The data for our dataset
            data: {
                labels: data.chart.Tijd,
                datasets: [{
                    label: 'CO₂',
                    backgroundColor: 'rgb(255, 99, 132)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: data.chart.CO2
                }]
            },

            // Configuration options go here
            options: {}
        });

        var ctx = document.getElementById("tempVochtLichtChart").getContext("2d");

        var chart = new Chart(ctx, {

            options: {},
            type: 'line',
            data: {
                labels: data.chart.Tijd,
                datasets: [
                    {
                        label: 'Temperatuur',
                        backgroundColor: 'rgb(21,142,255)',
                        borderColor: 'rgb(21,142,255)',
                        data: data.chart.Temp
                    },
                    {
                        label: 'Vochtigheid',
                        fill: true,
                        backgroundColor: 'rgb(66,255,153)',
                        borderColor: 'rgb(66,255,153)',
                        data: data.chart.Vocht
                    }
                ]
            }
        });
    }
});

