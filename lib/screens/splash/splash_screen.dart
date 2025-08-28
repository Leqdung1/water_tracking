import 'package:flutter/material.dart';

import '../../core/constants/app_theme_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  void openApp() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeConst.primaryColor,
      body: Column(
        children: [],
      ),
    );
  }
}
