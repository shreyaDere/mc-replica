// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/View/dashboard_view/dashboard_screen_view.dart';
import '../../ui/View/my_mcd_view/my_mcd_view.dart';
import '../../ui/View/search_view/search_screen_view.dart';
import '../../ui/View/splash_screen/splash_screen_view.dart';

class Routes {
  static const String SplashScreenViewRoute = '/';
  static const String DashboardViewRoute = '/dashboard-view';
  static const String MyMcdViewRoute = '/my-mcd-view';
  static const String SearchViewRoute = '/search-view';
  static const all = <String>{
    SplashScreenViewRoute,
    DashboardViewRoute,
    MyMcdViewRoute,
    SearchViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.SplashScreenViewRoute, page: SplashScreenView),
    RouteDef(Routes.DashboardViewRoute, page: DashboardView),
    RouteDef(Routes.MyMcdViewRoute, page: MyMcdView),
    RouteDef(Routes.SearchViewRoute, page: SearchView),
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
    MyMcdView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyMcdView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchView(),
        settings: data,
      );
    },
  };
}
