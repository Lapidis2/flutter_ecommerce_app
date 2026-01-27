import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/toast.dart';
import 'package:flutter_ecommerce_app/firebase_helpers/firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter_ecommerce_app/widgets/top_tiles/top_tiles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTiles(title: "Create Account", subtitle: "Welcome To Jean Shop!"),
              SizedBox(height: 13.0),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  labelText: 'UserName',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 12.0),
              PrimaryButton(
                title: "SignUp",
                onPressed: () async {
                  bool isValidated = signupValid(
                      email.text, password.text, name.text, phone.text);
                  if (isValidated) {
                    await FirebaseAuthHelper.instance.signUp(
                        email.text, password.text, name.text, phone.text, context);
                  }
                },
              ),
              SizedBox(height: 12.0),
              Center(
                child: Text(
                  'I already have account!',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
              ),
              SizedBox(height: 12.0),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login here',
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
