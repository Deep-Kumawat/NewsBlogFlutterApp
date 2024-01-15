import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/main.dart';

String _MALE = "Male";
String _FEMALE = "Female";

enum _Gender {_MALE, _FEMALE}
class ProfileView extends StatefulWidget {
  static String _title = "Edit Profile";
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
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              width: deviceWidth * 0.7,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )),
          Container(
            // Gender Radio Buttons
            width: deviceWidth * 0.7,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(children: [
              Expanded(
                child: RadioListTile(
                title: Text(_Gender._MALE.name),
                value: _Gender._MALE,
                groupValue: _gender,
                onChanged: (value) {
                  setState((){
                    _gender = value;
                  });
                },
              )),
              Expanded(
                child: RadioListTile(
                  title: Text(_Gender._FEMALE.name),
                  value: _Gender._FEMALE,
                  groupValue: _gender,
                  onChanged: (value) {
                  setState((){
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
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "Date Of Birth",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              width: deviceWidth * 0.7,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Save Changes'),
                )),
          )
        ],
      ),
    ]);
  }
}
