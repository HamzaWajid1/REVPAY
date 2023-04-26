import 'package:flutter/material.dart';
import 'package:revpay/Home_Page.dart';

class Myregister extends StatefulWidget {
  const Myregister({Key? key}) : super(key: key);

  @override
  _MyregisterState createState() => _MyregisterState();
}

class _MyregisterState extends State<Myregister> {
  @override
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
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'First Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Last Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
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
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Marital Status',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'CNIC - Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Designation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Age',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                  SizedBox(height: 35),
                  TextField(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
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
