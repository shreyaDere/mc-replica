import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:mc_delivery/app/locator/locator.dart';
import 'package:mc_delivery/app/router/router.gr.dart';
import 'package:mc_delivery/logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:google_maps_webservice/places.dart';

class SetPickUpViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  String _currentLocation = " ";
  String get currentLocation => _currentLocation;
  Logger logger = getLogger("pick up location");
  GoogleMapController mapController;
  String googleAPiKey = "AIzaSyAcVTUdWoryiBnFCTBnhk_kIDSpeLRBF4U";

  double originLatitude = 17.6912661, originLongitude = 73.9795596;
  double destLatitude = 18.6912667, destLongitude = 74.9795515;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.5212402, 3.3679965),
    zoom: 9.4746,
  );
  CameraPosition get kGooglePlex => _kGooglePlex;

  loadData() async {
    getCurrentLocation();

    /// origin marker
    _addMarker(LatLng(originLatitude, originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(destLatitude, destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
  }

//***************************************** */
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    notifyListeners();
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(originLatitude, originLongitude),
      PointLatLng(destLatitude, destLongitude),
      travelMode: TravelMode.driving,
      // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );
    logger.d(result.points);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

//***************************************** */
  getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    logger.d(lastPosition);
    displayAddress(position);
    notifyListeners();
  }

  displayAddress(position) async {
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _currentLocation =
        " ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}";
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  onBackPress() {
    _navigationService.popRepeated(1);
  }

  onStartingLocationSelected() {
    _navigationService.navigateTo(Routes.SearchLocationViewRoute);
  }

  // Future<Null> displayPrediction(var p) async {
  //   GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: googleAPiKey);
  //   if (p != null) {
  //     var detail = await _places.getDetailsByPlaceId(p.placeId);

  //     var placeId = p.placeId;
  //     double lat = detail.result.geometry.location.lat;
  //     double lng = detail.result.geometry.location.lng;

  //     var address = await Geocoder.local.findAddressesFromQuery(p.description);

  //     print(lat);
  //     print(lng);
  //   }
  // }

}
