import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/top_tiles/top_tiles.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: TopTiles(title: 'CREATE ACCOUNT', subtitle: 'Create your account'),
    );
  }
}