import 'package:dependency_injection_provider/ui/screens/home_view.dart';
import 'package:dependency_injection_provider/ui/screens/login_view.dart';
import 'package:dependency_injection_provider/ui/screens/post_view.dart';
import 'package:dependency_injection_provider/utilities/constants/route_path.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case RoutePath.Login:
        return MaterialPageRoute(builder: (_) => Login());
      case RoutePath.Post:
        return MaterialPageRoute(builder: (_) => Post());
      default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('No defined'),
          ),
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        )
      );
    }
  }
}