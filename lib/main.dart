import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/Pages/SavePage.dart';
import 'package:news/Pages/Video.dart';
import 'package:news/fragments/AboutUs.dart';
import 'package:news/fragments/Acoount.dart';
import 'package:news/fragments/Setting.dart';
import 'package:news/fragments/LogOut.dart';
import 'package:news/Pages/HomePage.dart';
import 'package:news/Pages/NotificationPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children =[
    HomePage(),
    Playlist(),
    SavePage(),
    NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("wNews"),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text('Sopanha'),
              accountEmail: Text('Sopanha@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  child: new Icon(Icons.person, size: 40.0, color: Colors.white,),
                  backgroundColor: Colors.grey,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.account_circle),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.border_color),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(thickness: 4),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.power_settings_new),
              ),
            ),
          ],
        ),
          ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home"),
        ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.ondemand_video),
            title: new Text("Video"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.save_alt),
            title: new Text("Save"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            title: new Text("Notification",),
          ),
        ],
      ),
    );
  }
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
