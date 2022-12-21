import 'package:flutter/material.dart';
import 'package:yarab/instructor/instructor_results.dart';

import '../Student/enrolled_courses.dart';
import '../src/get_started.dart';

class InstructorCourses extends StatefulWidget {
  InstructorCourses({required this.Email, required this.Name});

  String Email = '';
  String Name = '';

  @override
  State<InstructorCourses> createState() =>
      _InstructorCoursesState(Email: Email, Name: Name);
}

class _InstructorCoursesState extends State<InstructorCourses> {
  _InstructorCoursesState({required this.Email, required this.Name});

  String Email = '';
  String Name = '';

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
                    Instructornaviagtion test = Instructornaviagtion(
                      Name: Name,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Instructornaviagtion(Name: Name),
                        ));
                  },
                  title: const Text(
                    "the course name",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Changa',
                    ),
                  ),
                  subtitle: const Text(
                    "the hall number",
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
          }),
    );
  }
}
