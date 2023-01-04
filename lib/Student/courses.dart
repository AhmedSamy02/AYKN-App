import 'package:flutter/material.dart';
import 'package:yarab/components/crud.dart';

import '../constant/linkapi.dart';

class Courses extends StatefulWidget {
  String Id = '';
  Courses({Key? key, required this.Id}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> with Crud {

  viewallcourse() async {
      String Id = widget.Id;
    var response =  postRequest(linkaviewc,{"std_id": Id , "std_id2":Id});
    return response;
  }

  addenroll(String courseId) async {
      String Id = widget.Id;
    var response =
        postRequest(linkaaddenroll, {"std_id": Id, "course_id": courseId});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: viewallcourse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.hasData ? snapshot.data['data'].length : 0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                        title: Text(
                          "${snapshot.data['data'][index]['course_name']}",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Changa',
                          ),
                        ),
                        subtitle: Text(
                          "${snapshot.data['data'][index]['course_code']}",
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
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Please note that this prerequisite is required"),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          if ("${snapshot.data['data'][index]['pre_name']}" ==
                                              'null')
                                            Text(
                                                "This course has no prerequisite ")
                                          else
                                            Text(
                                                "${snapshot.data['data'][index]['pre_name']}"),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text(
                                          'requist',
                                          style: TextStyle(color: Colors.brown),
                                        ),
                                        onPressed: () async {
                                          addenroll(
                                              "${snapshot.data['data'][index]['course_id']}");
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
                });
          },
        ));
  }
}
