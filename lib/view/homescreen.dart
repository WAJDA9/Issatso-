import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojet/view/account.dart';
import 'package:miniprojet/view/chat.dart';
import 'package:miniprojet/view/courses.dart';
import 'package:miniprojet/view/home.dart';
import 'package:miniprojet/view/scheduel.dart';

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
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
                controler.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.decelerate);
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: const Text('Time Schedule'),
              selected: _selectedIndex == 1,
              onTap: () {
                
                _onItemTapped(1);
                
                Navigator.pop(context);
                controler.animateToPage(3, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                
              },
            ),
            ListTile(
              leading: Icon(Icons.motion_photos_off_sharp),
              title: const Text('absences'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('courses'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
                controler.animateToPage(4, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: const Text('Events'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: const Text('Library'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
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
        controller: controler,
        children: [
          
          Account(),
          HomeScreen(),
          Chat(),
          Scheduel(),
          Courses(),
        ],
      ),
    );
  }
}