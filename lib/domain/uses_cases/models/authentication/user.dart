import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? email;
  String? password;
  final String? fullName;
  UserModel({this.uid, this.email, this.password, this.fullName, this.isVerified});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        fullName = doc.data()!["fullName"];


  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? password,
    String? fullName,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        isVerified: isVerified ?? this.isVerified
    );
  }
}