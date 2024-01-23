import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/firebase_options.dart';
import 'package:news_blog_flutter_app/pages/authentication/phone_view.dart';

late double deviceWidth;
late double deviceHeight;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
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
      home: const PhoneView(),
    );
  }
}
