import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class yarab {
  static String name = "initial wrong value";
  static void setter(String Cname) {
    yarab.name = Cname;
  }

  static String? getter() {
    return name;
  }
}

class InstructorExam extends StatefulWidget {
  @override
  State<InstructorExam> createState() => _InstructorExamState();
}

class _InstructorExamState extends State<InstructorExam> {
  var course = yarab.getter();
  var _urlController = new TextEditingController();
  String? _urlError;
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
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_urlController.text.length == 0)
                          _urlError = "please enter the url";
                        else
                          _urlError = null;
                      });
                      DateTime today = DateTime.now();
                      String dateStr =
                          "${today.day}-${today.month}-${today.year}";
                      //to get the current date to be sent to the database

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

class Instructornaviagtion extends StatefulWidget {
  Instructornaviagtion({Key? key, required this.Name}) : super(key: key);

  String Name = '';
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

class student {
  final String name;
  int grade;
  student({required this.name, required this.grade});
}

class _InstructorResultsState extends State<InstructorResults> {
  var thename = yarab.getter();
  _InstructorResultsState();
  List<student> entries = <student>[
    student(name: "sara", grade: 0),
    student(name: "noha", grade: 0),
    student(name: "yara", grade: 0),
    student(name: "nancy", grade: 0),
    student(name: "amera", grade: 0),
    student(name: "nada", grade: 0),
    student(name: "ss", grade: 0),
    student(name: "asa", grade: 0),
    student(name: "wad", grade: 0),
    student(name: "qedf", grade: 0),
    student(name: "ger", grade: 0),
    student(name: "pkpg", grade: 0),
    student(name: "grmrlg", grade: 0),
  ];
  var _gradeColtroller = new TextEditingController();
  var _gradeerror;
  var _nameColtroller = new TextEditingController();
  var _nameeerror;
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
            child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (Context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 70,
                      child: Card(
                        elevation: 12,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            side: BorderSide(width: 5, color: Colors.white)),
                        color: Colors.lightBlue[50],
                        shadowColor: Colors.blue[600],
                        child: ListTile(
                          onTap: () {
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
                                            hintText: " student id",
                                            labelText: "id",
                                            labelStyle: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: "Changa",
                                                color: Colors.black),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            fillColor: Colors.white),
                                        keyboardType: TextInputType.name,
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            fillColor: Colors.white),
                                        keyboardType: TextInputType.url,
                                      ),
                                    ],
                                  )),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(color: Colors.brown),
                                      ),
                                      onPressed: () {
                                        print(thename);
                                        setState(() {
                                          if (_nameColtroller.text.length == 0)
                                            _nameeerror =
                                                "please enter the url";
                                          else
                                            _nameeerror = null;
                                          if (_gradeColtroller.text.length == 0)
                                            _gradeerror =
                                                "please enter the url";
                                          else
                                            _gradeerror = null;
                                        });
                                        if (_nameColtroller.text.isNotEmpty &&
                                            _gradeColtroller.text.isNotEmpty) {
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
                            entries[index].name,
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
                                entries[index].grade.toString(),
                                style: TextStyle(
                                  fontFamily: 'bitter',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
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

class _InstructorLecturesState extends State<InstructorLectures> {
  var course = yarab.getter();
  var _videoController = new TextEditingController();
  var _videoerror;
  var _lectureController = new TextEditingController();
  var _lecturenumbererror;
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
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_videoController.text.length == 0)
                        _videoerror = "please enter the url";
                      else
                        _videoerror = null;
                      if (_lectureController.text.length == 0)
                        _lecturenumbererror = "please enter the lecture number";
                      else
                        _lecturenumbererror = null;
                    });
                    DateTime today = DateTime.now();
                    String dateStr =
                        "${today.day}-${today.month}-${today.year}";
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

class _InstructorAttendanceState extends State<InstructorAttendance> {
  var course = yarab.getter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 5,
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
                  "the student name",
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
                    onPressed: () {
                      print(course);
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Instructorbook extends StatefulWidget {
  const Instructorbook({Key? key}) : super(key: key);

  @override
  State<Instructorbook> createState() => _InstructorbookState();
}

class _InstructorbookState extends State<Instructorbook> {
  var course = yarab.getter();
  var _linkController = new TextEditingController();
  var _linkoerror;
  var _nameController = new TextEditingController();
  var _namenumbererror;
  var _yearController = new TextEditingController();
  var _yearnumbererror;
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
                    hintText: "please enter the lecture video link",
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
                  onPressed: () {
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
                    DateTime today = DateTime.now();
                    String dateStr =
                        "${today.day}-${today.month}-${today.year}";
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
