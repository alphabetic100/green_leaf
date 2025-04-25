import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_leaf/green_leaf_app.dart';
import 'package:green_leaf/src/core/service/local_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalService.init();
  runApp(const GreanLeafApp());
}
