import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchLocationViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  String kGoogleApiKey = "AIzaSyAcVTUdWoryiBnFCTBnhk_kIDSpeLRBF4U";
  loadData() async {}

  void searchStringValue(String value) {}

  // Future<Null> displayPrediction(var p) async {
  //   GoogleMapsPlaces _places = GoogleMapsPlaces;
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

  onBackPress() {
    _navigationService.popRepeated(1);
  }
}
