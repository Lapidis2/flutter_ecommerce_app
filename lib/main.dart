import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/theme.dart';
import 'package:flutter_ecommerce_app/screens/wecome/welcome.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
     
      home:  Home()
    );
  }
}
