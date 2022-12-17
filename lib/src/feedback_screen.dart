import 'package:flutter/material.dart';


class feedback_screen extends StatelessWidget {

  TextEditingController feedback=new TextEditingController();

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 38, 71, 156),
        elevation: 20,
        centerTitle: true,
        toolbarHeight: 60,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 30,
          overflow: TextOverflow.ellipsis,
          color: Colors.white,
        ),
        title: Text(
          'Feedback',
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/feed.png'),
                SizedBox(height: 60,),
                Text(
                  'Your feedback sure make us better',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w600,
                    fontSize: 25
                  ),
                ),
                SizedBox(height: 15,),
                const Text(
                  'Please type your feedback below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  width: 355,
                  child: TextFormField(

                    controller: feedback,
                    keyboardType: TextInputType.text,
                    maxLines: 8,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                              strokeAlign: StrokeAlign.center)),
                      hintText: 'Your feedback here',

                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 1,
                          strokeAlign: StrokeAlign.center)),
                    ),

                    cursorColor: Colors.indigo,
                    scrollPhysics: AlwaysScrollableScrollPhysics(),
                    textDirection: TextDirection.ltr,

                  ),
                ),
                SizedBox(height: 45,),
                Container(
                  width: 300,
                  child: MaterialButton(
                    onPressed: (){},
                    elevation: 15,
                    color: Colors.blue[900],
                    height: 50,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
