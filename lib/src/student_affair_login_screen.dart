import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/src/add_affair.dart';
import 'package:shared_preferences/shared_preferences.dart';

class student_affair_login_screen extends StatefulWidget {
  @override
  State<student_affair_login_screen> createState() => _student_affair_login_screenState();
}

class _student_affair_login_screenState extends State<student_affair_login_screen> {
  var student_affair_email=new TextEditingController();

  var student_affair_password=new TextEditingController();

  bool _isObscure = true;
  setPref(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('b1', true);
    preferences.setBool('b0', true);
    preferences.setString('Email', email);
  }

  @override
  void initState() {
    _isObscure=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 151, 203, 225),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Image.asset('assets/images/studentaffair.jpg'),
              SizedBox(
                height: 25,
              ),
              const Text(
                'Welcome Manager',
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
                'Please put your email and password',
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
                  controller: student_affair_email,
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
                            color: Colors.blue,
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

                  controller: student_affair_password,
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
                            color: Colors.blue,
                            width: 3,
                            strokeAlign: StrokeAlign.center)),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Expanded(
                    child: MaterialButton(onPressed: () {

                      if(student_affair_email.text.isEmpty) {
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
                      if(student_affair_password.text.toString().length<8||student_affair_password.text.toString().length>30) {
                        Fluttertoast.showToast(
                            msg: "please enter a password of range 8-30",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );



                      }
                      print(student_affair_email.text);
                      print(student_affair_password.text);
                      if((student_affair_email.text=='ahmedsamy@mail.com'&&student_affair_password.text=='ahmed samy')||
                          (student_affair_email.text=='nancyayman@mail.com'&&student_affair_password.text=='nancy ayman'))
                      {
                        setPref(student_affair_email.text);
                        Navigator.pop(context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>add_affair()));
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Email or Password are incorrect",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      return;
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
                  // SizedBox(width: 40,),
                  // Expanded(
                  //   child: MaterialButton(onPressed: () {},
                  //     color: Colors.white70,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25)),
                  //     height: 50,
                  //     elevation: 20,
                  //     child: Text(
                  //       'Sign Up',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(fontSize: 17),
                  //
                  //     ),
                  //     textColor: Color.fromARGB(255, 38, 126, 189),
                  //
                  //   ),
                  // ),
                  SizedBox(width: 20,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}