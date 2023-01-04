import 'package:flutter/material.dart';
import 'package:yarab/components/crud.dart';
import 'package:yarab/instructor/instructor_results.dart';

import '../Student/enrolled_courses.dart';
import '../constant/linkapi.dart';
import '../src/get_started.dart';

class InstructorCourses extends StatefulWidget {
  InstructorCourses(
      {required this.Email, required this.Name, required this.Id});

  String Email = '';
  String Name = '';
  String Id = '';
  @override
  State<InstructorCourses> createState() =>
      _InstructorCoursesState(Email: Email, Name: Name, Id: Id);
}

class _InstructorCoursesState extends State<InstructorCourses> with Crud {
  _InstructorCoursesState(
      {required this.Email, required this.Name, required this.Id});

  String Email = '';
  String Name = '';
  String Id = '';
  viewcourse() async {
    var response = await postRequest(linkviewcourse, {"inst_id": '$Id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    print('scaffold');
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setPref();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const get_started()));
                },
                icon: Icon(Icons.logout))
          ],
          leading: Icon(Icons.account_circle_rounded),
          backgroundColor: Color.fromARGB(255, 38, 126, 189),
          title: Text(
            Name,
            style: const TextStyle(
              fontFamily: 'Changa',
              //  fontStyle: FontStyle.italic,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: viewcourse(),
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
                          Instructornaviagtion test = Instructornaviagtion(
                            Name:
                                "${snapshot.data['data'][index]['course_name']}",
                            id: Id,
                          );
                          test.ste();
                          test.ste1();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Instructornaviagtion(
                                  Name:
                                      "${snapshot.data['data'][index]['course_name']}",
                                  id: Id,
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
                          "${snapshot.data['data'][index]['hall_id']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Bitter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
