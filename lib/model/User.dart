class User {
  String name;
  String hostelNumber;
  String roomNumber;
  String mobileNumber;
  String regNumber;
  String email_;

  User(this.name, this.hostelNumber, this.mobileNumber, this.roomNumber,
      this.regNumber, this.email_);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        hostelNumber = json['hostel_number'],
        roomNumber = json['roon_number'],
        mobileNumber = json['mobile number'],
        regNumber = json['reg_number'],
        email_ = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'hostel_number': hostelNumber,
        'mobile_number': mobileNumber,
        'reg_number': regNumber,
        'room_number': roomNumber,
        'email': email_
      };
}
