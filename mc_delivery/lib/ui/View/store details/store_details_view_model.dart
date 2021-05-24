import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoreDetailsViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  String _storeName;
  String get storeName => _storeName;
  loadData(storeName) async {
    _storeName = storeName;
  }

  onBackPress() {
    _navigationService.back();
  }
}
