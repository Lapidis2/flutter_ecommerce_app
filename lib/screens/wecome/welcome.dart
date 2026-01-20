import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/assets_images.dart';
import 'package:flutter_test_app/constants/routes.dart';
import 'package:flutter_test_app/screens/auth_ui/login/login.dart';
import 'package:flutter_test_app/screens/auth_ui/signup/sign_up.dart';
import 'package:flutter_test_app/widgets/primary_button/primary_button.dart';
import 'package:flutter_test_app/widgets/top_tiles/top_tiles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTiles(
              title: "Welcome to my shop!",
              subtitle: "Shop Anything, Anytime!",
            ),
            Center(child: Image.asset(AssetsImages.instance.welcomeImage)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Icon(Icons.facebook, size: 40, color: Colors.blue),
                ),
                SizedBox(width: 12),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(AssetsImages.instance.google, scale: 30),
                ),
              ],
            ),
            SizedBox(height: 18),
            PrimaryButton(
              title: 'Login',
              onPressed: () =>
                  Routes.instance.push(widget: Login(), context: context),
            ),
            SizedBox(height: 18),
            PrimaryButton(
              title: 'Sign Up',
              onPressed: () => Routes.instance.push(widget: SignUp(), context: context),
            ),
          ],
        ),
      ),
    );
  }
}
