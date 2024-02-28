import 'dart:developer';

import 'package:event_app/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:event_app/auth/phoneauth.dart';

class OTPScreen extends StatefulWidget {
  final String verificationid;
  OTPScreen({super.key, required this.verificationid});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTPScreen"),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: otpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: "Enter OTP",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationid,
                        smsCode: otpController.text.toString());
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }).catchError((error) {
                  // Authentication failed, handle the error
                  print("Authentication failed: $error");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhoneAuth(),
                    ),
                  );
                  // You can show an error message to the user or handle the error in any other way
                });
              } catch (e) {
                print(e.toString());
                log(e.toString());
              }
            },
            child: Text("OTP"))
      ]),
    );
  }
}
