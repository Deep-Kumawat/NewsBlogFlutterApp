import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/pages/authentication/phone_view.dart';

late double deviceWidth;
late double deviceHeight;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Blog',
      theme: ThemeData.dark(),
      home: PhoneView(),
    );
  }
}
