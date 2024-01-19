import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthcare_dapp/utils/routes.dart'; // Import routes file with lowercase letters

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();

    // Timer to navigate to the splash screen page after 3 seconds
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
          context, MyRoutes.splashScreenPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container to hold the logo
            Container(
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                // Styling for the container with a white background
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: SizedBox(
                    width: 125,
                    height: 150,
                    child: Image.asset(
                      'assets/icons/logo_mydoc.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
