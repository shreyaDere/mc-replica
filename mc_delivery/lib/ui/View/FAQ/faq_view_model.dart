import 'package:mc_delivery/app/locator/locator.dart';
import 'package:mc_delivery/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FaqViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  bool _onExpension = false;
  bool get onExpansion => _onExpension;

  loadData() {}

  onExpansionTile(value) {
    _onExpension = value;
    notifyListeners();
  }

  onBackPressed() {
    _navigationService.navigateTo(Routes.DashboardViewRoute);
  }
}
