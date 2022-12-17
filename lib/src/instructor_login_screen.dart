

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class instructor_login_screen extends StatefulWidget {
  @override
  State<instructor_login_screen> createState() => _instructor_login_screenState();
}

class _instructor_login_screenState extends State<instructor_login_screen> {
  var instructor_email = new TextEditingController();

  var instructor_password = new TextEditingController();
  bool _isObscure = true;


  @override
  void initState() {
    _isObscure=true;

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
              SizedBox(
                height: 120,
              ),
              Image.asset('assets/images/instructor.jpg'),
              SizedBox(
                height: 25,
              ),
              const Text(
                'Welcome Instructor',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 40),
              ),
              SizedBox(
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
              SizedBox(
                height: 70,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: instructor_email,
                  style: TextStyle(color: Colors.black87),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w700),
                    prefixIcon: Icon(
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
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: instructor_password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure?true:false,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w700),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),

                    suffixIcon: IconButton(icon: Icon(CupertinoIcons.eye), onPressed: () {setState((){
                      _isObscure=!_isObscure;
                    }); },),
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
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Expanded(
                    child: MaterialButton(onPressed: () {
                      if(instructor_email.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "please enter an email address",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        return;
                      }
                      if(instructor_password.text.length<8) {
                        Fluttertoast.showToast(
                          msg: "please enter a password of range 8-30",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                        return;
                      }
                    },
                      color: Colors.lightBlue[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      height: 50,
                      elevation: 20,
                      child: Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                      textColor: Colors.white,

                    ),
                  ),
                  SizedBox(width: 40,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Please put a password"),
      actions: [
        okButton
      ],
    );
  }
}
