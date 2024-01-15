import 'package:flutter/material.dart';
import 'package:news_blog_flutter_app/pages/news_view.dart';
import 'package:news_blog_flutter_app/pages/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  String _title = 'The Economic Times';
  List<Widget> bottomNavigationBarScreens = const [NewsView(), ProfileView()];
  List<String> bottomNavigationBarScreenTitles = const [
    'The Economic Times',
    'User Profile'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title),
      ),
      body: bottomNavigationBarScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (value) => updateCurrentIndex(value),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }

  void updateCurrentIndex(value) {
    setState(() {
      _selectedIndex = value;
      _title = bottomNavigationBarScreenTitles[_selectedIndex];
    });
  }
}
