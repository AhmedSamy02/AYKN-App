import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/Student/enrolled_courses.dart';

class student_login_screen extends StatefulWidget {
  @override
  State<student_login_screen> createState() => _student_login_screenState();
}

class _student_login_screenState extends State<student_login_screen> {
  var student_email = new TextEditingController();

  var student_password = new TextEditingController();
  bool _isObscure = true;

  String Name = '';
  setPref(String email, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('b1', true);
    preferences.setBool('b0', false);
    preferences.setString('Email', email);
    preferences.setString('Name', Name);
  }

  @override
  void initState() {
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 38, 126, 189),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Image.asset('assets/images/student.png'),
              SizedBox(
                height: 25,
              ),
              const Text(
                'Welcome Student',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please log in or sign up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: student_email,
                  style: const TextStyle(color: Colors.black87),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w700),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 2,
                            strokeAlign: StrokeAlign.center)),
                    focusColor: Colors.indigo[900],
                    prefixIconColor: Colors.indigo[800],
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 3,
                            strokeAlign: StrokeAlign.center)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: student_password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure ? true : false,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w700),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(CupertinoIcons.eye),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 2,
                            strokeAlign: StrokeAlign.center)),
                    focusColor: Colors.indigo[900],
                    prefixIconColor: Colors.indigo[800],
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 3,
                            strokeAlign: StrokeAlign.center)),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    if (student_email.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "please enter an email address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    }
                    if (student_password.text.length < 8 ||
                        student_password.text.length > 30) {
                      Fluttertoast.showToast(
                          msg: "please enter a password of range 8-30",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    if ((student_email.text == 'ahmedsamy@mail.com' &&
                            student_password.text == 'ahmed samy') ||
                        (student_email.text == 'nancyayman@mail.com' &&
                            student_password.text == 'nancy ayman')) {
                      Name = 'The name';
                      setPref(student_email.text, Name);
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Nbar(
                                    Name: Name,
                                  )));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Email or Password are incorrect",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return;
                    }
                  },
                  color: Colors.lightBlue[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  height: 50,
                  elevation: 20,
                  textColor: Colors.white,
                  child: const Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
