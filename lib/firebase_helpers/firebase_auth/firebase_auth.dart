import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/toast.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChanges => _auth.authStateChanges();
  Future<bool> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
        if (!context.mounted) return false;
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
       if (context.mounted) {
      Navigator.of(context).pop(); 
      showMessage(getMessageFromErrorCode(e.code));
    }
      return false;
    }
  }
}
