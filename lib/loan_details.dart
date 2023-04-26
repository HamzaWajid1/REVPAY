import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revpay/widgets/bottomappbar.dart';

class Loan extends StatefulWidget {
  const Loan({Key? key}) : super(key: key);

  @override
  State<Loan> createState() => _loanState();
}

class _loanState extends State<Loan> {
  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '      My Loans',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.notifications,
                )
              ]),
          const SizedBox(
            height: 20,
          ),
          loandetail(context, "hamza", '10000', '6'),
          const SizedBox(height: 20),
          loandetail(context, "saad", '20000', '8'),
          const SizedBox(height: 20),
          loandetail(context, "saad", '20000', '8'),
          const SizedBox(height: 20),
          loandetail(context, "saad", '20000', '8'),
        ],
      )),
    );
  }
}

Widget loandetail(BuildContext context, String assetName, String asset_value,
    String loan_period) {
  double width_ = MediaQuery.of(context).size.width;
  double height_ = MediaQuery.of(context).size.height;
  double per = double.parse(loan_period) * 12;
  double montpay = double.parse(asset_value) / per;
  return Container(
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 37, 24, 215),
          color: Color.fromARGB(255, 89, 78, 235),
          // color: Color(0xFF52AA8A),
          borderRadius: BorderRadius.circular(20)),
      width: (width_ * 5) / 6,
      padding: const EdgeInsets.all(20),
      height: height_ / 3.42,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: const [
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Image(image: AssetImage('assets/cc.png'))),
              SizedBox(
                width: 20,
              ),
              Text(
                '**** 2236',
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
          height: 15,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Loan Amount',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            width: double.infinity,
            child: Text(
              asset_value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Monthly Payement',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            width: double.infinity,
            child: Text(
              montpay.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: const Text(
            'More details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ),
        )
      ]));
}
