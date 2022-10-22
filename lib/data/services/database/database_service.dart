
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app/domain/uses_cases/common/utlis.dart';

import '../../../domain/uses_cases/models/appeal/appeal.dart';
import '../../../domain/uses_cases/models/authentication/user.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addUserData(UserModel userData) async {
    await _db.collection("Users").doc(userData.uid).set(userData.toMap());
  }

  Future<List<UserModel>> retrieveUserData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<String> retrieveUserName(UserModel user) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Users").doc(user.uid).get();
    return snapshot.data()!["fullName"];
  }



  Future<List<AppealModel>> getAppeals() async {
    return List.generate(18, (index) => AppealModel(
      title: Utils.generateRandomString(12),
      shortDescription: Utils.generateRandomString(15),
      content: Utils.generateRandomString(35),
      userId: Utils.generateRandomString(15),
      status: true,
      date: DateTime.now(),
      files: []
    ));
  }

  String randomId({required String collectionName}) {
    var _randomId = FirebaseFirestore.instance.collection(collectionName).doc().id;
    return _randomId;
  }
}