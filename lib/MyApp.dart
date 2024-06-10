import 'package:flutter/material.dart';

import 'UI/Authenication/Builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthendicationBuilderPage(),
    );
  }
}
