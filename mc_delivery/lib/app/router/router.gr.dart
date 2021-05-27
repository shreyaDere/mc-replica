// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/View/FAQ/faq_view.dart';
import '../../ui/View/Invite_share/invite_share_view.dart';
import '../../ui/View/dashboard_view/dashboard_screen_view.dart';
import '../../ui/View/menu/menu_view.dart';
import '../../ui/View/offers/offer_view.dart';
import '../../ui/View/search_view/search_screen_view.dart';
import '../../ui/View/set_pick_up_point_view/set_pick_up_point_view.dart';
import '../../ui/View/settings/settings_view.dart';
import '../../ui/View/splash_screen/splash_screen_view.dart';
import '../../ui/View/store%20details/store_details_view.dart';
import '../../ui/View/store_location/store_location_view.dart';
import '../../ui/View/terms_condition/tearms_condition_view.dart';

class Routes {
  static const String SplashScreenViewRoute = '/';
  static const String DashboardViewRoute = '/dashboard-view';
  static const String TearmsAndConditionViewRoute =
      '/tearms-and-condition-view';
  static const String SearchViewRoute = '/search-view';
  static const String MenuViewRoute = '/menu-view';
  static const String OffersViewRoute = '/offers-view';
  static const String InviteAndShareViewRoute = '/invite-and-share-view';
  static const String SettingsViewRoute = '/settings-view';
  static const String FaqViewRoute = '/faq-view';
  static const String StoreLocationViewRoute = '/store-location-view';
  static const String StoreDetailsViewRoute = '/store-details-view';
  static const String SetPickUpViewRoute = '/set-pick-up-view';
  static const all = <String>{
    SplashScreenViewRoute,
    DashboardViewRoute,
    TearmsAndConditionViewRoute,
    SearchViewRoute,
    MenuViewRoute,
    OffersViewRoute,
    InviteAndShareViewRoute,
    SettingsViewRoute,
    FaqViewRoute,
    StoreLocationViewRoute,
    StoreDetailsViewRoute,
    SetPickUpViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.SplashScreenViewRoute, page: SplashScreenView),
    RouteDef(Routes.DashboardViewRoute, page: DashboardView),
    RouteDef(Routes.TearmsAndConditionViewRoute, page: TearmsAndConditionView),
    RouteDef(Routes.SearchViewRoute, page: SearchView),
    RouteDef(Routes.MenuViewRoute, page: MenuView),
    RouteDef(Routes.OffersViewRoute, page: OffersView),
    RouteDef(Routes.InviteAndShareViewRoute, page: InviteAndShareView),
    RouteDef(Routes.SettingsViewRoute, page: SettingsView),
    RouteDef(Routes.FaqViewRoute, page: FaqView),
    RouteDef(Routes.StoreLocationViewRoute, page: StoreLocationView),
    RouteDef(Routes.StoreDetailsViewRoute, page: StoreDetailsView),
    RouteDef(Routes.SetPickUpViewRoute, page: SetPickUpView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreenView(),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DashboardView(),
        settings: data,
      );
    },
    TearmsAndConditionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TearmsAndConditionView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchView(),
        settings: data,
      );
    },
    MenuView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MenuView(),
        settings: data,
      );
    },
    OffersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OffersView(),
        settings: data,
      );
    },
    InviteAndShareView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InviteAndShareView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsView(),
        settings: data,
      );
    },
    FaqView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FaqView(),
        settings: data,
      );
    },
    StoreLocationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StoreLocationView(),
        settings: data,
      );
    },
    StoreDetailsView: (data) {
      final args = data.getArgs<StoreDetailsViewArguments>(
        orElse: () => StoreDetailsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoreDetailsView(
          key: args.key,
          storeName: args.storeName,
        ),
        settings: data,
      );
    },
    SetPickUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SetPickUpView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// StoreDetailsView arguments holder class
class StoreDetailsViewArguments {
  final Key key;
  final String storeName;
  StoreDetailsViewArguments({this.key, this.storeName});
}
