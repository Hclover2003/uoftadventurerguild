import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uoftadventurerguild/models/appuser.dart';
import 'package:uoftadventurerguild/models/quest.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection references
  final CollectionReference<Map<String, dynamic>> questCollection =
      FirebaseFirestore.instance.collection('postdata');

  final CollectionReference<Map<String, dynamic>> userdataCollection =
      FirebaseFirestore.instance.collection('userdata');

//QUESTS
  //get quests
  Stream<List<Quest>> get quests {
    return questCollection.snapshots().map(_questListFromSnapshot);
  }

  List<Quest> _questListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Quest(
          createdAt: doc["createdAt"],
          date: doc["date"],
          title: doc["title"],
          creatoruid: doc["creatoruid"],
          capacity: doc["capacity"],
          grade: doc["grade"],
          location: doc["location"],
          gender: doc["gender"],
          virtual: doc["virtual"],
          description: doc["description"],
          tags: doc["tags"]);
    }).toList();
  }

  //create quest
  Future<void> createQuest(Quest quest) async {
    await questCollection.add({
      "createdAt": quest.createdAt,
      "date": quest.date,
      "title": quest.title,
      "creatoruid": quest.creatoruid,
      "capacity": quest.capacity,
      "grade": quest.grade,
      "gender": quest.gender,
      "virtual": quest.virtual,
      "location": quest.location,
      "description": quest.description,
      "tags": quest.tags
    });
  }

  //delete quest
  Future<void> deleteQuest(String id) async {
    return questCollection
        .doc(id)
        .delete()
        .then((value) => print("item deleted successfully"));
  }

//USER
  //update user document details
  Future<void> createUserData(UserData userData) async {
    return await userdataCollection.doc(uid).set({
      "createdAt": Timestamp.now(),
      "uid": uid,
      "name": userData.name,
      "majors": userData.majors,
      "currentcourses": userData.currentcourses,
      "age": userData.age,
      "gender": userData.gender,
      "pronoun": userData.pronoun,
      "oncampus": userData.oncampus,
      "location": userData.location
    });
  }

  //get userdata stream
  Stream<UserData> get userData {
    return userdataCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        createdAt: snapshot["createdAt"],
        name: snapshot["name"],
        majors: snapshot["majors"],
        currentcourses: snapshot["currentcourses"],
        age: snapshot["age"],
        gender: snapshot["gender"],
        pronoun: snapshot["pronoun"],
        oncampus: snapshot["oncampus"],
        location: snapshot["location"]);
  }
}
