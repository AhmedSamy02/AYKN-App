import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yarab/components/crud.dart';
import 'package:yarab/constant/linkapi.dart';

import '../main.dart';

class view_affair extends StatefulWidget {
  //const view_affair({super.key});
  view_affair({required this.Email});
  String Email = '';
  @override
  State<view_affair> createState() => _view_affairState(Email: Email);
}

class _view_affairState extends State<view_affair> with Crud {
  _view_affairState({required this.Email}) {
    Em = Email;
  }
  String Email = '';
  static String Em = '';
  static String id = '';
  static String course_name = '';

  static viewatte() async {
    var response = await Crud.postRequest123(linkviewattendance, {});
    return response;
  }

  static viewfeed() async {
    var response = await Crud.postRequest123(linkviewfeedback, {});
    return response;
  }

  static viewreq() async {
    var response = await Crud.postRequest123(linkveiwreq, {});
    return response;
  }

  static check() async {
    var response = await Crud.postRequest123(
        linkacceptcourse, {"std_id": '$id', "course_name": '$course_name'});
    return response;
  }

  static accept() async {
    var response = await Crud.postRequest123(linkaccept, {
      "studAff_email": '$Em',
      "std_id": '$id',
      "course_name": '$course_name'
    });
    return response;
  }

  static reject() async {
    var response = await Crud.postRequest123(
        linkreject, {"std_id": '$id', "course_name": '$course_name'});
    return response;
  }

  int _selectedIndex = 0;
  static List<Pair<DateTime, String>> feedbackList = [
    Pair(DateTime(2022, 12, 16, 5),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Pair(DateTime(2022, 2, 2, 5),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Pair(DateTime(2022, 1, 26, 7),
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'),
    Pair(DateTime(2022, 7, 5, 15),
        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?'),
    Pair(DateTime(2021, 7, 5, 21),
        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.'),
    Pair(DateTime(2021, 5, 5, 23),
        'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.')
  ];
  static var approveList = [];
  static var absenceList = [
    [1, 'Ahmed Samy', 3, 'Algorthims'],
    [2, 'Omar Mohamed', 2, 'Probability'],
    [3, 'Karim Ibrahim', 1, 'Data Structure'],
    [4, 'Aya Ali', 5, 'PT'],
    [5, 'Mahmoud Karim', 3, 'Circuits I'],
    [6, 'Amr Wael', 1, 'Circuits II'],
    [7, 'Zaki Ali', 3, 'Electronics I'],
    [8, 'Tamer Omar', 2, 'Electronics I'],
    [9, 'Ayman Mohamed', 1, 'Electronics I'],
    [10, 'Hossam Hassan', 1, 'Electronics I'],
    [11, 'Zaki Amr', 3, 'Logic Design I'],
    [12, 'Tamer Sakr', 2, 'Logic Design I'],
    [13, 'Ayman Omar', 1, 'Logic Design I'],
    [14, 'Amr Karem', 1, 'Logic Design I'],
    [15, 'Sayed Ahmed', 3, 'Logic Design I'],
  ];
  late List<Widget> _widgetOptions = <Widget>[
    Container(
      child: FutureBuilder(
          future: viewatte(),
          builder: (BuildContext context, AsyncSnapshot snapshot1) {
            return ListView.builder(
              itemCount: snapshot1.hasData ? snapshot1.data['data'].length : 0,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return Card(
                  margin: EdgeInsets.all(15),
                  elevation: 15,
                  color: Colors.white60,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  'ID:- ',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${snapshot1.data['data'][position]['stud_id']}",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                const Text(
                                  'Name:- ',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${snapshot1.data['data'][position]['std_firstName']}" +
                                      " " +
                                      "${snapshot1.data['data'][position]['std_secName']}",
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                const Text(
                                  'Course:- ',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${snapshot1.data['data'][position]['course_name']}",
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      new Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Absence',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${snapshot1.data['data'][position]['enroll_attendanceNo']}",
                            style: TextStyle(
                                fontSize: 20, color: Colors.blueAccent),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                );
              },
            );
          }),
    ),
    Container(
      child: FutureBuilder(
          future: viewreq(),
          builder: (BuildContext context, AsyncSnapshot snapshot8) {
            if (snapshot8.data != null) approveList = snapshot8.data['data'];
            return ListView.builder(
              itemCount: 50,
              itemBuilder: (context, position) {
                try {
                  return GestureDetector(
                    child: Card(
                      margin: EdgeInsets.all(13),
                      elevation: 15,
                      color: Colors.white60,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    const Text(
                                      'ID:- ',
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "${approveList[position]['std_id']}",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Course:- ',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "${approveList[position]['(SELECT `course_name` FROM `course` WHERE c = `course_id`)']}",
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          new Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () async {
                                  id = approveList[position]['std_id'];
                                  course_name = approveList[position][
                                      '(SELECT `course_name` FROM `course` WHERE c = `course_id`)'];
                                  var res = await accept();
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
                                    setState(() async {
                                      approveList.removeAt(position);
                                    });
                                    print('Accept $position pressed');
                                  }
                                },
                                color: Colors.green[800],
                                elevation: 7,
                                child: const Text(
                                  'Accept',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  id = approveList[position]['std_id'];
                                  course_name = approveList[position][
                                      '(SELECT `course_name` FROM `course` WHERE c = `course_id`)'];
                                  var res = await reject();
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
                                    setState(() async {
                                      var m = await viewreq();
                                      approveList = m['data'];
                                    });
                                  }
                                },
                                color: Colors.red[900],
                                elevation: 7,
                                child: const Text(
                                  'Decline',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      id = approveList[position]['std_id'];
                      course_name = approveList[position][
                          '(SELECT `course_name` FROM `course` WHERE c = `course_id`)'];
                      var res = await check();
                      if (res["status"] == "success") {
                        Fluttertoast.showToast(
                            msg: "Accepted",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "rejected",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  );
                } catch (e) {}
                return Container(
                  color: Colors.white,
                );
              },
            );
          }),
    ),
    FutureBuilder(
        future: viewfeed(),
        builder: (BuildContext context, AsyncSnapshot snapshot2) {
          return ListView.builder(
            itemCount: snapshot2.hasData ? snapshot2.data['data'].length : 0,
            shrinkWrap: true,
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
                          "${snapshot2.data['data'][position]['fed_content']}",
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
                        "${snapshot2.data['data'][position]['fed_date']}",
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
          );
        }),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var titles = {'Attendance', 'Requests', 'Feedback'};

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles.elementAt(_selectedIndex),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page_outlined),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
            label: 'Feedback',
          ),
        ],
        backgroundColor: Colors.white54,
        elevation: 8,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
    if (diff.inDays == 0) {
      return '${diff.inHours} hours ago ';
    }
    return '${diff.inDays} days ago ';
  }
}
