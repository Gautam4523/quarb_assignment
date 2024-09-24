import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/search_screen.dart';
import 'screen/splash_screen.dart';
import 'screen/home_screen.dart';

void main() => runApp(MovieApp());

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
