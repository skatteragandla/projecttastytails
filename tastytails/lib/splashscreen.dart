import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'assets/splashscreen.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'TASTY TRAILS',
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 57,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
