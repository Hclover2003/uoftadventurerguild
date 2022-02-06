import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //material
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:uoftadventurerguild/constants.dart';
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
    } else if (!user.emailVerified &&
        user.uid != "w7JmcAEf2jQLDwrAhsUPw6r1RHr2") {
      print(user.emailVerified);
      return Scaffold(
          backgroundColor: c3,
          body: Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "Please verify your email address to continue! :)",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: c1),
              ),
              TextButton(
                  onPressed: () async {
                    user
                        .sendEmailVerification()
                        .catchError((e) => print(e.toString()));
                    user.getIdToken(true);
                    user.reload();
                    print(user.emailVerified);
                  },
                  child: Text("Resend Email"))
            ]),
          )));
    } else {
      //Stream #2: UserData(name, weight, height, age)
      return StreamProvider<UserData>.value(
        initialData: UserData(
            createdAt: Timestamp.now(),
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
