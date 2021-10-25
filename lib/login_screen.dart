import 'dart:ui';
import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _phone = TextEditingController();

  final RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              '/Users/tekie/Desktop/testconnectionflutter/images/splash.png',
              width: 400,
              height: 400,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 65.0,
              width: 342,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 10.0, color: Colors.black12)
                  ]),
              // padding: EdgeInsets.only(
              //     left: 20.0.w, right: 68.0.w, top: 21.0.h, bottom: 21.0.h),
              child: TextFormField(
                controller: _phone,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 21.0, bottom: 21.0),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50.0,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  if (_phone.text.isEmpty) {
                    showErrorSnakBar(context, 'Please Enter the code ');
                  } else if (!regExp.hasMatch(_phone.text)) {
                    showErrorSnakBar(
                        context, 'Please Enter Valide Phone Number[');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Hoem()
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }