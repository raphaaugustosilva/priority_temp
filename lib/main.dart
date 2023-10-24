import 'package:flutter/material.dart';
import 'package:priority/presentation/pages/home/home_page.dart';

void main() => runApp(const AlertPriorityApp());

class AlertPriorityApp extends StatelessWidget {
  const AlertPriorityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Priority',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(size: 16.0, color: Colors.white),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(110, 40)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
