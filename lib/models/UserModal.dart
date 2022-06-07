class UserModel {
  String? uid;
  String? email;
  String? name;
  String? dob;
  String? userType;
  String? phoneNumber;
  String? password;

  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.dob,
      this.password,
      this.phoneNumber,
      this.userType});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['Email'],
        name: map['Name'],
        dob: map['Dob'],
        userType: map['UserType'],
        password: map['Password'],
        phoneNumber: map['Phonenumber']);
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
      'Password': password
    };
  }
}
