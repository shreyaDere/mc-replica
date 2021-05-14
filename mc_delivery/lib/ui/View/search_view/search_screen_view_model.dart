import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BaseViewModel {
  String _searchString;
  String get searchString => _searchString;

  NavigationService _navigationService = locator<NavigationService>();

  loadData() async {}

  void searchStringValue(String value) {}

  onBackPress() {
    _navigationService.popRepeated(1);
  }
}
