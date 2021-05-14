import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc_delivery/app/locator/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/locator/locator.dart';
import 'app/router/router.gr.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: router.Routes.splashScreenView,
      // onGenerateRoute: router.Router().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      initialRoute: router.Routes.SplashScreenViewRoute,
      onGenerateRoute: router.Router().onGenerateRoute,
    );
  }
}
