import 'package:flash_chat/Models/ItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../utilities/constants.dart';
import '../../utilities/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeItemsWidget(), // Replace with your actual screens
    CartItemsWidget(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  GNav(

        curve: Curves.fastOutSlowIn,
        backgroundColor: Colors.white,



        tabs:  const [
          GButton(
            padding: EdgeInsets.only(left: 50 , top: 20 , bottom: 20 , right: 50),
            margin: EdgeInsets.symmetric(horizontal:10 , vertical: 10),
            icon: CupertinoIcons.home,
            text: 'Home',
            textColor: Colors.white,
            textSize: 30,
            borderRadius: BorderRadius.all(Radius.circular(15)),

            backgroundColor: Colors.black,
            iconActiveColor: Colors.white,

            gap: 10,
          ),
          GButton(
            padding: EdgeInsets.only(left: 50 , top: 20 , bottom: 20 , right: 50),
            icon: CupertinoIcons.cart_fill,
            text: 'Cart',
            textColor: Colors.white,
            textSize: 15,
            borderRadius: BorderRadius.all(Radius.circular(15)),

            backgroundColor: Colors.black,
            iconActiveColor: Colors.white,

            gap: 10,

          ),


        ],

        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _screens[_selectedIndex] ,
    );

  }
}











