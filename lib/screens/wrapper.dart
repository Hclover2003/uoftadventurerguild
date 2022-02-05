import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //material
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:uoftadventurerguild/screens/authentication/authenticate.dart'; //screens
import 'package:uoftadventurerguild/screens/apppage.dart';
import 'package:uoftadventurerguild/models/appuser.dart'; //models
import 'package:uoftadventurerguild/services/database.dart'; //services

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Returns user every login/logout
    final user = Provider.of<User?>(context);

    //Returns Home/Auth widget
    if (user == null) {
      return Authenticate();
    } else {
      //Stream #2: UserData(name, weight, height, age)
      return StreamProvider<UserData>.value(
        initialData: UserData(
            createdAt: DateTime.now(),
            name: "guest",
            majors: ["computer science"],
            currentcourses: ["csc148", "csc165"],
            age: 18,
            gender: "F",
            pronoun: "she/her",
            oncampus: true),
        value: DatabaseService(uid: user.uid).userData,
        child: AppPage(),
      );
    }
  }
}
