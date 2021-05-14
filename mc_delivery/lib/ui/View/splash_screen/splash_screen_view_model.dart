import 'package:mc_delivery/app/locator/locator.dart';
import 'package:mc_delivery/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  loadData() async {
    Future.delayed(Duration(seconds: 2), () {
      _navigationService.replaceWith(Routes.DashboardViewRoute);
    });
  }
}
