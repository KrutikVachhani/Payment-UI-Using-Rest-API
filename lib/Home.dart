import 'package:flutter/material.dart';
import 'package:ui_interface/AccountPage.dart';
import 'package:ui_interface/HomePage.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex=0;

  List<Widget> widgetsList =[
    AccountPage(),
    HomePage(),
    Container(),
    Container(color: Colors.black,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_rounded),
          label: "Wallet",
          backgroundColor: Colors.deepPurple
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.album_rounded),
            label: "kd",
            backgroundColor: Colors.blue
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: "heklo",
            backgroundColor: Colors.blue
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Wallet",
            backgroundColor: Colors.blue
        ),
      ],
      selectedItemColor: Colors.black,
        backgroundColor: Colors.deepPurple,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
            selectedIndex=index;
          },
          );
        },
      ),
    );
  }
}

