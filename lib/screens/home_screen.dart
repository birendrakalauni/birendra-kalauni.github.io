import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Birendra Kalauni',
            style: TextStyle(fontSize: 32,
            fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text('Flutter Developer', style: TextStyle(fontSize: 18,),)
          ],
        ),
      ),
    );
  }
}