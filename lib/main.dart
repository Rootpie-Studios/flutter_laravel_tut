import 'package:flutter/material.dart';
import 'package:flutter_laravel_tut/constants.dart';
import 'package:flutter_laravel_tut/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const LoadingScreen(),
    );
  }
}
