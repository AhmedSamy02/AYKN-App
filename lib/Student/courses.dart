import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (Context, index) {
            return Container(
              height: 100,
              child: Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    side: BorderSide(width: 5, color: Colors.white)),
                color: Colors.lightBlue[50],
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    "the course name",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Changa',
                    ),
                  ),
                  subtitle: const Text(
                    "discription",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(0),
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
                        children: const [
                          Text(
                            "Enroll",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Changa',
                            ),
                          ),
                          Icon(Icons.add_circle_outline_rounded)
                        ],
                      ),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                  'please notice the prerequist below'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('The prerequist.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'requist',
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'cancel',
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
