import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter_ecommerce_app/widgets/top_tiles/top_tiles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTiles(title: "Create Account", subtitle: "Welcome To Jean Shop!"),
            SizedBox(height: 13.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
              TextField(
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
            SizedBox(height: 12.0),
            PrimaryButton(title: "SignUp", onPressed: () {}),
            SizedBox(height: 12.0),
            Center(
              child: Text('Don\'t have an account?',
               style: TextStyle(
                decoration: TextDecoration.none,
              ),),
            ),
               SizedBox(height: 12.0),
               Center(
                 child: CupertinoButton(
                   onPressed: () {},
                   child: Text('Create Account',style: TextStyle(color: Theme.of(context).primaryColor),),
                 ),
               ),
          ],
        ),
      ),
    );
  }
  
  
}