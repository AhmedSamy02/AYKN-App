import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/Student/CourseLectures.dart';
import 'package:yarab/Student/feedback_screen.dart';
import 'package:yarab/src/get_started.dart';

import 'annoucement.dart';
import 'courses.dart';

//this class for the student home navigation
class Nbar extends StatefulWidget {
  Nbar({required this.Name});

  String Name = 'f';
  @override
  State<Nbar> createState() => _NbarState(Name: Name);
}

setPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('b1', false);
  preferences.setBool('b0', false);
}

class _NbarState extends State<Nbar> {
  _NbarState({required this.Name}) {
    screens = [
      Enrolled(
        Name: Name,
      ),
      Announcement(),
      Courses(),
      feedback_screen()
    ];
  }
  var screens = [];
  int index = 0;
  final item = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.announcement, size: 30),
    Icon(Icons.feedback, size: 30),
    Icon(Icons.sticky_note_2_outlined, size: 30),
  ];

  String Name = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.account_circle_rounded),
              backgroundColor: const Color.fromARGB(255, 38, 71, 156),
              title: Text(
                "$Name",
                style: const TextStyle(
                  fontFamily: 'Changa',
                  //  fontStyle: FontStyle.italic,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "you paid the fees",
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 20,
                      textColor: Colors.white,
                      backgroundColor: Colors.blue,
                      toastLength: Toast.LENGTH_LONG,
                    );
                  },
                  icon: Icon(Icons.paypal),
                ),
                IconButton(
                  onPressed: () {
                    setPref();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const get_started()));
                  },
                  icon: Icon(Icons.logout),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                color: Colors.white,
              )),
              child: CurvedNavigationBar(
                color: Color.fromARGB(255, 38, 71, 156),
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: Colors.orange[900],
                animationCurve: Curves.easeInCubic,
                animationDuration: Duration(milliseconds: 300),
                items: item,
                height: 60,
                index: index,
                onTap: (index) => setState(() {
                  this.index = index;
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Enrolled extends StatefulWidget {
  Enrolled({required this.Name});
  String Name = '';
  @override
  State<Enrolled> createState() => _EnrolledState(Name: Name);
}

class _EnrolledState extends State<Enrolled> {
  String Name = '';
  _EnrolledState({required this.Name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (Context, index) {
            return Container(
              height: 100,
              child: Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    side: BorderSide(width: 5, color: Colors.white)),
                color: Colors.lightBlue[50],
                shadowColor: Colors.black26,
                child: ListTile(
                  onTap: () {
                    Lectandexam test = Lectandexam(
                      Coursename: "named ann",
                      Name: Name,
                    );
                    test.setname();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lectandexam(
                            Coursename: "named",
                            Name: Name,
                          ),
                        ));
                  },
                  title: Text(
                    "the course name",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Changa',
                    ),
                  ),
                  subtitle: Text(
                    "the main topic",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      Text("Attendane",
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "9",
                        style: TextStyle(
                          fontFamily: 'bitter',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
