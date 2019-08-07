import 'package:dependency_injection_provider/services/authentication_service.dart';
import 'package:dependency_injection_provider/shared/app_colors.dart';
import 'package:dependency_injection_provider/ui/widgets/base_widget.dart';
import 'package:dependency_injection_provider/ui/widgets/login_header.dart';
import 'package:dependency_injection_provider/utilities/constants/route_path.dart';
import 'package:dependency_injection_provider/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
          authenticationService: Provider.of<AuthenticationService>(context)),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(controller: _controller),
              model.busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child:
                          Text('Login', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        var userIdText = _controller.text;
                        if (userIdText.isEmpty) {
                          return;
                        }
                        var loginSuccess = await Provider.of<LoginViewModel>(
                                context,
                                listen: false)
                            .login(userIdText);
                        if (loginSuccess) {
                          _controller.clear();
                          Navigator.pushNamed(context, RoutePath.Home);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
