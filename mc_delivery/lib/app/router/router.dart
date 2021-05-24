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
import 'package:mc_delivery/ui/View/Invite_share/invite_share_view.dart';
import 'package:mc_delivery/ui/View/dashboard_view/dashboard_screen_view.dart';
import 'package:mc_delivery/ui/View/menu/menu_view.dart';
import 'package:mc_delivery/ui/View/offers/offer_view.dart';
import 'package:mc_delivery/ui/View/search_view/search_screen_view.dart';
import 'package:mc_delivery/ui/View/splash_screen/splash_screen_view.dart';
import 'package:mc_delivery/ui/View/store%20details/store_details_view.dart';
import 'package:mc_delivery/ui/View/terms_condition/tearms_condition_view.dart';
import 'package:mc_delivery/ui/View/settings/settings_view.dart';
import 'package:mc_delivery/ui/View/FAQ/faq_view.dart';
import 'package:mc_delivery/ui/View/store_location/store_location_view.dart';

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
      page: TearmsAndConditionView,
      name: 'TearmsAndConditionViewRoute',
    ),
    MaterialRoute(
      page: SearchView,
      name: 'SearchViewRoute',
    ),
    MaterialRoute(page: MenuView, name: 'MenuViewRoute'),
    MaterialRoute(page: OffersView, name: 'OffersViewRoute'),
    MaterialRoute(page: InviteAndShareView, name: 'InviteAndShareViewRoute'),
    MaterialRoute(page: SettingsView, name: 'SettingsViewRoute'),
    MaterialRoute(page: FaqView, name: 'FaqViewRoute'),
    MaterialRoute(page: StoreLocationView, name: 'StoreLocationViewRoute'),
    MaterialRoute(page: StoreDetailsView, name: 'StoreDetailsViewRoute')
  ],
  transitionsBuilder: TransitionsBuilders.zoomIn,
  durationInMilliseconds: 400,
)
class $Router {}
