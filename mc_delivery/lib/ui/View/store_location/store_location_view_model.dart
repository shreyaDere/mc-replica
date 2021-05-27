import 'package:mc_delivery/app/locator/locator.dart';
import 'package:mc_delivery/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoreLocationViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  String _searchString = "";
  String get searchString => _searchString;

  searchStringValue(String value) {
    _searchString = value;
    notifyListeners();
  }

  loadData() async {}

  onBackPress() {
    _navigationService.clearStackAndShow(Routes.DashboardViewRoute);
  }

  navigateToLocationDetails() {
    _navigationService.navigateTo(Routes.StoreDetailsViewRoute,
        arguments: StoreDetailsViewArguments(storeName: "JM Road"));
  }
}
