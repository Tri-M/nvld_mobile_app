class UserModel {
  String? uid;
  String? email;
  String? name;
  String? dob;
  String? userType;
  String? phoneNumber;
  String? password;
  int? level;
  String? staff;

  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.dob,
      this.password,
      this.phoneNumber,
      this.userType,
      this.level,
      this.staff});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['Email'],
        name: map['Name'],
        dob: map['Dob'],
        userType: map['UserType'],
        password: map['Password'],
        phoneNumber: map['Phonenumber'],
        level: map['Level'],
        staff: map['Staff']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Email': email,
      'Name': name,
      'Dob': dob,
      'UserType': userType,
      'Phonenumber': phoneNumber,
      'Password': password,
      'Level': level,
      'Staff': staff,
    };
  }
}
