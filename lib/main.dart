import 'package:flutter/material.dart';

import 'Pages/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff242A37),
        backgroundColor: Color(0xff242A37),
      ),
      home: const MyHomePage(),
    );
  }
}