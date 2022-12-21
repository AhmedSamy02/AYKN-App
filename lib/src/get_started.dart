import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/src/instructor_login_screen.dart';
import 'package:yarab/src/student_affair_login_screen.dart';
import 'package:yarab/src/student_login_screen.dart';

class get_started extends StatefulWidget {
  const get_started({Key? key}) : super(key: key);

  @override
  State<get_started> createState() => _get_startedState();
}

getPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('b1', false);
  preferences.setBool('b0', false);
}

class _get_startedState extends State<get_started> {
  @override
  Widget build(BuildContext context) {
    getPref();
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                const Text(
                  'AYKN App',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 80),
                Image.asset('assets/images/uni.png'),
                const SizedBox(
                  height: 95,
                ),
                const Text(
                  'Achievement through learning',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 360,
                  child: const Text(
                    textAlign: TextAlign.center,
                    '	Teach with responsibility, research with vision, heal with ambition',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        child: MaterialButton(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            color: Colors.black45,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          instructor_login_screen()));
                            },
                            child: const Text(
                              'Instructor',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        child: MaterialButton(
                            elevation: 18,
                            color: Colors.black12,
                            splashColor: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          student_login_screen()));
                            },
                            child: const Text(
                              'Student',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      student_affair_login_screen()));
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        splashColor: Colors.indigoAccent,
                        height: 45,
                        elevation: 18,
                        color: Colors.white38,
                        child: const Text(
                          'Student Affair',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
