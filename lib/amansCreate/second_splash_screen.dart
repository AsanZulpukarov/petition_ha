import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petition_ha/amansCreate/second_home_screen.dart';

import '../view/auth/sing_in/sing_in_screen.dart';

class SecondSplashPage extends StatefulWidget {
  const SecondSplashPage({Key? key}) : super(key: key);

  @override
  _SecondSplashPageState createState() => _SecondSplashPageState();
}


class _SecondSplashPageState extends State<SecondSplashPage> {




  void initState() {
    super.initState();

      Future.delayed(Duration(seconds: 3), () {


          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => SecondHomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/logo.png',height: 228,width: 228,),
      ),
    );
  }
}
