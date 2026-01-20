import 'package:flutter/material.dart';

class TopTiles extends StatelessWidget {
  final String title, subtitle;
  const TopTiles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kTextTabBarHeight + 13),
        if(title=="LOGIN"||title=="CREATE ACCOUNT")
       const BackButton(),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 12),
        Text(subtitle, style: TextStyle(fontSize: 18)),
        
      ],
    );
  }
}
