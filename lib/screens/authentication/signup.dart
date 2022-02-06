import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uoftadventurerguild/models/appuser.dart';
import 'package:uoftadventurerguild/screens/loading.dart';
import 'package:uoftadventurerguild/services/auth.dart';
import 'package:uoftadventurerguild/constants.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  const SignUp({required this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String name = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(children: [
                Container(decoration: BoxDecoration(color: c3)),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 150,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 18),
                                fillColor: c1,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: c2, width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: c1d, width: 3.0))),
                            validator: (val) =>
                                val!.isEmpty ? 'enter name' : null,
                            onChanged: (val) {
                              setState(() => name = val);
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 18),
                                fillColor: c1,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: c2, width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: c1d, width: 3.0))),
                            validator: (val) =>
                                val!.isEmpty ? 'enter email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Password',
                            ),
                            validator: (val) => val!.length < 6
                                ? 'enter password 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          //register btn
                          SizedBox(
                            width: 250.0,
                            height: 70.0,
                            child: TextButton(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              style: TextButton.styleFrom(
                                  primary: c3,
                                  backgroundColor: c1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () async {
                                //check if form is valid
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          name,
                                          email,
                                          password,
                                          UserData(
                                              createdAt: Timestamp.now(),
                                              name: name,
                                              majors: ["computer science"],
                                              currentcourses: [
                                                "csc148",
                                                "csc165"
                                              ],
                                              age: 18,
                                              gender: "F",
                                              pronoun: "she/her",
                                              oncampus: true));
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'please supply a valid email';
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          //error
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              error,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),

                          //toggleview
                          TextButton(
                            child: Text.rich(
                                TextSpan(
                                    text: "Returning?\n",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: "Sign In!",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline))
                                    ]),
                                textAlign: TextAlign.center),
                            style: TextButton.styleFrom(
                              primary: c1,
                              backgroundColor: c3,
                            ),
                            onPressed: () {
                              widget.toggleView();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
  }
}
