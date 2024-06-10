import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'MyApp.dart';
import 'Services/Firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseService.option);
  runApp(const MyApp());
}
