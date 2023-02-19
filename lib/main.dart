import 'package:flutter/material.dart';
import 'package:to_list/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const Home(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff635985),
        fontFamily: "scode",
      ),
    );
  }
}

