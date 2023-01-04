import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yarab/components/crud.dart';

import '../constant/linkapi.dart';

class feedback_screen extends StatelessWidget with Crud {
  TextEditingController feedback = new TextEditingController();

  String Id = '';
  feedback_screen(this.Id, {super.key});

  addfed() async {
    var response =
        postRequest(linkaddfed, {"std_id": Id, "fed_content": feedback.text});
    return response;
  }
  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Your feedback sure make us better',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  'Please type your feedback below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
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
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                              strokeAlign: StrokeAlign.center)),
                      hintText: 'Your feedback here',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                              color: Colors.indigo,
                              width: 1,
                              strokeAlign: StrokeAlign.center)),
                    ),
                    cursorColor: Colors.indigo,
                    scrollPhysics: AlwaysScrollableScrollPhysics(),
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  width: 300,
                  child: MaterialButton(
                    onPressed: () async {
                      if (feedback.text == '') {
                        Fluttertoast.showToast(
                            msg: "Please enter feedback",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        var res = await addfed();
                        if (res == null) {
                          Fluttertoast.showToast(
                              msg: "error in adding",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        feedback.text = '';
                      }
                    },
                    elevation: 15,
                    color: Colors.blue[900],
                    height: 50,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
