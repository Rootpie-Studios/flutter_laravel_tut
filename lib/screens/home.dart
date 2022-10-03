import 'package:flutter/material.dart';
import 'package:flutter_laravel_tut/screens/login.dart';
import 'package:flutter_laravel_tut/services/api_provider.dart';

import '../components/app_navigator.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  ApiProvider _apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    _apiProvider.checkAuth().then((authenticated) {
      if (!authenticated) {
        AppNavigator.navigatePushAndReplace(context, const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          APP_NAME,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _apiProvider.logout().then((success) {
                  if (success) {
                    AppNavigator.navigatePushAndReplace(context, const LoginScreen());
                  }
                });
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}