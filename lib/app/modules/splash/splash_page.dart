import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  checkLogin() async {
    var result = await controller.checkLogin();

    if (result) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      Modular.to.pushReplacementNamed('/auth');
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: Center(child: CircularProgressIndicator()));
  }
}
