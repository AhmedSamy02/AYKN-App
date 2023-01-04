import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../components/crud.dart';
import '../constant/linkapi.dart';
import 'package:url_launcher/url_launcher.dart';

class Coursenamed {
  static var name;
  static setter(String? s) {
    name = s;
  }

  static String? getter() {
    return name;
  }
}

class Studnamed {
  static var Name;
  static setter(String? s) {
    Name = s;
  }

  static String? getter() {
    return Name;
  }
}

class CourseId {
  static var Id;
  static setter(String? s) {
    Id = s;
  }

  static String? getter() {
    return Id;
  }
}

class Lectandexam extends StatefulWidget {
  String courseId = '';
  String courseName = '';
  String studId = '';
  Lectandexam(
      {Key? key,
      required this.courseName,
      required this.courseId,
      required this.studId})
      : super(key: key);
  void setname() {
    Coursenamed.setter(courseName);
  }

  void setid() {
    CourseId.setter(courseId);
  }

  void setStudId() {
    Studnamed.setter(studId);
  }

  @override
  State<Lectandexam> createState() => _LectandexamState(
      courseId: courseId, courseName: courseName, studId: studId);
}

class _LectandexamState extends State<Lectandexam> with Crud {
  String courseId = '';
  String courseName = '';
  String studId = '';

  _LectandexamState(
      {required this.courseId, required this.courseName, required this.studId});
  int index = 0;
  final item = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.assignment_outlined, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    final screens = [
      Lectures(),
      Exams(),
    ];
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.abc),
              backgroundColor: Color.fromARGB(255, 38, 71, 156),
              title: Text(
                "$courseName",
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
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
                animationCurve: Curves.bounceInOut,
                animationDuration: Duration(milliseconds: 500),
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

class Lectures extends StatefulWidget {
  Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> with Crud {
  var courseId = CourseId.getter();
  String bookUrl = '';

  viewlecstud() async {
    var response = postRequest(linkviewlecstud, {"course_id": courseId});
    return response;
  }

  _launch(String url) async {
    var y = Uri.parse(url);
    await launchUrl(y);
  }

  viewBookstud() async {
    var response = postRequest(linkviewbookstud, {"course_id": courseId});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewBookstud(),
        builder: (BuildContext context, AsyncSnapshot snapshotbook) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    bookUrl =
                        "${snapshotbook.data['data'][0]['textBook_link']}";
                    _launch(bookUrl);
                  },
                  child: Text(
                    'open the text book',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'changa',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(elevation: 20.0),
                ),
                Flexible(
                  child: FutureBuilder(
                      future: viewlecstud(),
                      builder:
                          (BuildContext context, AsyncSnapshot snapshotlec) {
                        return ListView.builder(
                            itemCount: snapshotlec.hasData
                                ? snapshotlec.data['data'].length
                                : 0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (Context, index) {
                              return Container(
                                child: Card(
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      side: BorderSide(
                                          width: 5, color: Colors.white)),
                                  color: Colors.lightBlue[50],
                                  child: ListTile(
                                    onTap: () {
                                      /*  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Exams(),));*/
                                    },
                                    title: Text(
                                      "${snapshotlec.data['data'][index]['lec_name']}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: 'Changa',
                                        fontSize: 25,
                                      ),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Lecture No : "
                                            "${snapshotlec.data['data'][index]['lec_count']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Bitter',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Uploaded : " +
                                                dating(
                                                    "${snapshotlec.data['data'][index]['lec_date']}"),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Bitter',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          height: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                ),
              ],
            ),
          );
        });
  }

  static String dating(String newDate) {
    DateTime d = DateTime.parse(newDate);
    DateTime currdate = DateTime.now();
    var diff = currdate.difference(d);
    if (diff.inDays >= 365) {
      int num = (diff.inDays) ~/ 365;
      return '$num years ago';
    }
    if (diff.inDays >= 30) {
      int num = (diff.inDays) ~/ 30;
      return '$num months ago';
    }
    if (diff.inDays > 0) return '${diff.inDays} days ago ';
    if (diff.inHours > 0) {
      return '${diff.inHours} hours ago ';
    }
    return '${diff.inMinutes} minutes ago ';
  }
}

class Exams extends StatefulWidget {
  Exams({Key? key}) : super(key: key);

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> with Crud {
  var courseId = CourseId.getter();
  var studId = Studnamed.getter();

  _launch(String url) async {
    var y = Uri.parse(url);
    await launchUrl(y);
  }

  viewexamstud() async {
    var response = postRequest(
        linkviewexamstud, {"std_id": studId, "course_id": courseId});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: viewexamstud(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.hasData ? snapshot.data['data'].length : 0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (Context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 100,
                      child: Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            side: BorderSide(width: 5, color: Colors.white)),
                        color: Colors.lightBlue[50],
                        shadowColor: Colors.blue[600],
                        child: ListTile(
                          onTap: () async {
                            _launch(
                                "${snapshot.data['data'][index]['exam_link']}");
                          },
                          title: Text(
                            "${snapshot.data['data'][index]['exam_name']}",
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                              "Exam Date :"
                              "${snapshot.data['data'][index]['res_date']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Bitter',
                                fontWeight: FontWeight.bold,
                              )),
                          trailing: Column(
                            children: [
                              Text("Grade",
                                  style: TextStyle(
                                    fontFamily: 'Changa',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                "${snapshot.data['data'][index]['res_grade']}",
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
                    ),
                  );
                });
          }),
    );
  }
}
