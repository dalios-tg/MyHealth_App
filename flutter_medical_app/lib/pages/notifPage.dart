import 'package:flutter/material.dart';

class notifPage extends StatefulWidget {
  const notifPage({super.key});

  @override
  State<notifPage> createState() => _notifPageState();
}

class _notifPageState extends State<notifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Notifications Page"),CircularProgressIndicator()],
          ),
        ),
    );
  }
}