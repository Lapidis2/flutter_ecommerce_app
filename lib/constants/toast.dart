import 'package:flutter/material.dart'
    show
        AlertDialog,
        BuildContext,
        Colors,
        CircularProgressIndicator,
        showDialog;
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: Color(0xffF5591F)),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text("Loading..."),
              ),
            ],
          ),
        );
      },
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

bool loginValid(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage('Please enter email and password');
    return false;
  } else if (email.isEmpty) {
    showMessage('Please enter email');
    return false;
  } else if (password.isEmpty) {
    showMessage('Please enter password');
    return false;
  } else {
    return true;
  }
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return 'The email address is invalid.';
    case 'user-not-found':
      return 'No user found with this email.';
    case 'wrong-password':
      return 'Incorrect password.';
    case 'user-disabled':
      return 'This user account has been disabled.';
    case 'email-already-in-use':
      return 'This email is already registered.';
    case 'operation-not-allowed':
      return 'Email/password login is not enabled.';
    case 'weak-password':
      return 'The password is too weak.';
    default:
      return errorCode;
  }
}
