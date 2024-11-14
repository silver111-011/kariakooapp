

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends StatelessWidget {
  final SplashscreenController splashscreenController = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Group 1000004723.png', // Path to your splash image
              width: 150, // Adjust image width as needed
              height: 150, // Adjust image height as needed
            ),
            SizedBox(height: 20),
            Text(
              'Kariakoo Connect',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



