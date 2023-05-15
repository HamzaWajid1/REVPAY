import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revpay/Home_Page.dart';
import 'package:revpay/add_loan.dart';
import 'package:revpay/loan_details.dart';
import 'package:revpay/send_money.dart';
import 'package:revpay/widgets/bottomappbar.dart';

import 'model/User.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomappbar(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'My Account',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.notifications,
                    )
                  ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 37, 24, 215),
                    color: const Color.fromARGB(255, 47, 33, 243),
                    // color: Color(0xFF52AA8A),
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                height: 800,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage('assets/cc.png'))),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.user.cnicNumber.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ]),
                        const Text(
                          '22/04',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Balance',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          '\$ ${widget.user.balance}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Less details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Name',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.userName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Cnic',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.cnicNumber.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          '03465479181',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Yearly Income',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.yearlyIncome.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Maritial Status',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.maritalStatus,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Address',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.address,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Designation',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.designation,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Date Of Birth',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.user.dateOfBirth.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
