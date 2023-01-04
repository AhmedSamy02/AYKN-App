import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/Student/CourseLectures.dart';
import 'package:yarab/Student/feedback_screen.dart';
import 'package:yarab/components/crud.dart';
import 'package:yarab/src/get_started.dart';

import '../constant/linkapi.dart';
import 'annoucement.dart';
import 'courses.dart';

//this class for the student home navigation
class Nbar extends StatefulWidget {
  Nbar({required this.Name, required this.Email, required this.Id});

  String Name = '';
  String Email = '';
  String Id = '';
  @override
  State<Nbar> createState() => _NbarState(Name: Name, Email: Email, Id: Id);
}

setPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('b1', false);
  preferences.setBool('b0', false);
}

class _NbarState extends State<Nbar> with Crud {
  _NbarState({required this.Name, required this.Email, required this.Id}) {
    screens = [
      Enrolled(Name: Name, Id: Id),
      Announcement(),
      Courses(Id: Id),
      feedback_screen(Id)
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
  String Email = '';
  String Id = '';

  viewpay() async {
    var response = postRequest(linkviewpay, {"std_id": Id});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child:FutureBuilder(
            future: viewpay() ,
            builder:(BuildContext context, AsyncSnapshot snapshot) {
          return  Scaffold(
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
                  onPressed: ()  {
                    Fluttertoast.showToast(
                      msg: "${snapshot.data['data']}",
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
          );})
        ),
      ),
    );
  }
}

class Enrolled extends StatefulWidget {
  Enrolled({required this.Name, required this.Id});
  String Name = '';
  String Id = '';
  @override
  State<Enrolled> createState() => _EnrolledState(Name: Name, Id: Id);
}

class _EnrolledState extends State<Enrolled> with Crud {
  String Name = '';
  String Id = '';
  _EnrolledState({required this.Name, required this.Id});

  viewStdCourse() async {
    var response = postRequest(linkviewEcourse, {"stud_id": Id});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: viewStdCourse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.hasData ? snapshot.data['data'].length : 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                          courseName:
                              "${snapshot.data['data'][index]['course_name']}",
                          courseId:
                              "${snapshot.data['data'][index]['course_id']}",
                          studId: Id,
                        );
                        test.setname();
                        test.setid();
                        test.setStudId();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Lectandexam(
                                courseName:
                                    "${snapshot.data['data'][index]['course_name']}",
                                courseId:
                                    "${snapshot.data['data'][index]['course_id']}",
                                studId: Id,
                              ),
                            ));
                      },
                      title: Text(
                        "${snapshot.data['data'][index]['course_name']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Changa',
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data['data'][index]['course_code']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Bitter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Column(
                        children: [
                          Text("Absence",
                              style: TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "${snapshot.data['data'][index]['enroll_attendanceNo']}",
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
              },
            );
          }),
    );
  }
}
