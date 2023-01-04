import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yarab/components/crud.dart';
import 'package:yarab/constant/linkapi.dart';

class yarab {
  static String name = "initial wrong value";
  static void setter(String Cname) {
    yarab.name = Cname;
  }

  static String? getter() {
    return name;
  }
}

class yarab1 {
  static String id = '';
  static void setter(String Id0) {
    yarab1.id = Id0;
  }

  static String? getter() {
    return id;
  }
}

class InstructorExam extends StatefulWidget {
  @override
  State<InstructorExam> createState() => _InstructorExamState();
}

class _InstructorExamState extends State<InstructorExam> with Crud {
  var course = yarab.getter();
  var _urlController = new TextEditingController();
  String? _urlError;
  String? _codeError;
  TextEditingController examCodeController = new TextEditingController();
  var idk = yarab1.getter();
  uploadexam() async {
    var response = await postRequest(linkuploadexam, {
      "inst_id": '$idk',
      "course_name": '$course',
      "exam_link": _urlController.text,
      "exam_name": examCodeController
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/upload.jpg'),
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                    errorText: _urlError,
                    hintText: "please enter the Exam link",
                    labelText: "Exam URL",
                    labelStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.url,
              ),
              TextField(
                controller: examCodeController,
                decoration: InputDecoration(
                    errorText: _codeError,
                    hintText: "Please enter the Exam code",
                    labelText: "Exam Code",
                    labelStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        if (_urlController.text.length == 0)
                          _urlError = "please enter the url";
                        else
                          _urlError = null;
                        if (examCodeController.text.length == 0)
                          _codeError = "please enter the code";
                        else
                          _codeError = null;
                      });
                      DateTime today = DateTime.now();
                      String dateStr =
                          "${today.day}-${today.month}-${today.year}";
                      //to get the current date to be sent to the database
                      var res = await uploadexam();
                      if (res == null) {
                        Fluttertoast.showToast(
                            msg: "error in adding",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        _urlController.text = " ";
                        examCodeController.text = " ";
                      }
                      // print(dateStr+" "+_urlController.text);
                    },
                    child: Text("Upload")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Instructornaviagtion extends StatefulWidget with Crud {
  Instructornaviagtion({Key? key, required this.Name, required this.id})
      : super(key: key);
  void ste() {
    yarab.setter(Name);
  }

  void ste1() {
    yarab1.setter(id);
  }

  String Name = '';
  String id = '';

  @override
  State<Instructornaviagtion> createState() =>
      _InstructornaviagtionState(Name: Name);
}

class _InstructornaviagtionState extends State<Instructornaviagtion> {
  _InstructornaviagtionState({required this.Name});

  final screens = [
    InstructorResults(),
    InstructorAttendance(),
    InstructorExam(),
    InstructorLectures(),
    Instructorbook()
  ];
  int index = 0;
  final item = <Widget>[
    Icon(Icons.home, size: 30),
    const Icon(Icons.announcement, size: 30),
//Icon(Icons.feedback,size: 30),
    const Icon(Icons.sticky_note_2_outlined, size: 30),
    const Icon(Icons.upload, size: 30),
    Icon(Icons.add_card_sharp, size: 30),
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
              leading: const Icon(Icons.account_circle_rounded),
              backgroundColor: const Color.fromARGB(255, 38, 126, 189),
              title: Text(
                '$Name',
                style: const TextStyle(
                  fontFamily: 'Changa',
                  //  fontStyle: FontStyle.italic,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
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
                color: Color.fromARGB(255, 38, 126, 189),
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

class InstructorResults extends StatefulWidget {
  InstructorResults({Key? key}) : super(key: key);

  @override
  State<InstructorResults> createState() => _InstructorResultsState();
}

class _InstructorResultsState extends State<InstructorResults> with Crud {
  var thename = yarab.getter();
  _InstructorResultsState();

  var _gradeColtroller = new TextEditingController();
  var _gradeerror;
  var _nameColtroller = new TextEditingController();
  var _nameeerror;
  String Name = '';
  int? currIndex;
  getexam() async {
    var response =
        await postRequest(linkupdataresult, {"course_name": '$thename'});
    return response;
  }

  setmark() async {
    var response = await postRequest(linksetmark, {
      "exam_id": '$currIndex',
      "std_username": _nameColtroller.text,
      "res_grade": _gradeColtroller.text
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Flexible(
              child: FutureBuilder(
            future: getexam(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount:
                      snapshot.hasData ? snapshot.data['data'].length : 0,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (Context, index) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: 70,
                        child: Card(
                          elevation: 12,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              side: BorderSide(width: 5, color: Colors.white)),
                          color: Colors.lightBlue[50],
                          shadowColor: Colors.blue[600],
                          child: FutureBuilder(
                              future: setmark(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot1) {
                                return ListTile(
                                  onTap: () {
                                    currIndex =
                                        snapshot.data['data'][index]['exam_id'];
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'please enter the student grade'),
                                          content: SingleChildScrollView(
                                              child: Column(
                                            children: [
                                              TextField(
                                                controller: _nameColtroller,
                                                decoration: InputDecoration(
                                                    errorText: _nameeerror,
                                                    hintText:
                                                        " student username",
                                                    labelText: "username",
                                                    labelStyle: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Changa",
                                                        color: Colors.black),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    fillColor: Colors.white),
                                                keyboardType:
                                                    TextInputType.name,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextField(
                                                controller: _gradeColtroller,
                                                decoration: InputDecoration(
                                                    errorText: _gradeerror,
                                                    hintText: " Grade",
                                                    labelText: "Grade",
                                                    labelStyle: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Changa",
                                                        color: Colors.black),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    fillColor: Colors.white),
                                                keyboardType: TextInputType.url,
                                              ),
                                            ],
                                          )),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text(
                                                'Add',
                                                style: TextStyle(
                                                    color: Colors.brown),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (_nameColtroller
                                                          .text.length ==
                                                      0)
                                                    _nameeerror =
                                                        "please enter the name";
                                                  else
                                                    _nameeerror = null;
                                                  if (_gradeColtroller
                                                          .text.length ==
                                                      0)
                                                    _gradeerror =
                                                        "please enter the grade";
                                                  else
                                                    _gradeerror = null;
                                                });
                                                if (_nameColtroller
                                                        .text.isNotEmpty &&
                                                    _gradeColtroller
                                                        .text.isNotEmpty) {
                                                  if (snapshot1.hasData ==
                                                      false) {
                                                    Fluttertoast.showToast(
                                                        msg: "error in adding",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.blue,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  } else {
                                                    _gradeColtroller.text = " ";
                                                    _nameColtroller.text = " ";
                                                  }
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  title: Text(
                                    "${snapshot.data['data'][index]['exam_name']}",
                                    style: TextStyle(
                                      fontFamily: 'Changa',
                                      fontSize: 25,
                                    ),
                                  ),
                                  trailing: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Exam id",
                                          style: TextStyle(
                                            fontFamily: 'Changa',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                        "${snapshot.data['data'][index]['exam_id']}",
                                        style: TextStyle(
                                          fontFamily: 'bitter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  });
            },
          )),
        ],
      ),
    );
  }
}

class InstructorLectures extends StatefulWidget {
  const InstructorLectures({Key? key}) : super(key: key);

  @override
  State<InstructorLectures> createState() => _InstructorLecturesState();
}

class _InstructorLecturesState extends State<InstructorLectures> with Crud {
  var course = yarab.getter();
  var _videoController = new TextEditingController();
  var _lecturenameController = new TextEditingController();
  var _videoerror;
  var _lectureController = new TextEditingController();
  var _lecturenumbererror;
  var _lecturnameerror;

  uploadlec() async {
    var response = await postRequest(linkuploadlec, {
      "course_name": '$course',
      "lec_name": _lecturenameController.text,
      "lec_count": _lectureController.text,
      "lec_link": _videoController.text
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/upload2.jpg'),
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _videoController,
                decoration: InputDecoration(
                    errorText: _videoerror,
                    hintText: "please enter the lecture video link",
                    labelText: "Link",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.url,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _lectureController,
                decoration: InputDecoration(
                    errorText: _lecturenumbererror,
                    hintText: "number:---",
                    labelText: "lecture number",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _lecturenameController,
                decoration: InputDecoration(
                    errorText: _lecturnameerror,
                    hintText: "name:---",
                    labelText: "lecture name",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // setState(() {
                    //   if (_videoController.text.length == 0)
                    //     _videoerror = "please enter the url";
                    //   else
                    //     _videoerror = null;
                    //   if (_lectureController.text.length == 0)
                    //     _lecturenumbererror = "please enter the lecture number";
                    //   else
                    //     _lecturenumbererror = null;
                    // });
                    // DateTime today = DateTime.now();
                    // String dateStr =
                    //     "${today.day}-${today.month}-${today.year}";
                    print(_videoController.text);
                    print(_lectureController.text);
                    var res = await uploadlec();
                    if (res == null) {
                      Fluttertoast.showToast(
                          msg: "error in adding",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      _videoController.text = " ";
                      _lectureController.text = " ";
                      _lecturenameController.text = " ";
                    }
                    //to get the current date to be sent to the database

                    // print(dateStr+" "+_urlController.text);
                  },
                  child: Text("Upload"))
            ],
          ),
        ),
      ),
    );
  }
}

class InstructorAttendance extends StatefulWidget {
  const InstructorAttendance({Key? key}) : super(key: key);

  @override
  State<InstructorAttendance> createState() => _InstructorAttendanceState();
}

class _InstructorAttendanceState extends State<InstructorAttendance> with Crud {
  var course = yarab.getter();
  veiwstudent() async {
    var response = await postRequest(linkviewstd, {"course_name": '$course'});
    return response;
  }

  int? currid;
  absent() async {
    var response = await postRequest(
        linktakeattendance, {"course_name": '$course', "std_id": '$currid'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: veiwstudent(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.hasData ? snapshot.data['data'].length : 0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (Context, index) {
                  return Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(width: 5, color: Colors.white)),
                    color: Colors.lightBlue[50],
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        "${snapshot.data['data'][index]['std_firstName']}" +
                            " " +
                            "${snapshot.data['data'][index]['std_secName']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Changa',
                        ),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all(2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 50.0,
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),

                          // icon:Icon( Icons.add_circle_outline_rounded ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Absent",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Changa',
                                ),
                              ),
                              // Icon( Icons.add_circle_outline_rounded,size: 10, ),
                            ],
                          ),
                          onPressed: () async {
                            currid = snapshot.data['data'][index]['stud_id'];
                            print('$currid');
                            var res = await absent();
                            if (res == null) {
                              Fluttertoast.showToast(
                                  msg: "error in taking attendance",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

class Instructorbook extends StatefulWidget {
  const Instructorbook({Key? key}) : super(key: key);

  @override
  State<Instructorbook> createState() => _InstructorbookState();
}

class _InstructorbookState extends State<Instructorbook> with Crud {
  var course = yarab.getter();
  var _linkController = new TextEditingController();
  var _linkoerror;
  var _nameController = new TextEditingController();
  var _namenumbererror;
  var _yearController = new TextEditingController();
  var _yearnumbererror;
  addbook() async {
    var response = await postRequest(linkaddbook, {
      "textBook_name": _nameController.text,
      "textBook_link": _linkController.text,
      "textBook_puplishYear": _yearController.text,
      "course_name": '$course',
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/upload2.jpg'),
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _linkController,
                decoration: InputDecoration(
                    errorText: _linkoerror,
                    hintText: "please enter the book link",
                    labelText: "Book Link",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.url,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    errorText: _namenumbererror,
                    hintText: "name",
                    labelText: "book name",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _yearController,
                decoration: InputDecoration(
                    errorText: _yearnumbererror,
                    hintText: "year:---",
                    labelText: "edition year",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Changa",
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Colors.white),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      if (_nameController.text.length == 0)
                        _namenumbererror = "please enter the book name";
                      else
                        _namenumbererror = null;
                      if (_linkController.text.length == 0)
                        _linkoerror = "please enter the book link";
                      else
                        _linkoerror = null;
                      if (_yearController.text.length == 0)
                        _yearnumbererror = "please enter the edition year";
                      else
                        _yearnumbererror = null;
                    });
                    var res = await addbook();
                    if (res == null) {
                      Fluttertoast.showToast(
                          msg: "error in adding",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      _nameController.text = " ";
                      _linkController.text = " ";
                      _yearController.text = " ";
                    }
                    // DateTime today = DateTime.now();
                    // String dateStr =
                    //     "${today.day}-${today.month}-${today.year}";
                    //to get the current date to be sent to the database

                    // print(dateStr+" "+_urlController.text);
                  },
                  child: Text("Upload"))
            ],
          ),
        ),
      ),
    );
  }
}
