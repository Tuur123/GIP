/*
File: Main.js
Project: Website
Function: client-side code for Home.aspx
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
*/

var data;
let min = 0;
let max = 10;

var sliderFrom = document.getElementById("From");
var sliderUntil = document.getElementById("Until");
var spanVan = document.getElementById("van");
var spanTot = document.getElementById("tot");

$(document).ready(function () {

    PageMethods.GetData(drawElements);

});

sliderUntil.oninput = function () {

    max = this.value;
    drawCharts(min, max);
    spanTot.innerHTML = data.chart.Tijd[max];
}

sliderFrom.oninput = function () {

    min = this.value;
    drawCharts(min, max);
    spanVan.innerHTML = data.chart.Tijd[min];
}

function drawElements(response) {

    data = JSON.parse(response);
    console.log(data);
    drawMap(data.features);
    drawCharts(min, max);
}

function drawMap(features) {

    mapboxgl.accessToken = 'pk.eyJ1IjoicnViZW5hcnRodXIiLCJhIjoiY2pycXR6dnljMGJ3NDN5cGV5dGRlOWpqcSJ9.IeEQqzqf_kgs8J3rj2U5xw';

    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [4.471421, 51.386688],
        zoom: 13
    });

    // add markers to map
    features.forEach(function (marker) {
        // create a HTML element for each feature
        var el = document.createElement('div');
        el.className = 'marker';

        // make a marker for each feature and add to the map
        new mapboxgl.Marker(el).setLngLat(marker.geometry.coordinates).setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
            .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>'))
            .addTo(map);
    });
    map.addControl(new mapboxgl.NavigationControl());
}

function drawCharts(min, max) {

    var ctxCo2 = document.getElementById('coChart').getContext('2d');
    var coChart = new Chart(ctxCo2, {
        // The type of chart we want to create
        type: 'line',

        // The data for our dataset
        data: {
            labels: data.chart.Tijd.slice(min, max),
            datasets: [{
                label: 'CO₂',
                fill: false,
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: data.chart.CO2.slice(min, max)
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
            labels: data.chart.Tijd.slice(min, max),
            datasets: [
                {
                    label: 'Temperatuur',
                    fill: false,
                    backgroundColor: 'rgb(21,142,255)',
                    borderColor: 'rgb(21,142,255)',
                    data: data.chart.Temp.slice(min, max)
                },
                {
                    label: 'Vochtigheid',
                    fill: false,
                    backgroundColor: 'rgb(66,255,153)',
                    borderColor: 'rgb(66,255,153)',
                    data: data.chart.Vocht.slice(min, max)
                },
                {
                    label: 'Lichtsterkte',
                    fill: false,
                    backgroundColor: 'rgb(255,255,0)',
                    borderColor: 'rgb(255,255,0)',
                    data: data.chart.Licht.slice(min, max)
                }
            ]
        }
    });
}