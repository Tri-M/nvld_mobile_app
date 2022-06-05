class UserModel {
  String? uid;
  String? email;
  String? name;
  String? dob;
  String? phonenumber;
  String? password;

  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.dob,
      this.password,
      this.phonenumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['Email'],
        name: map['Name'],
        dob: map['Dob'],
        password: map['Password'],
        phonenumber: map['Phonenumber']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Email': email,
      'Name': name,
      'Dob': dob,
      'Phonenumber': phonenumber,
      'Password': password
    };
  }
}
