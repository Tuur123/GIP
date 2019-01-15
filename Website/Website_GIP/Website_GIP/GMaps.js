var map;

function initMap() {
    var testLatLng = { lat: -25.363, lng: 131.044 };

    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644},
        zoom: 8
    });
}

function drawMarker(LatLng) {
    var marker = new google.maps.Marker({
        position: LatLng,
        map: map
    });
}
