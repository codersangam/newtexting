import 'package:dating_app/pages/onboarding/onboardinng.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('The Route is: ${settings.name}');
    }

    switch (settings.name) {
      case '/':
      //   return HomeScreen.route();
      // case HomeScreen.routeName:
      //   return HomeScreen.route();
      // case UsersScreen.routeName:
      //   return UsersScreen.route(user: settings.arguments as User);
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      // case AuthenticationWrapper.routeName:
      //   return AuthenticationWrapper.route();
      // case ProfileScreen.routeName:
      //   return ProfileScreen.route();
      // case ChatScreen.routeName:
      //   return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
