

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
          Container(
               padding :EdgeInsets.only(top: 50),    
           child : Text('Sender Account number :',style:TextStyle(color: Colors.black, fontSize: 20),),
          ),
         Container(
          padding :EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'account number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
         ),
              Container(
               padding :EdgeInsets.only(top: 40),    
           child : Text('Amount :',style:TextStyle(color: Colors.black, fontSize: 20),),
          ),
         Container(
          padding :EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
         ),
         Container(
               padding :EdgeInsets.only(top: 40),    
           child : Text('Recipient Account number :',style:TextStyle(color: Colors.black, fontSize: 20),),
          ),
         Container(
          padding :EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'account number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
         ),
         const SizedBox(height: 235,),
         ElevatedButton(onPressed:() {}, child: Text('Transfer Amount'))

],
    )
 );
  }
}