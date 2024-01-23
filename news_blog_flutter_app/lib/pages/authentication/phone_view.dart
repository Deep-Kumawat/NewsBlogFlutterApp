import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/pages/authentication/otp_view.dart';
import 'package:news_blog_flutter_app/styles/main_styles.dart';
import 'package:phonenumbers/phonenumbers.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  final phoneNumberController = PhoneNumberEditingController();
  late PhoneNumber? phoneNumber;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    print("log: ${deviceWidth}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify Phone"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: deviceHeight * 0.3,
                left: deviceWidth * 0.125,
                right: deviceWidth * 0.125,
                bottom: deviceHeight * 0.03),
            child: Expanded(
                child: PhoneNumberField(
              countryCodeWidth: 80,
              dialogTitle: "Enter Phone Number",
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )),
          ),
          TextButton(
              onPressed: () async {
                print('--deep');
                print('--${phoneNumberController.value}');
                await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.value.toString(),
                    verificationCompleted:
                        (PhoneAuthCredential phoneAuthCredential) async {
                      await FirebaseAuth.instance
                          .signInWithCredential(phoneAuthCredential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print("Verification Failed and the error is below:");
                      print(e);
                    },
                    codeSent: (String verficationId, int? resendtoken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OTPView(verificationId: verficationId)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {});
              },
              style: NewsBlogStyles.standardButtonStyles,
              child: Text(
                'Verify Phone Number',
                style: NewsBlogStyles.standardButtonTextStyles,
              ))
        ],
      ),
    );
  }
}
