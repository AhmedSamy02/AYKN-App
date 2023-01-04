import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yarab/components/crud.dart';

import '../constant/linkapi.dart';

class affair_payment extends StatefulWidget {
  const affair_payment({Key? key}) : super(key: key);

  @override
  State<affair_payment> createState() => _affair_paymentState();
}

class _affair_paymentState extends State<affair_payment> with Crud {
  TextEditingController payment = new TextEditingController();
  addpayment() async {
    var response = postRequest(linkaddpay, {"std_username": payment.text});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
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
                Image.asset('assets/images/paymentt.jpg'),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  'Please type the username of the student',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 45),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: payment,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                              strokeAlign: StrokeAlign.center)),
                      hintText: 'Student Username',
                      labelText: 'Username',
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
                      var r = await addpayment();
                      //Navigator.pop(context);
                      if (r != null) {
                        Fluttertoast.showToast(
                          msg: "Payment added successfully",
                          gravity: ToastGravity.BOTTOM,
                          fontSize: 20,
                          textColor: Colors.white,
                          backgroundColor: Colors.blue,
                          toastLength: Toast.LENGTH_LONG,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Wrong username!",
                          gravity: ToastGravity.BOTTOM,
                          fontSize: 20,
                          textColor: Colors.white,
                          backgroundColor: Colors.blue,
                          toastLength: Toast.LENGTH_LONG,
                        );
                      }
                    },
                    elevation: 15,
                    color: Colors.blue[900],
                    height: 50,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
