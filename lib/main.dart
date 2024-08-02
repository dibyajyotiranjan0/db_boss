import 'package:dpboss/Screen/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Screen/web_view/dpboss_servcess.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFCC99)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
