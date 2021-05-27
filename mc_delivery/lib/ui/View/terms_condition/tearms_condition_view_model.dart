import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TearmsAndConditionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  loadData() async {}
  onBackPressed() {
    _navigationService.popRepeated(1);
  }
}
