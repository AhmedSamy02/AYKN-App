import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yarab/components/crud.dart';

import '../constant/linkapi.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> with Crud {
  viewann() async {
    var response = getRequest(linkaviewann);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: viewann(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
               itemCount: snapshot.hasData ? snapshot.data['data'].length : 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                itemBuilder: (Context, index) {
                  return Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(width: 5, color: Colors.white)),
                    color: Colors.lightBlue[50],
                    shadowColor: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {},
                        title: Text(
                          "${snapshot.data['data'][index]['ann_content']}",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Changa',
                          ),
                        ),
                        subtitle: Text(
                         "Announcement by : "+"${snapshot.data['data'][index]['studAff_firstName']} ""${snapshot.data['data'][index]['studAff_secName']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Bitter',
                            fontWeight: FontWeight.bold,
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
