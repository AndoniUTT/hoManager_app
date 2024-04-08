import 'package:flutter/material.dart';
import 'package:homanager_app/screens/login copy.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child: Image.asset('assets/img/logo.jpeg'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                CircularProgressIndicator(), // Agregar el CircularProgressIndicator
              ],
            ),
          ],
        ),
      ),
    );
  }
}
