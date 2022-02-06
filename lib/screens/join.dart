import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uoftadventurerguild/constants.dart';
import 'package:uoftadventurerguild/models/quest.dart';

class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

List<Quest> quests = [
  Quest(
      createdAt: Timestamp.now(),
      date: DateTime(2022, 2, 7, 11),
      title: "Newbie Gym Gals",
      creatoruid: "adfsjakk",
      capacity: 4,
      grade: "Third Year",
      location: "Toronto",
      gender: "F",
      virtual: false,
      description:
          "Excited but super nervous to go to the gym for the first time myself. \nAny other girls feel the same way? Let's team up and go together!"),
  Quest(
      createdAt: Timestamp.now(),
      date: DateTime(2022, 2, 7, 11),
      title: "Newbie Gym Gals",
      creatoruid: "adfsjakk",
      capacity: 4,
      grade: "all",
      gender: "F",
      virtual: false,
      location: "Atheletic Center",
      description:
          "Excited but super nervous to go to the gym for the first time myself. \nAny other girls feel the same way? Let's team up and go together!"),
  Quest(
      createdAt: Timestamp.now(),
      date: DateTime(2022, 2, 7, 15, 30),
      title: "Newbie Gym Gals",
      creatoruid: "adfsjakk",
      capacity: 4,
      grade: "first year",
      gender: "F",
      virtual: false,
      location: "Hart House",
      description:
          "Excited but super nervous to go to the gym for the first time myself. \nAny other girls feel the same way? Let's team up and go together!"),
  Quest(
      createdAt: Timestamp.now(),
      date: DateTime(2022, 2, 7, 15, 30),
      title: "Newbie Gym Gals",
      creatoruid: "adfsjakk",
      capacity: 4,
      grade: "first year",
      gender: "F",
      virtual: true,
      location: "Discord",
      description:
          "Excited but super nervous to go to the gym for the first time myself. \nAny other girls feel the same way? Let's team up and go together!")
];

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: c3,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
        child: Column(
          children: [
            Text(
              "Explore",
              style: TextStyle(fontSize: 30, fontFamily: "HammersmithOne"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quests.length,
                itemBuilder: (context, index) {
                  var q = quests[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                        margin: EdgeInsets.only(top: 8),
                        child: ListTile(
                          leading: Text("Feb 20"),
                          tileColor: Color(0xffde8979),
                          title: Text(q.title),
                          subtitle: Text(q.description.replaceRange(
                              (100 < q.description.length)
                                  ? 100
                                  : q.description.length,
                              q.description.length,
                              "...")),
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
