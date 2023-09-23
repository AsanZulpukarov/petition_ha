import 'package:flutter/material.dart';
import 'package:petition_ha/home/home_screen.dart';

import '../fetches/local_service_user.dart';
import 'auth/sing_in/sing_in_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool checkUser = false;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    checkUser = await _checkSignIn();
    if (checkUser) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => SingInScreen()));
      });
    }
  }

  Future<bool> _checkSignIn() async {
    return await fetchGetUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/img/logo.png',
          height: 228,
          width: 228,
        ),
      ),
    );
  }
}
