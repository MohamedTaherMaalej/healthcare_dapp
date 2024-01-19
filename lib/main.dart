import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/splash_screen_0.dart';
import 'Utils/routes.dart';
import 'package:provider/provider.dart';
import 'Services/Contracts.dart';

void main() {
  // Configure system UI overlay style, setting status bar color and icon brightness
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Run the app, providing a ChangeNotifier for state management
  runApp(
    ChangeNotifierProvider(
      create: (context) => Contracts(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // Constructor for MyApp
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build and return the MaterialApp widget, which is the root of the application
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner in the corner

      // Define the theme for the entire app using Google Fonts
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      home: const Splash2(), // Set the initial home page to Splash2
      routes: MyRoutes.routes, // Define named routes using the MyRoutes class
    );
  }
}
