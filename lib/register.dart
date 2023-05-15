import 'package:flutter/material.dart';
import 'package:revpay/Home_Page.dart';
import 'package:postgres/postgres.dart';
import 'package:revpay/firstPage.dart';
import 'package:revpay/widgets/textfield_widget.dart';

import 'model/postgre_connection_parameters.dart';

class Myregister extends StatefulWidget {
  const Myregister({Key? key}) : super(key: key);

  @override
  _MyregisterState createState() => _MyregisterState();
}

class _MyregisterState extends State<Myregister> {
  @override
  String name1 = '';

  int bank_id1 = 1;
  double yearly_income1 = 0;
  String maritial_status1 = '';
  int cnic_number1 = 0;
  String phone1 = '';
  String address1 = '';
  String designation1 = '';
  String email1 = '';
  String dob1 = '2002-01-01';
  String password1 = '';
  final name = TextEditingController();

  final Yearly_income = TextEditingController();
  final M_status = TextEditingController();
  final CNIC = TextEditingController();
  final Phone_number = TextEditingController();
  final address = TextEditingController();
  final designation = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final password = TextEditingController();
  final re_enter = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 0, top: 70),
            child: Text(
              'Create Account',
              style: TextStyle(
                  color: Color.fromARGB(255, 81, 81, 81), fontSize: 40),
            ),
          ),
          SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                      onChanged: (value) {
                        name1 = name.text;
                      },
                      controller: name,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'First Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        yearly_income1 = double.parse(Yearly_income.text);
                      },
                      controller: Yearly_income,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Yearly income',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        maritial_status1 = M_status.text;
                      },
                      controller: M_status,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Marital Status',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        cnic_number1 = int.parse(CNIC.text);
                      },
                      controller: CNIC,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'CNIC - Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        phone1 = Phone_number.text;
                      },
                      controller: Phone_number,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        address1 = address.text;
                      },
                      controller: address,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        designation1 = designation.text;
                      },
                      controller: designation,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Designation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        email1 = email.text;
                      },
                      controller: email,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      controller: age,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Age',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {
                        password1 = password.text;
                      },
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      onChanged: (value) {},
                      controller: re_enter,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Re-enter password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (password1 == re_enter.text) {
                              register(
                                name1,
                                bank_id1,
                                yearly_income1,
                                maritial_status1,
                                cnic_number1,
                                phone1,
                                address1,
                                designation1,
                                email1,
                                dob1,
                              );
                              Future.delayed(Duration(seconds: 5), () {
                                login_register(cnic_number1, password1);
                                Account_register(cnic_number1);
                              });
                              Future.delayed(Duration(seconds: 10), () {
                                user_bank(cnic_number1);
                              });
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => firstPage()));
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  )
                ],
              ))
        ]),
      ),
    );
  }
}

void register(
    String name1,
    int bank_id1,
    double yearly_income1,
    String maritial_status1,
    int cnic_number1,
    String phone1,
    String address1,
    String designation1,
    String email1,
    String dob1) async {
  await PostgreConnectionParameters.query('''
  insert into users(user_name,bank_id,yearly_income,marital_status,cnic_number,ph_no,address,designation,email,date_of_birth)
	values('${name1}',${bank_id1},${yearly_income1},'${maritial_status1}',${cnic_number1},'${phone1}','${address1}','${designation1}','${email1}','2002-01-01');
   

''');
}

void login_register(int cnic, String password) async {
  await PostgreConnectionParameters.query('''
  insert into _password(cnic_num,password_)
				  values(${cnic},'${password}');
   

''');
}

void Account_register(int cnic) async {
  await PostgreConnectionParameters.query('''
  insert into bank_account(acc_num,creation_date,amount_present,bank_id)
				  values(${cnic},CURRENT_DATE,0.0,1);
   

''');
}

void user_bank(int cnic) async {
  await PostgreConnectionParameters.query('''
  insert into user_bank(cnic_num,acc_num)
				  values(${cnic},${cnic});
''');
}
