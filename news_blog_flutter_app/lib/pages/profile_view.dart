import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_blog_flutter_app/main.dart';
import 'package:news_blog_flutter_app/pages/home_view.dart';
import 'package:news_blog_flutter_app/pages/news_view.dart';
import 'package:news_blog_flutter_app/styles/main_styles.dart';

enum _Gender { Male, Female }

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  _Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          Center(
            child: Container(
                height: deviceHeight * 0.125,
                width: deviceHeight * 0.125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.amber),
                child:
                    ClipOval(child: Image.asset('assets/images/avatar.jpg'))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: deviceWidth * 0.7,
            child: TextField(
              decoration:
                NewsBlogStyles.textFieldDecorantion("Enter Name"))),
          SizedBox(
            height: 20,
          ),
          Container(
              width: deviceWidth * 0.7,
              child: TextField(
                  decoration:
                      NewsBlogStyles.textFieldDecorantion("Enter Email"))),
          Container(
            // Gender Radio Buttons
            width: deviceWidth * 0.7,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(children: [
              Expanded(
                  child: RadioListTile(
                title: Text(_Gender.Male.name),
                value: _Gender.Male,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              )),
              Expanded(
                child: RadioListTile(
                  title: Text(_Gender.Female.name),
                  value: _Gender.Female,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
              )
            ]),
          ),
          Container(
              width: deviceWidth * 0.7,
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration:
                      NewsBlogStyles.textFieldDecorantion("Date Of Birth"))),
          SizedBox(
            height: 20,
          ),
          Container(
              width: deviceWidth * 0.7,
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration:
                  NewsBlogStyles.textFieldDecorantion("Moblie Number"))),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
                style: NewsBlogStyles.standardButtonStyles,
                child: Text(
                  'Save Changes',
                  style: NewsBlogStyles.standardButtonTextStyles,
                )),
          )
        ],
      ),
    ]);
  }
}
