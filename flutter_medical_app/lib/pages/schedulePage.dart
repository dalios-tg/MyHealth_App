import 'package:flutter/material.dart';

class schedulePage extends StatefulWidget {
  const schedulePage({super.key});

  @override
  State<schedulePage> createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Schedule Page"), CircularProgressIndicator()],
        ),
      ),
    );
  }
}
