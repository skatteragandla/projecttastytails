//splashscreen.dart
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
                fontFamily: 'Varela',
                fontSize: 57,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 238, 6, 6),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
