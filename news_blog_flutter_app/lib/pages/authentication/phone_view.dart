import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/pages/authentication/otp_view.dart';
import 'package:phonenumbers/phonenumbers.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  final phoneNumberController = PhoneNumberEditingController();
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
                right: deviceWidth * 0.125),
            child: Expanded(
                child: PhoneNumberField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OTPView()));
              },
              child: Text('Verify Phone Number'))
        ],
      ),
    );
  }
}
