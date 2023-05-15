import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:revpay/verification_email.dart';
import 'model/User.dart' as a;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verification extends StatefulWidget {
  final String phone;
  const Verification(this.phone, {super.key});

  @override
  VerificationState createState() => VerificationState();
}

class VerificationState extends State<Verification> {
  String verificationCode = '';
  late SharedPreferences sharedPreferences;
  // a.User user = a.User("", "", 2, 2);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('mobile', widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF4A47),
      ),
      body: ListView(
          padding: EdgeInsets.fromLTRB(20, height * (5 / 100), 20, 0),
          children: [
            Text(
              'A Verification Code has been sent to +92-${widget.phone}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              length: 6,
              onCompleted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode, smsCode: pin))
                      .then((value) async {
                    print('value is ${value.user}');
                    if (value.user != null) {
                      setState(() {
                        // user.mobileNumber = widget.phone;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => verify(),
                          ));
                    }
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please wait a few seconds to recieve the code',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ]),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
          //   if(value.user!=null)
          //   {
          //     print("USER LOGGED IN");
          //   }
          // });
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verificationCode = verificationId;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
