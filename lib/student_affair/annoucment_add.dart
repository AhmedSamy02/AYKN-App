import 'package:flutter/material.dart';

class annoucment_add extends StatelessWidget {
  TextEditingController theAnnoucment=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 1, 141, 255),
        title: const Text('Announcements'),
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
                Image.asset('assets/images/annoucment.jpg'),
                SizedBox(height: 30,),

                Container(
                  width: 350,
                  child: Text(
                    'Keep your messages brief and purposeful. Explain the core information and message you want to deliver to your audience.  In other words, go straight to the point!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                const Text(
                  'Please type your announcement below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  width: 355,
                  child: TextFormField(

                    controller: theAnnoucment,
                    keyboardType: TextInputType.text,
                    maxLines: 8,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:  const BorderSide(
                              color: Colors.grey,
                              width: 2,
                              strokeAlign: StrokeAlign.center)),
                      hintText: 'Your feedback here',

                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:  BorderSide(
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
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    elevation: 15,
                    color: Colors.blue[900],
                    height: 50,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'Post',
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
