import 'package:cloud_firestore/cloud_firestore.dart';

class Quest {
  final Timestamp createdAt;
  final Timestamp date;
  final String title;
  final String creatoruid;
  final int age;
  final String gender;
  final int capacity;
  final bool virtual;
  final String location;
  final List<String> tags;
  final String description;

  Quest(
      {required this.createdAt,
      required this.date,
      required this.title,
      required this.creatoruid,
      required this.capacity,
      required this.age,
      required this.gender,
      required this.virtual,
      this.tags = const ["general"],
      required this.description,
      this.location = "Toronto"});
}
