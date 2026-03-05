import 'package:flutter/material.dart';

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(onDetected: (value) {}),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.onDetected});

  final void Function(String value) onDetected;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ここにホーム画面のUIを実装する
    );
  }
}
