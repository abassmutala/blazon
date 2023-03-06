// import '../views/notifications.dart';
import 'package:blazon/views/authentication/forgot_password.dart';
import 'package:blazon/views/main_screen.dart';
import 'package:blazon/views/authentication/verify_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/route_names.dart';
// import '../views/bottom_nav/my_cards.dart';
// import '../views/main_screen.dart';
import '../views/authentication/login_view.dart';
import '../views/authentication/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // get arguments passed in when we call navigator.pushNamed
  final args = settings.arguments;
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: SignUpView(),
      );
    case ForgotPasswordRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: ForgotPasswordView(),
      );
    case VerifyCodeRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: VerifyCodeView(),
      );
    case MainScreenRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: MainScreen(),
      );
    // case NotificationsRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: Notifications(),
    //   );
    // case FlightCitySelectorRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: SelectFlightCity(),
    //   );
    // case DateSelectionRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: SelectDatePage(
    //       firstDateTitle: args,
    //       secondDateTitle: args,
    //     ),
    //   );
    // case WebViewsRoute:
    //   if (args is String) {
    //     return _getPageRoute(
    //         routeName: settings.name,
    //         viewToShow: ExternalsWebView(title: args, url: args));
    //   }
    //   return _errorRoute();

    // case CreatePostViewRoute:
    //   var postToEdit = settings.arguments as Post;
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: CreatePostView(
    //       editingPost: postToEdit,
    //     ),
    //   );
    default:
      return CupertinoPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({required String routeName, required Widget viewToShow}) {
  return CupertinoPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}

Route<dynamic> _errorRoute() {
  return CupertinoPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('ERROR'),
      ),
    ),
  );
}
