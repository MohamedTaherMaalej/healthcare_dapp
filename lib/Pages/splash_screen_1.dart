import 'package:flutter/material.dart';
import 'package:healthcare_dapp/utils/routes.dart';
import 'package:healthcare_dapp/utils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main container for the splash screen
            Container(
              padding: EdgeInsets.fromLTRB(16, 80, 16, 0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white), // White background
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo container
                  Container(
                    margin: EdgeInsets.only(bottom: 64),
                    width: 125,
                    height: 150,
                    child: Image.asset(
                      'assets/icons/logo_mydoc.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Title text container
                  Container(
                    margin: EdgeInsets.only(bottom: 64),
                    constraints: BoxConstraints(
                      maxWidth: 274,
                    ),
                    child: Text(
                      'Consult Specialist Doctors \nSecurely And Privately',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: Colors.black, // Black text color
                      ),
                    ),
                  ),
                  // Description text container
                  Container(
                    margin: EdgeInsets.only(bottom: 69),
                    constraints: BoxConstraints(
                      maxWidth: 253,
                    ),
                    child: Text(
                      "Get ready to embark on a journey towards a healthier, happier you. Let's start this empowering experience together!",
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Colors.black, // Black text color
                      ),
                    ),
                  ),
                  // Button container with a background stack
                  Stack(
                    children: [
                      // Background image or color
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the next screen when the button is pressed
                            Navigator.pushReplacementNamed(
                              context,
                              MyRoutes.selectionPage,
                            ); // Configure the next page here !!
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff05c0ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: const Size(365, 56),
                          ),
                          child: Text(
                            'Get Started',
                            style: SafeGoogleFont(
                              'Cuprum',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: Colors.white, // White text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
