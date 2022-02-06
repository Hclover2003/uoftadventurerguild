import 'package:flutter/material.dart'; //material
import 'package:provider/provider.dart'; //provider
import 'package:firebase_auth/firebase_auth.dart'; //firebase auth
import 'package:firebase_core/firebase_core.dart';
import 'package:uoftadventurerguild/firebase_options.dart';
import 'package:uoftadventurerguild/screens/wrapper.dart';
import 'package:uoftadventurerguild/services/auth.dart'; //firebase core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Listens to ThemeNotifier(methods: getTheme, setTheme)
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Open Sans"),
        home: Wrapper(),
      ),
    );
  }
}
