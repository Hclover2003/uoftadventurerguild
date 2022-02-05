import 'package:flutter/material.dart';
import 'package:uoftadventurerguild/models/appuser.dart';
import 'package:uoftadventurerguild/screens/loading.dart';
import 'package:uoftadventurerguild/services/auth.dart';
import 'package:uoftadventurerguild/constants.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({required this.toggleView});

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
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/cover2.png"),
                        fit: BoxFit.cover)),
              ),
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
                              hintText: 'name',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(40, 152, 170, 0.5),
                                      width: 3.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(40, 152, 170, 1),
                                      width: 3.0))),
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
                              hintText: 'email',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 131, 202, 0.5),
                                      width: 3.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 131, 202, 1),
                                      width: 3.0))),
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
                              hintText: 'password',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 131, 202, 0.5),
                                      width: 3.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 131, 202, 1),
                                      width: 3.0))),
                          validator: (val) => val!.length < 6
                              ? 'enter password 6+ chars long'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        //register btn
                        SizedBox(
                          width: 200.0,
                          height: 50.0,
                          child: TextButton(
                            child: Text(
                              'register',
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromRGBO(0, 131, 202, 1),
                            ),
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
                                            createdAt: DateTime.now(),
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
                        SizedBox(
                          width: 200.0,
                          child: TextButton(
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            style: TextButton.styleFrom(
                              primary: Color.fromRGBO(0, 131, 202, 1),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              widget.toggleView();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          );
  }
}
