import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/src/get_started.dart';
import 'package:yarab/student_affair/annoucment_add.dart';
import 'package:yarab/student_affair/view_affair.dart';

class add_affair extends StatefulWidget {
  String Email = '';
  String Name = '';

  add_affair({required this.Email, required this.Name});

  @override
  State<add_affair> createState() =>
      _add_affairState(affairEmail: Email, affairName: Name);
}

setPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('b1', false);
  preferences.setBool('b0', false);
  preferences.setString('Email', '');
  preferences.setString('Name', '');
}

var titles = {'Courses', 'Students', 'Instructors', 'Announcements'};
TextEditingController courseId = new TextEditingController();
TextEditingController courseName = new TextEditingController();
TextEditingController coursePrerequisite = new TextEditingController();
TextEditingController coursePrice = new TextEditingController();
TextEditingController studentId = new TextEditingController();
TextEditingController studentName = new TextEditingController();
TextEditingController studentUsername = new TextEditingController();
TextEditingController studentEmail = new TextEditingController();
TextEditingController studentPassword = new TextEditingController();
TextEditingController instructorId = new TextEditingController();
TextEditingController instructorName = new TextEditingController();
TextEditingController instructorUsername = new TextEditingController();
TextEditingController instructorEmail = new TextEditingController();
TextEditingController instructorPassword = new TextEditingController();

class _add_affairState extends State<add_affair> {
  String affairName = '';
  String affairEmail;

  _add_affairState({required this.affairEmail, required this.affairName});

  //ID - Name - Prerequisite - Price
  static var courses = [[]]; //ID - Name - Prerequisite - Price
  static var students = [[]]; //ID - Name - UserName - Email - Password
  static var instructors = [[]]; //ID - Name - UserName - Email - Password
  static var annoucmnets = [[]]; //ID - Name - UserName - Email - Password

  static BuildContext currContext = BuildContext as BuildContext;

  @override
  void initState() {
    print('$affairEmail');
    _selectedIndex = 0;
    courses = [
      ['CMP2020', 'Algorithms', 'Data Structure', 500],
      ['CMP2010', 'Data Structure', 'Programming Techniques', 500],
      ['CMP2000', 'Programming Techniques', null, 200],
      ['CMP1516', 'Databases Fundamental', null, 1000],
      ['GEN2010', 'Project Management', null, 100],
      ['GEN2112', 'Critical Thinking', null, 300],
      ['ELC2120', 'Circuits I', null, 1500],
      ['ELC1120', 'Circuits II', 'Circuits I', 1300],
      ['ELC2420', 'Electronics I', null, 600],
      ['CMP1020', 'Logic Design I', null, 500],
      ['CMP1030', 'Logic Design II', 'Logic Design I', 700],
    ];
    students = [
      [1, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [2, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [3, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [4, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [5, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [6, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [7, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [8, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [9, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
      [10, 'Ahmed Samy', 'AS', 'nname@gmail.com', 'msfaASFAsmf64'],
    ];
    instructors = [
      [1, 'Omar Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 5600],
      [2, 'Omar Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 3500],
      [3, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 8600],
      [4, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 6500],
      [5, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 1500],
      [6, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 7000],
      [7, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 12000],
      [8, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 10500],
      [9, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 3500],
      [10, 'Ahmed Samy', 'AS', 'nname1585@gmail.com', 'fkansf519', 1200],
    ];
    annoucmnets = [
      [
        DateTime(2022, 12, 16, 22, 9),
        'In commemoration of the 74th Indonesian Independence Dat, the management will hold an inter-division competition which will be held on Friday, August 16, 2019. The competition that will be held are tug-war race, cracker-eating contest, and futsal competition. We are waiting for each division to send the representative names to HR division no later than Wednesday, August 14, 2019'
      ],
      [
        DateTime(2022, 2, 2, 5, 35),
        'Our classroom will join “The Cleanest Class Competition 2020” on Saturday, March 12th 2020. To prepare it, please all the member of the classroom gather at school on Sunday Marc 5th 2020 at 9 am to start cleaning and decorating the classroom together. Please come on time.'
      ],
      [
        DateTime(2022, 1, 26, 7, 30),
        'I am pleased to announce that I am, Erin Lee Shields receiving my Doctorate in Medicine from University of Florida. Please join me at Commencement Exercises, Phillips Center for the Performing Arts on Tuesday May 15 at 6:00 PM'
      ],
      [
        DateTime(2022, 7, 5, 15, 45),
        'If you have been following the developments within our company, you probably came across our latest job opening. For those of you who are not aware, we are currently hiring an HR manager. This announcement will be shared with external sources on a later date, but first we would like to get some eligible candidates from within our company.'
      ],
      [
        DateTime(2021, 7, 5, 21, 13),
        'We are pleased to announce that we found the best candidate for our long-lasting open position [enter job position]. We decided to bring [new employee’s name] to the team as his/her/their knowledge matches and exceeds the requirements for the role.'
      ],
      [
        DateTime(2021, 5, 5, 23, 56),
        'We hope and assume you will make the first step and introduce yourself to our new [job role], helping him/her/them adjust to the pleasant atmosphere of our company as quickly as possible'
      ]
    ];
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          child: MaterialButton(
            color: Colors.blueAccent,
            shape: StadiumBorder(),
            elevation: 15,
            onPressed: () => showDialog(
                context: currContext,
                builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Add Course',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        actions: [
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: courseId,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.handshake_outlined),
                                    hintText: 'ID',
                                    labelText: 'ID',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: courseName,
                                  decoration: InputDecoration(
                                    icon: const Icon(
                                        Icons.person_outline_rounded),
                                    hintText: 'Name',
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: coursePrerequisite,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.label_important_outline),
                                    hintText: 'Prerequisite',
                                    labelText: 'Prerequisite',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: coursePrice,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.money_outlined),
                                    hintText: 'Price',
                                    labelText: 'Price',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 120,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                    ),
                                  )),
                              Spacer(),
                              Container(
                                width: 120,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (courseId.text == '' ||
                                        coursePrice.text == '' ||
                                        courseName.text == '') {
                                      Fluttertoast.showToast(
                                          msg: "Can't add this course",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    if (coursePrerequisite.text == '')
                                      coursePrerequisite.text = '--';
                                    var newCourse = [
                                      courseId.text,
                                      courseName.text,
                                      coursePrerequisite.text,
                                      int.parse(coursePrice.text)
                                    ];
                                    if (coursePrerequisite.text == '')
                                      //code for null text;
                                      Navigator.pop(context);
                                  },
                                  color: Colors.blueAccent,
                                  shape: StadiumBorder(),
                                  child: Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])),
            height: 40,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white60,
                  elevation: 15,
                  child: Row(
                    children: [
                      Container(
                        width: 270,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15),
                              child: Row(
                                children: [
                                  const Text(
                                    'ID:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${courses[position][0]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      'Name:- ',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${courses[position][1]}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Prerequisite:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${courses[position][2] ?? '--'}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Price:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${courses[position][3]} EGP',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.red[900],
                          height: 150,
                          elevation: 15,
                          child: Text(
                            'Remove',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: courses.length,
          ),
        ),
      ],
    ),
    Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          child: MaterialButton(
            color: Colors.blueAccent,
            shape: StadiumBorder(),
            elevation: 15,
            onPressed: () => showDialog(
                context: currContext,
                builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Add Student',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        actions: [
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: studentId,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.perm_identity),
                                    hintText: 'ID',
                                    labelText: 'ID',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: studentName,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.person_outline_rounded),
                                    hintText: 'Name',
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: studentUsername,
                                  decoration: InputDecoration(
                                    icon: Icon(CupertinoIcons.profile_circled),
                                    hintText: 'Username',
                                    labelText: 'Username',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: studentEmail,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.email_outlined),
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: studentPassword,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.enhanced_encryption),
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 120,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                    ),
                                  )),
                              Spacer(),
                              Container(
                                width: 120,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (studentId.text == '' ||
                                        studentName.text == '' ||
                                        studentUsername.text == '' ||
                                        studentEmail.text == '' ||
                                        studentPassword.text == '') {
                                      Fluttertoast.showToast(
                                          msg: "Can't add this student",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    if (studentPassword.text.length < 8 ||
                                        studentPassword.text.length > 30) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "The Password must be between 8-30",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    Navigator.pop(context);
                                  },
                                  color: Colors.blueAccent,
                                  shape: StadiumBorder(),
                                  child: Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])),
            height: 40,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white70,
                  elevation: 15,
                  child: Row(
                    children: [
                      Container(
                        width: 230,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Row(
                                children: [
                                  const Text(
                                    'ID:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${students[position][0]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      'Name:- ',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${students[position][1]}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Username:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${students[position][2] ?? '--'}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Email:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${students[position][3]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Password:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${students[position][4]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 90,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.red[900],
                          height: 170,
                          elevation: 15,
                          child: Text(
                            'Remove',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: students.length,
          ),
        ),
      ],
    ),
    Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          child: MaterialButton(
            color: Colors.blueAccent,
            shape: StadiumBorder(),
            elevation: 15,
            onPressed: () => showDialog(
                context: currContext,
                builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Add Instructor',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        actions: [
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: instructorId,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.perm_identity),
                                    hintText: 'ID',
                                    labelText: 'ID',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: instructorName,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.person_outline_rounded),
                                    hintText: 'Name',
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: instructorUsername,
                                  decoration: InputDecoration(
                                    icon: Icon(CupertinoIcons.profile_circled),
                                    hintText: 'Username',
                                    labelText: 'Username',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: instructorEmail,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.email_outlined),
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: instructorPassword,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.enhanced_encryption),
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 120,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                    ),
                                  )),
                              Spacer(),
                              Container(
                                width: 120,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (studentId.text == '' ||
                                        studentName.text == '' ||
                                        studentUsername.text == '' ||
                                        studentEmail.text == '' ||
                                        studentPassword.text == '') {
                                      Fluttertoast.showToast(
                                          msg: "Can't add this instructor",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    if (studentPassword.text.length < 8 ||
                                        studentPassword.text.length > 30) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "The Password must be between 8-30",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    Navigator.pop(context);
                                  },
                                  color: Colors.blueAccent,
                                  shape: StadiumBorder(),
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])),
            height: 40,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white70,
                  elevation: 15,
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Row(
                                children: [
                                  const Text(
                                    'ID:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${instructors[position][0]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      'Name:- ',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${instructors[position][1]}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Username:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${instructors[position][2] ?? '--'}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Email:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      '${instructors[position][3]}',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.grey[700],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Password:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${instructors[position][4]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Salary:- ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '${instructors[position][5]}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 90,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.red[900],
                          height: 180,
                          elevation: 15,
                          child: const Text(
                            'Remove',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: students.length,
          ),
        ),
      ],
    ),
    Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          child: MaterialButton(
            color: Colors.blueAccent,
            shape: StadiumBorder(),
            elevation: 15,
            onPressed: () {
              Navigator.push(
                currContext,
                MaterialPageRoute(builder: (context) => annoucment_add()),
              );
            },
            height: 40,
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Card(
                margin: const EdgeInsets.all(15),
                color: Colors.white60,
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 15, top: 15, left: 15),
                      child: SizedBox(
                        width: 350,
                        child: Text(
                          annoucmnets[position][1],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple[900],
                              fontSize: 19),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 15, top: 15, left: 15),
                      child: Text(
                        dating(annoucmnets[position][0]),
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
            },
            itemCount: annoucmnets.length,
          ),
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    currContext = context;
    return Scaffold(
      appBar: AppBar(title: Text(titles.elementAt(_selectedIndex))),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt),
            label: 'Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Instructor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            label: 'Announcement',
          ),
        ],
        selectedItemColor: Colors.blue,
        elevation: 8,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          elevation: 15,
          width: 300,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${affairName}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      affairEmail,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                selected: true,
                title: const Text('Add'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.view_week_outlined),
                title: const Text('View'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => view_affair()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                trailing: Icon(Icons.navigate_next_outlined),
                title: const Text('Log Out'),
                onTap: () {
                  setPref();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => get_started()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  static String dating(DateTime newDate) {
    DateTime currdate = DateTime.now();
    var diff = currdate.difference(newDate);
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
