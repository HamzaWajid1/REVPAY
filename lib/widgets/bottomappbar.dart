import 'package:flutter/material.dart';

import 'package:revpay/add_loan.dart';
import 'package:revpay/loan_details.dart';

class CustomBottomappbar extends StatefulWidget {
  const CustomBottomappbar({Key? key}) : super(key: key);

  @override
  State<CustomBottomappbar> createState() => _BottomappbarState();
}

class _BottomappbarState extends State<CustomBottomappbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow()],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 32,
                // color: Color.fromARGB(255, 47, 33, 243),
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.assessment,
                size: 32,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 32,
              )),
        ],
      ),
    );
  }
}
