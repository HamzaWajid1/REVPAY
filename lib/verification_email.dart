import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => verifyState();
}

class verifyState extends State<verify> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return Scaffold();
  }
}
