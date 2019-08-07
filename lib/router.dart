import 'package:dependency_injection_provider/ui/screens/home_view.dart';
import 'package:dependency_injection_provider/ui/screens/login_view.dart';
import 'package:dependency_injection_provider/ui/screens/post_view.dart';
import 'package:dependency_injection_provider/utilities/constants/route_path.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePath.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePath.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
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