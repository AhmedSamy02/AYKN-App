import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final List<item> items=[
    item(header: "affair name",body: "the annoucement body"),
    item(header: "affair name1",body: "the annoucement body"),
    item(header: "affair name2",body: "the annoucement body")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            dividerColor: Colors.orange[900],
            children: items.map((item) => ExpansionPanelRadio(
              canTapOnHeader: true,
              value: item.header,//must be unique
              headerBuilder: (context,isExpaneded)=>Container(
                height: 20,
                child: ListTile(
                  title: Text(item.header,style: GoogleFonts.changa(
                    fontSize: 25,
                  ), ),

                ),
              )
                , body: ListTile(

              title: Text(item.body,style: TextStyle(fontSize: 25,
                    fontFamily: 'bitter',fontWeight: FontWeight.bold),),
            ),
                )).toList(),
          ),
        ),
    );
  }
}
class item{
  final String header;
  final String body;
  item({required this.header,required this.body});
}