import 'package:mc_delivery/app/locator/locator.dart';
import 'package:mc_delivery/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  bool _onPushNotification = false;
  bool get onPushNotification => _onPushNotification;
  bool _shareLocation = false;
  bool get shareLocation => _shareLocation;

  loadData() async {}
  onBackPress() {
    _navigationService.clearStackAndShow(Routes.DashboardViewRoute);
  }

  onPushNotificationToggelClick(bool val) {
    _onPushNotification = val;
    notifyListeners();
  }

  onIconClick(int index) {
    switch (index) {
      case 2:
        _navigationService.navigateTo(Routes.TearmsAndConditionViewRoute);
        break;
      case 3:
        _navigationService.navigateTo(Routes.FaqViewRoute);
        break;
      case 4:
        break;
    }
  }

  onshareLocationToggelClick(bool val) {
    _shareLocation = val;
    notifyListeners();
  }
}
