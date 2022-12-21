import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/Student/enrolled_courses.dart';
import 'package:yarab/instructor/instructor_home.dart';
import 'package:yarab/src/get_started.dart';
import 'package:yarab/student_affair/add_affair.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  bool animate = false;
  bool b1 = false, b0 = false;
  //00 ---> not logged in
  //01 ---> Instructor
  //10 ---> Student
  //11 ---> Student affair

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    b1 = preferences.getBool('b1')!;
    b0 = preferences.getBool('b0')!;
    Email = preferences.getString('Email')!;
    Name = preferences.getString('Name')!;
  }

  String Email = '';
  String Name = '';
  @override
  void initState() {
    getPref();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[50],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 1600),
                width: 100,
                height: 100,
                left: animate ? 350 : 450,
                child: Image.asset("assets/images/purple.png")),
            AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: animate ? 200 : -300,
                left: 0,
                right: 0,
                child: Image.asset('assets/images/logo.png')),
            AnimatedPositioned(
                duration: Duration(milliseconds: 2500),
                top: 520,
                right: animate ? 90 : 450,
                child: Text(
                  'Your Way to Sucess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.purple[900],
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                )),
            AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                bottom: 0,
                width: 100,
                height: 100,
                right: animate ? 350 : 450,
                child: Image.asset("assets/images/purple.png")),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));

    if (!b1 && !b0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => get_started()));
    }

    if (b1 && b0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => add_affair(
                    Email: Email,
                    Name: Name,
                  )));
    }
    if (b1 && !b0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Nbar(
                    Name: Name,
                  )));
    }
    if (!b1 && b0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => InstructorCourses(
                    Email: Email,
                    Name: Name,
                  )));
    }
  }
}
