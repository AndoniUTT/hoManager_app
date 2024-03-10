import 'package:flutter/material.dart';
import 'package:homanager_app/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin()async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(
      builder: (context) => LoginPage())
      );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image(
              image: AssetImage('assets/img/logo.jpeg'),
              ),
              height: 350,
              width: 350,
            ),
            SizedBox(
              child: Text("PRUEBA"),
            ),
          ]
        )
      ),
    );
  }
}