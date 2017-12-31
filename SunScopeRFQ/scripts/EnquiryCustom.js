$(document).ready(function () {
    getLocation();
})

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    }
}

function showPosition(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var latlon = new google.maps.LatLng(lat, lon)
    setCurrentLocation(latlon)
    var mapholder = document.getElementById('map')
    mapholder.style.height = '300px';
    mapholder.style.width = '1100px';

    var myOptions = {
        center: latlon,
        zoom: 19,
        mapTypeId: 'satellite',
        mapTypeControl: false,
        navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
    }

    var map = new google.maps.Map(document.getElementById("map"), myOptions);
    var marker = new google.maps.Marker({
        position: latlon,
        map: map,
        draggable: true,
        title: "You are here!"
    });

    theListener = google.maps.event.addListener(marker, 'dragend', function (event) {
        var latlng = event.latLng;
        setCurrentLocation(latlng);
    });
}

function setCurrentLocation(latlng) {
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'latLng': latlng }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            console.log(results);
            $("#TBEnquiryLocation").val(results[1].formatted_address);
        }
    })
}

function showError(error) {
    console.log(error.code);
}