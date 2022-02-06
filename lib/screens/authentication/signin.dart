import 'package:flutter/material.dart';
import 'package:uoftadventurerguild/constants.dart';
import 'package:uoftadventurerguild/screens/join.dart';
import 'package:uoftadventurerguild/screens/loading.dart';
import 'package:uoftadventurerguild/services/auth.dart';

//widget itself
class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

// state object
class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
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
                Container(color: c3),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "UofT Connect",
                            style: TextStyle(
                                color: c1,
                                fontSize: 60,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: "Open Sans"),
                          ),
                          Container(
                            height: 150,
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
                                        subtitle: Text(q.description
                                            .replaceRange(
                                                (100 < q.description.length)
                                                    ? 100
                                                    : q.description.length,
                                                q.description.length,
                                                "...")),
                                      )),
                                );
                              },
                            ),
                          ),
                          //form fields
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: "Email"),
                            validator: (val) =>
                                val!.isEmpty ? 'please enter your email' : null,
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
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 14),
                                fillColor: c1,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: c2, width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: c1d, width: 3.0))),
                            validator: (val) => val!.length < 6
                                ? 'please enter a password 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          //signinwithemail
                          SizedBox(
                            width: 250.0,
                            height: 40.0,
                            child: TextButton(
                              child: Text(
                                'Sign In',
                                style: TextStyle(fontSize: 14),
                              ),
                              style: TextButton.styleFrom(
                                  primary: c2,
                                  backgroundColor: c1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signinWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error =
                                          'Could not sign in with those credentials';
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //errormsg
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Text(
                              error,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),

                          //toggleview
                          TextButton(
                            child: Text.rich(
                                TextSpan(
                                    text: "New?\n",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: "Sign Up!",
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
