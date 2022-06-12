class ScoreModel {
  String? uid;
  String? email;
  List? score;

  ScoreModel({this.uid, this.email, this.score});

  // receiving data from server
  factory ScoreModel.fromMap(map) {
    return ScoreModel(
        uid: map['uid'], email: map['Email'], score: map['Score']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Email': email,
      'Score': score,
    };
  }
}
