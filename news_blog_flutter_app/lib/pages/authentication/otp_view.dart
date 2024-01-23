import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/main.dart';
import 'package:news_blog_flutter_app/pages/home_view.dart';
import 'package:news_blog_flutter_app/styles/main_styles.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPView extends StatefulWidget {
  final String verificationId;
  OTPView({super.key, required this.verificationId});
  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  OtpFieldController otpController = OtpFieldController();
  late String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OTPTextField(
                controller: otpController,
                length: 6,
                // width: MediaQuery.of(context).size.width,
                width: deviceWidth,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  otp = pin;
                }),
            SizedBox(
              height: deviceHeight * 0.05,
            ), // go back to change the phone number
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Change Phone Number',
                style: NewsBlogStyles.standardButtonTextStyles,
              ),
              style: NewsBlogStyles.standardButtonStyles,
            ),
            SizedBox(
              height: deviceHeight * 0.01,
            ), // go back to change the phone number
            TextButton(
                onPressed: () async {
                  try {
                    print(
                        '--verification id from otp view: ${widget.verificationId}');
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: otp);
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  } catch (e) {
                    print("--Error in otp_view");
                    print(e.toString());
                  }
                },
                style: NewsBlogStyles.standardButtonStyles,
                child: Text(
                  'Verify OTP',
                  style: NewsBlogStyles.standardButtonTextStyles,
                ))
          ]),
    );
  }
}
