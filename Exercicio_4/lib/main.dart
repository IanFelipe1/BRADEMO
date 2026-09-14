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
            'Insert Image Example',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
  child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            const SizedBox(
              height: 70,
            ),
            
            Container(
              width: 207,
              height: 130,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKAJK_CSmqKlZOKUcu-8NcQy-Kx-ueQtHxbIQU_8_vBg&s=10',
                ),
              ),
            ),

            const SizedBox(
              height: 130,
            ),

            Container(
              width: 300,
              height: 190,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhLudKE1st5__HywS2ddkzNM5ZK4n-4ZhUU-FE82dRWA&s=10',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}