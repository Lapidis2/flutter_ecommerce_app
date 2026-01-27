// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/routes.dart';
import 'package:flutter_ecommerce_app/constants/toast.dart';
import 'package:flutter_ecommerce_app/firebase_helpers/firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_app/screens/auth_ui/signup/sign_up.dart';
import 'package:flutter_ecommerce_app/screens/wecome/welcome.dart';
import 'package:flutter_ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter_ecommerce_app/widgets/top_tiles/top_tiles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTiles(title: "LOGIN", subtitle: "Welcome back To Jean Shop!"),
            SizedBox(height: 13.0),
            TextField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: password,
              obscureText: _isPasswordVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(Icons.visibility),
                ),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 13.0),
            PrimaryButton(
              title: "Login",
              onPressed: () async{
               bool isValidated= loginValid(email.text, password.text);
               if(isValidated){
               bool isLogin=await FirebaseAuthHelper.instance.login(email.text, password.text, context);
               if(isLogin){
               
                 Routes.instance.pushandremoveuntil(widget: Home(), context: context);
               }
               }
              },
            ),
            SizedBox(height: 12.0),
            Center(
              child: Text(
                'Don\'t have an account?',
                style: TextStyle(decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: 13.0),
            Center(
              child: CupertinoButton(
                onPressed: () {
                  Routes.instance.push(widget: SignUp(), context: context);
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
