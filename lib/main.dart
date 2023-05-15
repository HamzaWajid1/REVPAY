import 'package:flutter/material.dart';
import 'package:revpay/firstPage.dart';
import 'package:revpay/model/postgre_connection_parameters.dart';

void main() {
  PostgreConnectionParameters.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const firstPage(),
    );
  }
}
