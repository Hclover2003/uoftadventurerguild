import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uoftadventurerguild/constants.dart';
import 'package:uoftadventurerguild/screens/home.dart';
import 'package:uoftadventurerguild/screens/join.dart';
import 'package:uoftadventurerguild/screens/post.dart';
import 'package:uoftadventurerguild/screens/upperdrawer.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int i = 0;
  var pages = [Home(), Join(), Post()];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: UpperDrawer(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xFFE9DADA),
            primaryColor: c2,
          ),
          child: BottomNavigationBar(
            selectedItemColor: c3,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.home,
                    size: 20,
                  ),
                  label: 'my events'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.search,
                    size: 20,
                  ),
                  label: 'explore'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.dumbbell,
                    size: 20,
                  ),
                  label: 'create'),
            ],
            currentIndex: i,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                i = index;
              });
            },
          ),
        ),
        body: pages[i],
      ),
    );
  }
}
