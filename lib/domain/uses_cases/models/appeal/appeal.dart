import 'package:cloud_firestore/cloud_firestore.dart';

class AppealModel {
  String? uid;
  String? userId;
  final String? title;
  final String? shortDescription;
  final String? content;
  final bool? status;
  final DateTime? date;
  final List<String>? files;
  AppealModel({ this.uid, this.userId, this.title, this.shortDescription, this.content, this.date, this.status, this.files});

  Map<String, dynamic> toFormMap() {
    return {
      'title': title,
      'userId': userId,
      'shortDescription': shortDescription,
      'content': content,
      'status': status,
      'date': date,
    };
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userId': userId,
      'title': title,
      'shortDescription': shortDescription,
      'content': content,
      'status': status,
      'date': date,
    };
  }


  AppealModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        // userId = doc.data()!["userId"],
        title = doc.data()!["title"],
        shortDescription = doc.data()!["shortDescription"],
        content = doc.data()!["content"],
        status = doc.data()!["status"],
        files = doc.data()!['files'] != null ? doc.data()!['files'].cast<String>() : [],
        date = doc.data()!["date"].toDate();

  AppealModel.fromJson(Map<String, dynamic> json):
        userId = json["userId"],
        title = json["title"],
        shortDescription = json["shortDescription"],
        content = json["content"],
        status = json["status"],
        files = json['files'] != null ? json['files'].cast<String>() : [],
        // files = json['files'].cast<String>(),
        date = json["date"].toDate();


  AppealModel copyWith({
    String? userId,
    String? title,
    String? shortDescription,
    String? uid,
    String? content,
    bool? status,
    DateTime? date
  }) {
    return AppealModel(
        uid: uid ?? this.uid,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        shortDescription: title ?? this.shortDescription,
        content: content ?? this.content,
        status: status ?? this.status,
        date: date ?? this.date,
    );
  }
}