import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:miniprojet/view/student/absences.dart';
import 'package:miniprojet/view/student/account.dart';
import 'package:miniprojet/view/student/calendar.dart';
import 'package:miniprojet/view/student/chat.dart';
import 'package:miniprojet/view/student/courses.dart';
import 'package:miniprojet/view/student/home.dart';
import 'package:miniprojet/view/student/library.dart';
import 'package:miniprojet/view/student/scheduel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedInedx=1;
  final controler=PageController(
    initialPage: 1
  );
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        
        child: ListView(
  padding: EdgeInsets.zero,
  children: [
    const DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromARGB(85, 33, 149, 243),
      ),
      child: Image(image: AssetImage("assets/Logo.png"),),
    ),
    ListTile(
      leading: Icon(Icons.home),
      title: Semantics(
        label: 'Home',
        child: Text('Home'),
      ),
      selected: _selectedIndex == 0,
      onTap: () {
        _onItemTapped(0);
        Navigator.pop(context);
        controler.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.decelerate);
      },
    ),
    ListTile(
      leading: Icon(Icons.schedule),
      title: Semantics(
        label: 'Time Schedule',
        child: Text('Time Schedule'),
      ),
      selected: _selectedIndex == 1,
      onTap: () {
        _onItemTapped(1);
        Navigator.pop(context);
        controler.animateToPage(3, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      },
    ),
    ListTile(
      leading: Icon(Icons.motion_photos_off_sharp),
      title: Semantics(
        label: 'Absences',
        child: Text('Absences'),
      ),
      selected: _selectedIndex == 2,
      onTap: () {
        _onItemTapped(2);
        Navigator.pop(context);
        controler.animateToPage(4, duration: Duration(milliseconds: 200), curve: Curves.easeIn);

      },
    ),
    ListTile(
      leading: Icon(Icons.book),
      title: Semantics(
        label: 'Courses',
        child: Text('Courses'),
      ),
      selected: _selectedIndex == 3,
      onTap: () {
        _onItemTapped(3);
        Navigator.pop(context);
        controler.animateToPage(5, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      },
    ),
    ListTile(
      leading: Icon(Icons.event),
      title: Semantics(
        label: 'Events',
        child: Text('Events'),
      ),
      selected: _selectedIndex == 4,
      onTap: () {
        _onItemTapped(4);
        Navigator.pop(context);
        controler.animateToPage(6, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      },
    ),
    ListTile(
      leading: Icon(Icons.library_books),
      title: Semantics(
        label: 'tap to open library',
        child: Text('Library'),
      ),
      selected: _selectedIndex == 6,
      onTap: () {
        _onItemTapped(5);
        Navigator.pop(context);
        controler.animateToPage(7, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      },
    ),
  ],
),
      ),
      appBar: AppBar(
        
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
            
              },
            );
          }
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedInedx,
        showUnselectedLabels: false,
        onTap: (index){
          controler.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          setState(() {
            selectedInedx=index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "profile"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "chat"
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(  ),
        controller: controler,
        children: [
          
          Account(),
          HomeScreen(),
          Chat(),
          ScheduelScreen(),
          AbsencesScreen(),
          Courses(),
          TableComplexExample(),
          Library()
        ],
      ),
    );
  }
}