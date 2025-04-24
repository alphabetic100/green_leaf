import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:green_leaf/router/router.dart';
import 'package:green_leaf/src/core/utils/themes/theme.dart';

class GreanLeafApp extends StatelessWidget {
  const GreanLeafApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Green Leaf',
      initialRoute: '/',
      getPages: AppRoutes.instance.routes,
    );
  }
}
