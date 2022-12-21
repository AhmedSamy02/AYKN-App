import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Coursenamed {
  static var name;
  static setter(String? s) {
    name = s;
  }

  static String? getter() {
    return name;
  }
}

class Lectandexam extends StatefulWidget {
  Lectandexam({Key? key, @required this.Coursename, required this.Name})
      : super(key: key);
  void setname() {
    Coursenamed.setter(Coursename);
  }

  String Name = '';
  String? Coursename;
  @override
  State<Lectandexam> createState() => _LectandexamState(Name: Name);
}

class _LectandexamState extends State<Lectandexam> {
  final screens = [
    Lectures(),
    Exams(),
  ];
  _LectandexamState({required this.Name});
  int index = 0;
  final item = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.assignment_outlined, size: 30),
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
              leading: Icon(Icons.account_circle_rounded),
              backgroundColor: Color.fromARGB(255, 38, 71, 156),
              title: Text(
                "$Name",
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
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
                color: Color.fromARGB(255, 38, 71, 156),
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: Colors.orange[900],
                animationCurve: Curves.bounceInOut,
                animationDuration: Duration(milliseconds: 500),
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

class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  var name = Coursenamed.getter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'open the text book',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'changa',
              ),
            ),
            style: ElevatedButton.styleFrom(elevation: 20.0),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (Context, index) {
                  return Container(
                    height: 100,
                    child: Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          side: BorderSide(width: 5, color: Colors.white)),
                      color: Colors.lightBlue[50],
                      child: ListTile(
                        onTap: () {
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Exams(),));*/
                        },
                        title: Text(
                          "the lecture name",
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Text("the main topic",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Bitter',
                              fontWeight: FontWeight.bold,
                            )),
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

class Exams extends StatefulWidget {
  const Exams({Key? key}) : super(key: key);

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  var name = Coursenamed.getter();
  List<String> entries = <String>['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (Context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                height: 100,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      side: BorderSide(width: 5, color: Colors.white)),
                  color: Colors.lightBlue[50],
                  shadowColor: Colors.blue[600],
                  child: ListTile(
                    onTap: () {
                      print(name);
                    },
                    title: Text(
                      entries[index],
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Text("grade",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Bitter',
                          fontWeight: FontWeight.bold,
                        )),
                    trailing: Column(
                      children: [
                        Text("Grade",
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "20",
                          style: TextStyle(
                            fontFamily: 'bitter',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
