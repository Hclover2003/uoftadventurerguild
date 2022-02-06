import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  AppUser({required this.uid});
}

class UserData {
  final Timestamp createdAt;
  final String name;
  final List<String> majors;
  final List<String> currentcourses;
  final int age;
  final String gender;
  final String pronoun;
  final bool oncampus;
  final String location;

  UserData(
      {required this.createdAt,
      required this.name,
      required this.majors,
      required this.currentcourses,
      required this.age,
      required this.gender,
      required this.pronoun,
      required this.oncampus,
      this.location = "Toronto"});
}
