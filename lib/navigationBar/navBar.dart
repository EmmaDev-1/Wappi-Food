import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/DashBoard/mainDashBoard.dart';
import 'package:project/Order/mainOrders.dart';
import 'package:project/Profile/mainProfile.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  //Body List
  int navBarIndex = 0;

  List navBody = [mainDashBoard(), mainOrder(), mainProfile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 15,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5, vertical: 5),
            child: GNav(
                selectedIndex: navBarIndex,
                onTabChange: (index) {
                  setState(() {
                    navBarIndex = index;
                  });
                },
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                color: const Color.fromARGB(255, 255, 94, 0),
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                tabBackgroundColor: const Color.fromARGB(255, 255, 94, 0),
                gap: 10,
                padding: const EdgeInsets.all(15),
                duration: const Duration(milliseconds: 300),
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      fontFamily: 'QuickSand-Bold',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  GButton(
                    icon: Icons.sticky_note_2_outlined,
                    text: 'Orders',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      fontFamily: 'QuickSand-Bold',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      fontFamily: 'QuickSand-Bold',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ]),
          ),
        ),
        body: navBody[navBarIndex],
      ),
    );
  }
}
