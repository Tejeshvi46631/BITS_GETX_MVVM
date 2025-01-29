import 'package:bits/res/routes/routes_name.dart';
import 'package:bits/view/homescreen.dart';
import 'package:bits/view/rolesection.dart';
import 'package:bits/view/splash_screen.dart';
import 'package:bits/view/widget/MainHomescreen.dart/Scanner.dart';
import 'package:get/get.dart';

import '../../view/webview.dart';
import '../../view/widget/detailsScreen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() => [
        GetPage(
          name: RouteName.splashScreen, // Adjusted naming convention
          page: () =>
              const splashscreen(), // Ensure SplashScreen is correctly named and instantiated
          transitionDuration: const Duration(
              milliseconds:
                  250), // Changed to milliseconds for practical duration
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.WebViewPage,
          page: () => WebViewPage(), // Add the WebViewPage route
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.roleselection,
          page: () => RoleSelection(),
          transitionDuration: const Duration(
              milliseconds:
                  250), // Changed to milliseconds for practical duration
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homescreen,
          page: () => HomeScreen(), // Add the WebViewPage route
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.scanner,
          page: () => Scanner(), // Add the WebViewPage route
          transition: Transition.rightToLeftWithFade,
        ),
          GetPage(
          name: RouteName.DetailScreen,
          page: () => UBINdetails(), // Add the WebViewPage route
          transition: Transition.rightToLeftWithFade,
        ),
      ];

  static splashScreen() {}
}
