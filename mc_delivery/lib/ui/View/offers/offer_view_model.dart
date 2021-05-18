import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OffersViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  String _searchString;
  String get searchString => _searchString;
  loadData() async {}
  void searchStringValue(String value) {}
  onBackPress() {
    _navigationService.popRepeated(1);
  }
}
