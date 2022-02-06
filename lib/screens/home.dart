import 'package:flutter/material.dart';
import 'package:uoftadventurerguild/constants.dart';
import 'package:uoftadventurerguild/screens/join.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: c1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          children: [
            TextButton(onPressed: () async {}, child: Text("populate")),
            Text(
              "Hi \nLisa!",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 60, fontFamily: "HammersmithOne"),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: quests.length,
                itemBuilder: (context, index) {
                  var q = quests[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                        margin: EdgeInsets.only(top: 8),
                        child: ListTile(
                          tileColor: Color(0xfffeb851),
                          leading: Text("Feb 7"),
                          title: Text("${q.title} @ ${q.location}"),
                          subtitle: Text(q.description.replaceRange(
                              (80 < q.description.length)
                                  ? 70
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
