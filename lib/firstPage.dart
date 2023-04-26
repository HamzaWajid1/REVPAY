import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:revpay/verification.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => firstPageState();
}

class firstPageState extends State<firstPage> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 239, 239),
        body: ListView(
          shrinkWrap: false,
          children: [
            Container(
              height: height_ / 32,
              width: width_,
              //child: Text('hjkbkjw'),
            ),
            Column(children: [
              Container(
                  height: height_ / 4,
                  width: height_ / 4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/dld.jpg'),
                      fit: BoxFit.fill,
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(height_ / 8, 10, height_ / 8, 10),
                alignment: Alignment.center,
                child: Text(
                  'RevPay',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              )
            ]),
            SizedBox(height: height_ / 45),
            Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: Column(
                children: [
                  SizedBox(
                    height: height_ / 19,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      //scrollPadding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                      controller: _email,
                      maxLines: 1,

                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 249, 248, 248),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(150, 102, 107, 110),
                                  width: 20)),
                          hintText: 'Email'),
                    ),
                  ),
                  SizedBox(
                    height: height_ / 40,
                  ),
                  SizedBox(
                    height: height_ / 19,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      //scrollPadding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                      controller: _password,
                      maxLines: 1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 249, 248, 248),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 92, 91, 91),
                                  width: 20)),
                          hintText: 'Password'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: height_ / 200),
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: 'Forgot Password? ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('The button is clicked!');
                            },
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: height_ / 50),
            Container(
              width: width_ / 2,
              alignment: Alignment.center,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 187, 44, 22))),
                onPressed: () {},
                child: Text(
                  'Login',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            SizedBox(
              height: height_ / 50,
            ),
            Stack(children: [
              Positioned(
                  child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        color: Colors.black,
                      ))),
              Positioned(
                  left: (width_ - 65) / 2,
                  bottom: 10,
                  child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      color: Color.fromARGB(255, 243, 239, 239),
                      height: 25,
                      // width: 25
                      child: const Text(
                        'OR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))),
            ]),
            SizedBox(height: height_ / 50),
            Container(
              padding: EdgeInsets.only(left: width_ / 3, right: width_ / 3),
              height: 40,
              width: (width_ / 2),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/applelogo.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/googlelogo.webp'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: height_ / 36),
                Container(
                  padding: EdgeInsets.only(left: width_ / 8, right: width_ / 8),
                  // color: Color.fromARGB(255, 247, 246, 246),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 247, 246, 246))),
                    onPressed: () {
                      check();
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verification('3216879672'),
                          ));*/
                    },
                    child: Text(
                      'Create Account',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

void check() async {
  var conn = PostgreSQLConnection('127.0.0.1', 5432, 'RevPay',
      username: 'postgres', password: ' Hamza.paracha1');
  debugPrint('${conn.port}');
  await conn.open();
  await conn.query('''
  insert into mybank(bank_id,daily_cash_flow,loan_given_amount,
				  industrial_investment_growth,gold_worth,cash_worth
				  
				  )
				  values(2,0,0,0,0,0);
   

''');
  conn.open().then((value) {
    debugPrint('hello');
  });
  await conn.close();
}
