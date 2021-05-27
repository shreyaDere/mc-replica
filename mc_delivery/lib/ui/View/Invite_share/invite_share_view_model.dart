import 'dart:math';

import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InviteAndShareViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String value;

  loadData() async {}

  // String generateRandomString(int len) {
  //   return String.fromCharCodes(
  //       List.generate(len, (index) => _rnd.nextInt(33) + 89));
  // }
  String getRandomString(int length) {
    value = String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return value;
  }

  onBackPress() {
    _navigationService.popRepeated(1);
  }
}
