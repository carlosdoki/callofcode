import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/screens/login/componets/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Body(),
      ),
    );
  }
}
