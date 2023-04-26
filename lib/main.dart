import 'package:flutter/material.dart';
import 'package:revpay/firstPage.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/widgets.dart';

void main() {
  check();
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

void check() async {
  final conn = PostgreSQLConnection('localhost', 5432, 'RevPay',
      username: 'postgres', password: 'Hamza.paracha1');
  print(await conn.query('''
  insert into mybank(bank_id,daily_cash_flow,loan_given_amount,
				  industrial_investment_growth,gold_worth,cash_worth
				  
				  )
				  values(2,0,0,0,0,0);
   

'''));
  conn.open().then((value) {
    debugPrint('hello');
  });
}
