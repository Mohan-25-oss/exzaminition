import 'package:flutter/material.dart';
import 'exzaminition.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // first screen
      initialRoute: '/exzaminition',

      routes: {
        '/exzaminition': (context) =>Exzaminition(),
      },
    );
  }
}