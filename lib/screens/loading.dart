import 'package:flutter/material.dart';
import 'package:flutter_laravel_tut/components/app_navigator.dart';
import 'package:flutter_laravel_tut/screens/home.dart';
import 'package:flutter_laravel_tut/screens/login.dart';
import 'package:flutter_laravel_tut/services/api_provider.dart';

import '../constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  final ApiProvider _apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    _apiProvider.checkAuth().then((authenticated) {
      if (authenticated) {
        AppNavigator.navigatePushAndReplace(context, const HomeScreen());
      }
      else {
        AppNavigator.navigatePushAndReplace(context, const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              APP_NAME,
              style: TextStyle(fontSize: 50, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

}