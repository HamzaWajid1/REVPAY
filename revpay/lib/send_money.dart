

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: ListView(
        children: [       
          const SizedBox(height: 5),
  /* Container(
    height: 710,
    width: 200,
    decoration: BoxDecoration(
        image: DecorationImage(image : AssetImage('assets/send money page.png'), fit: BoxFit.fill)),
    //  child: Scaffold(
    //   backgroundColor: Colors.transparent,
    //  ),
   )*/


],
      
       
       
             )
      
      
    );
  }
}