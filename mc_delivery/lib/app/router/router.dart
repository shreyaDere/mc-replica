// import 'package:auto_route/auto_route.dart';
// import 'package:mc_delivery/ui/View/dashboard/dashboard_screen_view.dart';
// import 'package:mc_delivery/ui/View/splash_screen/splash_screen_view.dart';
// import 'package:stacked/stacked_annotations.dart';

// @MaterialAutoRouter(routes: <AutoRoute>[
//   MaterialRoute(page: SplashScreenView, initial: true),
//   MaterialRoute(page: DashboardView, initial: false),

// // CustomRoute(
// //     page: SignUpCustomWebView,
// //     transitionsBuilder: TransitionsBuilders.slideLeft,
// //     initial: false,
// //     durationInMilliseconds: 400),
// ])
// class $Router {}
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:mc_delivery/ui/View/dashboard_view/dashboard_screen_view.dart';
import 'package:mc_delivery/ui/View/my_mcd_view/my_mcd_view.dart';
import 'package:mc_delivery/ui/View/search_view/search_screen_view.dart';
import 'package:mc_delivery/ui/View/splash_screen/splash_screen_view.dart';

// Defining routes and global transitions
@CustomAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: SplashScreenView,
      name: 'SplashScreenViewRoute',
      initial: true,
    ),
    MaterialRoute(
      page: DashboardView,
      name: 'DashboardViewRoute',
    ),
    MaterialRoute(
      page: MyMcdView,
      name: 'MyMcdViewRoute',
    ),
    MaterialRoute(
      page: SearchView,
      name: 'SearchViewRoute',
    ),
  ],
  transitionsBuilder: TransitionsBuilders.zoomIn,
  durationInMilliseconds: 400,
)
class $Router {}
