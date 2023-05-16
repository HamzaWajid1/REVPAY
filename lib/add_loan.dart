import 'package:flutter/material.dart';
import 'package:revpay/Home_Page.dart';
import 'package:revpay/model/User.dart';
import 'package:revpay/model/loan.dart';
import 'package:postgres/postgres.dart';
import 'package:revpay/model/postgre_connection_parameters.dart';
import 'package:revpay/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.user});
  final User user;

  @override
  Editprofilepagestate createState() => Editprofilepagestate();
}

class Editprofilepagestate extends State<EditProfilePage> {
  String cnic1 = '';
  int cnic2 = 0;
  double pw = 0;
  double p = 0;
  Loan loan = Loan("", "", "");
  final TextEditingController _name = TextEditingController();
  late String? nameError = null;
  final TextEditingController cnic = TextEditingController();
  final TextEditingController _value = TextEditingController();
  late String? valueError = null;

  final TextEditingController _period = TextEditingController();
  late String? periodError = null;

  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void storeData() {
    sharedPreferences.setString('name', _name.text);
    sharedPreferences.setString('assetvalue', _value.text);
    sharedPreferences.setString('loanperiod', _period.text);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 89, 78, 235),
          title: const Text('New Loan Details'),
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            height: (height * 2) / 100,
          ),
          Stack(children: [
            Positioned(
                // top: 15,
                child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      height: 3,
                      width: double.infinity,
                      color: Colors.black,
                      // decoration: BoxDecoration(b),
                    ))),
            Positioned(
                left: (width - 180) / 2,
                bottom: 10,
                child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: 25,
                    // width: 25,
                    child: const Text(
                      'Loan Information',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
          ]),
          Expanded(
            child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 40),
                  TextFieldWidget(
                      errorMessage: nameError,
                      textInputType: TextInputType.name,
                      controller1: _name,
                      label: 'Asset Name',
                      text: _name.text,
                      onChanged: (value) {
                        loan.assetName = _name.text;
                      }),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                      errorMessage: valueError,
                      textInputType: TextInputType.number,
                      controller1: _value,
                      label: 'Asset Value',
                      text: _value.text,
                      onChanged: (value) {
                        pw = double.parse(_value.text);
                      }),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                      errorMessage: periodError,
                      textInputType: TextInputType.number,
                      controller1: _period,
                      label: 'Loan Period',
                      text: _period.text,
                      onChanged: (period) {
                        p = double.parse(_period.text);
                      }),
                  const SizedBox(height: 40),
                  Container(
                      color: const Color.fromRGBO(2, 2, 2, 0),
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 89, 78, 235)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          child: const Text("Add Loan",
                              style: TextStyle(fontSize: 22)),
                          onPressed: () {
                            widget.user.balance = widget.user.balance + pw;
                            debugPrint('$cnic2');
                            debugPrint('$pw');
                            debugPrint('$p');
                            debugPrint('${loan.assetName}');
                            adding_loan(
                                widget.user.cnicNumber, loan.assetName, pw, p);

                            if (_name.text.isEmpty) {
                              nameError = 'This field is empty';
                            }
                            if (_value.text.isEmpty) {
                              valueError = 'This field is empty';
                            }
                            if (_period.text.isEmpty) {
                              periodError = 'This field is empty';
                            }

                            setState(() {});
                            storeData();
                            initialGetSavedData();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(user: widget.user)));
                          })),
                ]),
          ),
        ]));
  }
}

void adding_loan(
    int cnic, String asset_name, double asset_value, double period) async {
  double mon = asset_value / (12.0 * period);
  int pa = period.toInt();
  var conn = PostgreSQLConnection(
      PostgreConnectionParameters.ip,
      PostgreConnectionParameters.port,
      PostgreConnectionParameters.databaseName,
      username: PostgreConnectionParameters.username,
      password: PostgreConnectionParameters.password);
  debugPrint('${conn.port}');

  await conn.open();
  await conn.query('''
  insert into asset_loan(monthly_payment,expected_loan_completion_date,loan_given_date,bank_id,years_of_contract,asset_name,asset_present_value,account_num)
	 values($mon,CURRENT_DATE+($pa*365),CURRENT_DATE,1,$period,'$asset_name',$asset_value,$cnic);
   

''');
  await conn.query('''
  UPDATE bank_account
SET amount_present = amount_present+$asset_value
WHERE acc_num=$cnic;
   ''');

  await conn.close();
}
