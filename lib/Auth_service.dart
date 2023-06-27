import 'package:appcheckqr/login.dart';

import 'home_page.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void LoginUser(context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then(
            (value) => {
              print("User Is Logged In"),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => HomeScreen(),
                ),
              ),
            },
          );
    } catch (e) {
      _showDialog("This account is not found", context);
    }
  }

  void RegisterUser(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        print("User Is Registerd");
      });
    } catch (e) {
      _showDialog("This account already exists", context);
    }
  }

  void LogOutUser(context) async {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }

  void _showDialog(String messger, context) {
    showDialog(
      context: context,
      builder: (context)  {
        return AlertDialog(
          title: const Text("Error", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
          content: Text(
            //"This account already exists",
              messger,
            style: TextStyle(fontSize: 18),),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,),
              child: const Text('Cancel', style: TextStyle( fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
