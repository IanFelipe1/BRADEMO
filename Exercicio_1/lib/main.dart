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
          title: const Text(
            'Flutter is Fun!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.deepOrange, 
              child: Text('Hi Mom 🐣',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  ),
              ),
            ),
          ),               
      ),
    );
  }
}