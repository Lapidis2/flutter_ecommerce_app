import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/top_tiles/top_tiles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
          TopTiles(title: "LOGIN", subtitle: "Welcome back To Jean Shop!")
        ],
      ),
    );
  }
}