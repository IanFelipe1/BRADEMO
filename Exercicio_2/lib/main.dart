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
        body: Center(
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.deepPurple,
                      size: 40,
                    ),
                    Text(
                      'CALL',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.near_me,
                      color: Colors.deepPurple,
                      size: 40,
                    ),
                    Text(
                      'ROUTE',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.deepPurple,
                      size: 40,
                    ),
                    Text(
                      'SHARE',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}