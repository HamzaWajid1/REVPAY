class User {
  String userName;
  String mobileNumber;
  double yearlyIncome;
  String maritalStatus;
  String address;
  String designation;
  DateTime dateOfBirth;
  int cnicNumber;
  double balance;

  User(
      {required this.userName,
      required this.mobileNumber,
      required this.yearlyIncome,
      required this.maritalStatus,
      required this.address,
      required this.designation,
      required this.dateOfBirth,
      required this.cnicNumber,
      required this.balance});
}
