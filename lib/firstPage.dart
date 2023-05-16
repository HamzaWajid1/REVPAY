import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:revpay/Home_Page.dart';
import 'package:revpay/model/User.dart';
import 'package:revpay/model/postgre_connection_parameters.dart';
import 'package:revpay/register.dart';
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
  int cnic1 = 0;
  String password_ = '';
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 251, 251),
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
                      image: AssetImage('assets/credit-card.png'),
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
                      onChanged: (value) {
                        cnic1 = int.parse(_email.text);
                      },
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
                          hintText: 'CNIC'),
                    ),
                  ),
                  SizedBox(
                    height: height_ / 40,
                  ),
                  SizedBox(
                    height: height_ / 19,
                    child: TextField(
                      onChanged: (value) {
                        password_ = _password.text;
                      },
                      obscureText: true,
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
                    width: width_ / 2,
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: '',
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
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 22, 47, 187))),
                onPressed: () {
                  login(context, cnic1, password_);
                },
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
                      color: Color.fromARGB(255, 252, 251, 251),
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
                      //check();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Myregister(),
                          ));
                    },
                    child: Text(
                      'Create Account',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Color.fromARGB(255, 22, 47, 187)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

void login(BuildContext context, int cnic, String password) async {
  List<List<dynamic>> results;
  List<List<dynamic>> results1;
  int checkcnic;
  String checkpassword;
  try {
    results = await PostgreConnectionParameters.query('''
    SELECT cnic_num
    FROM _password
    WHERE cnic_num = '$cnic' and password_='$password';
  ''');
    results1 = await PostgreConnectionParameters.query('''
    SELECT password_
    FROM _password
    WHERE cnic_num = '$cnic' and password_='$password';
  ''');
    checkcnic = results.first.first;
    checkpassword = results1.first.first;

    if (checkcnic == cnic && checkpassword == password) {
      List<List<dynamic>> userDetails = await PostgreConnectionParameters.query(
          'SELECT user_name, yearly_income, marital_status, address, designation, date_of_birth, cnic_number FROM users WHERE cnic_number=$checkcnic');

      List<List<dynamic>> accountNumber =
          await PostgreConnectionParameters.query(
              'SELECT acc_num FROM user_bank WHERE cnic_num=$checkcnic');

      List<List<dynamic>> balance = await PostgreConnectionParameters.query(
          'SELECT amount_present FROM bank_account WHERE acc_num=${accountNumber.first.first}');

      print(userDetails);
      print(accountNumber);
      print(balance);
      User user = User(
          userName: userDetails.first[0],
          mobileNumber: '',
          yearlyIncome: userDetails.first[1],
          maritalStatus: userDetails.first[2],
          address: userDetails.first[3],
          designation: userDetails.first[4],
          dateOfBirth: userDetails.first[5],
          cnicNumber: userDetails.first[6],
          balance: balance.first.first);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    user: user,
                  )));
    }
  } catch (err) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('Invalid Credentials'),
            ));
  }
}
