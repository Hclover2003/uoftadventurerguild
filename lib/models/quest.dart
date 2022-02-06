import 'package:cloud_firestore/cloud_firestore.dart';

class Quest {
  final Timestamp createdAt;
  final DateTime date;
  final String title;
  final String creatoruid;
  final String grade;
  final String gender;
  final int capacity;
  final bool virtual;
  final String location;
  final List<String> tags;
  final String description;
  final String additional;

  Quest(
      {required this.createdAt,
      required this.date,
      required this.title,
      required this.creatoruid,
      required this.capacity,
      required this.grade,
      required this.gender,
      this.additional = "none",
      required this.virtual,
      this.tags = const ["general"],
      required this.description,
      required this.location});
}
