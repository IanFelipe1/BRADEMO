import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           centerTitle: true,
          title: const Text(
            'Stack & Positioned Widget',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Positioned(
              left: 45,
              top: 25,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.green,
                child: const Text(
                  'Green',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 60,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.red,
                child: const Text(
                  'Red',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 94,
              top: 95,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.purple,
                child: const Text(
                  'Purple',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}