import 'package:flutter/material.dart';

class Loan {
  String assetName;
  String assetPresentValue;
  String loanPeriod;

  Loan(this.assetName, this.assetPresentValue, this.loanPeriod);

  Loan.fromJson(Map<String, dynamic> json)
      : assetName = json['name'],
        assetPresentValue = json['value'],
        loanPeriod = json['period'];

  Map<String, dynamic> toJson() =>
      {'name': assetName, 'value': assetPresentValue, 'period': loanPeriod};
}
