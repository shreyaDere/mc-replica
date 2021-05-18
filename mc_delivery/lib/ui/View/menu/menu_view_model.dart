import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:built_collection/built_collection.dart';

class MenuViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  bool _calorieToggle = false;
  bool get calorieToggle => _calorieToggle;
  bool _vegOnlyToggle = false;
  bool get vegOnlyToggle => _vegOnlyToggle;
  List<int> selected = [];
  bool _openMenu = false;
  bool get openMenu => _openMenu;
  BuiltList<MenuCategoryList> menuItems = BuiltList<MenuCategoryList>();

  loadData() async {
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Eid Special Combos", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("McSavers", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("summertime Combos", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Easy Essentials", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Stay Home Combos", false)))
        .build();
    menuItems =
        (menuItems.toBuilder()..add(MenuCategoryList("Meals", false))).build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Happy Meals", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Family Meals", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Burgers & Wraps", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Fries & Sides", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Desserts", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Beverages", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Keep It Hot", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Keep It Chill", false)))
        .build();
    menuItems = (menuItems.toBuilder()
          ..add(MenuCategoryList("Cookies and Muffins", false)))
        .build();
    notifyListeners();
  }

  onRecommendedProductItemClick() {
    for (var i = 0; i < 10; i++) {
      var isSelected = selected.contains(i);
      if (isSelected)
        selected.remove(i);
      else
        selected.add(i);
    }
    notifyListeners();
  }

  onCalorieToggel(val) {
    _calorieToggle = val;
    notifyListeners();
  }

  onVegOnlyToggleToggel(bool val) {
    _vegOnlyToggle = val;
    notifyListeners();
  }

  onBackPress() {
    _navigationService.popRepeated(1);
  }

  closeBottomSheet() {
    _openMenu = false;
    notifyListeners();
  }

  openBottomSheet() {
    _openMenu = true;
    notifyListeners();
  }

  onSingleItemClick(int index) {
    menuItems.forEach((element) => element.isSelexted = false);
    menuItems[index].isSelexted = true;
    _openMenu = false;
    notifyListeners();
  }
}

class MenuCategoryList {
  String menuName;
  bool isSelexted;
  MenuCategoryList(this.menuName, this.isSelexted);
}
