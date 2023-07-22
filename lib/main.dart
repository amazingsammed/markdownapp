import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdownapp/splashscreen.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple
        ),
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      home: SplashScreen(),
    );
  }
}


