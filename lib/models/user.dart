class UserData {
  final String uid;
  final String name;
  final String email;
  final String about;
  final String password;
  final String phone;

  const UserData({
    required this.uid,
    required this.name,
    required this.email,
    required this.about,
    required this.password,
    required this.phone,
  });

  // Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  //       'userId': uid,
  //       'Name': name,
  //       'email': email,
  //     };
}
