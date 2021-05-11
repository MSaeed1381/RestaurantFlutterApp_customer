
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/profilePage.dart';
import 'signUp.dart';
import 'User.dart';
class MainPage extends StatefulWidget {
  final User user;
  const MainPage({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState(user);
}

class _MainPageState extends State<MainPage> {
  User user;
  _MainPageState(User user){
    this.user = user;
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(),
      Container(),
      Container(),
      ProfilePage(user: user,),
    ];
    return Scaffold(
    appBar: AppBar(
      title: Text('Snap Food'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[700],
            icon: Icon(
              Icons.home,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
            ),
            label: "orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "profile",
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}