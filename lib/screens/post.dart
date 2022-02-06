import 'package:flutter/material.dart';
import 'package:uoftadventurerguild/constants.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String? title;
  String? description;
  String? location;
  String? date;
  bool? checkedVal = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: c2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: textInputDecoration.copyWith(
                  hintText: 'Title',
                  hintStyle:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  fillColor: c1,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c2, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1d, width: 3.0))),
              validator: (val) => val!.isEmpty ? 'enter name' : null,
              onChanged: (val) {
                setState(() => title = val);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Location (check box if virtual)',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14),
                          fillColor: c1,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: c2, width: 0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: c1d, width: 3.0))),
                      validator: (val) =>
                          val!.isEmpty ? 'enter location' : null,
                      onChanged: (val) {
                        setState(() => location = val);
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Transform.scale(
                    scale: 3,
                    child: Checkbox(
                      value: checkedVal,
                      activeColor: c1,
                      checkColor: c3,
                      onChanged: (newVal) {
                        setState(() {
                          checkedVal = newVal;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                  hintText: 'Date & Time',
                  hintStyle:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                  fillColor: c1,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c2, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1d, width: 3.0))),
              validator: (val) => val!.isEmpty ? 'enter location' : null,
              onChanged: (val) {
                setState(() => location = val);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 3,
              decoration: textInputDecoration.copyWith(
                  hintText: 'Description',
                  hintStyle:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  fillColor: c1,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c2, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1d, width: 3.0))),
              onChanged: (val) {
                setState(() => description = val);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              maxLines: 2,
              decoration: textInputDecoration.copyWith(
                  hintText:
                      'Additional Criteria (gender specific, language, special skills, etc.)',
                  hintStyle:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  fillColor: c1,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c2, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1d, width: 3.0))),
              onChanged: (val) {
                setState(() => description = val);
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 400,
              child: TextButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: c2,
                    backgroundColor: c1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
