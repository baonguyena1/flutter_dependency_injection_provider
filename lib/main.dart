import 'package:dependency_injection_provider/router.dart';
import 'package:dependency_injection_provider/utilities/constants/route_path.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePath.Login,
      onGenerateRoute: Router.generateRoute,
    );
  }
}