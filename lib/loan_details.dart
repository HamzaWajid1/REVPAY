import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:postgres/postgres.dart';
import 'package:revpay/Home_Page.dart';
import 'package:revpay/model/postgre_connection_parameters.dart';
import 'package:revpay/widgets/bottomappbar.dart';

import 'model/User.dart';

class Loan extends StatefulWidget {
  const Loan({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<Loan> createState() => _loanState();
}

class _loanState extends State<Loan> {
  List<List<dynamic>> loans = [[]];
  @override
  void initState() {
    super.initState();
    getLoanDetails();
  }

  Future<dynamic> getLoanDetails() async {
    loans = await PostgreConnectionParameters.query(
        'SELECT monthly_payment, expected_loan_completion_date, loan_given_date, years_of_contract, asset_name, asset_present_value FROM asset_loan');
    print(loans);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 89, 78, 235),
        title: const Text('Loan Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                  future: getLoanDetails(),
                  builder: (context, snapshot) => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: loans.length,
                      itemBuilder: (context, index) => loandetail(context,
                          loans[index][4], loans[index][5], loans[index][1])))
            ],
          )),
    );
  }
}

Widget loandetail(BuildContext context, String assetName, double asset_value,
    DateTime loan_period) {
  double width_ = MediaQuery.of(context).size.width;
  double height_ = MediaQuery.of(context).size.height;
  debugPrint('${loan_period.year}');
  double per = (loan_period.year - 2023) * 12;

  double montpay = asset_value / per;
  return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 37, 24, 215),
          color: Color.fromARGB(255, 150, 192, 218),
          // color: Color(0xFF52AA8A),
          borderRadius: BorderRadius.circular(20)),
      width: (width_ * 5) / 6,
      padding: const EdgeInsets.all(20),
      height: height_ / 3,
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
              asset_value.toString(),
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
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Expected Completion year',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            width: double.infinity,
            child: Text(
              '${loan_period.year}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ]));
}
