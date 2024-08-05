
import 'package:bits/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/MainViewModel.dart';
import 'view/splash_screen.dart';

void main() async {
  final MainViewModel mainViewModel = MainViewModel();
  await mainViewModel.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: splashscreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
