import 'package:flutter/material.dart';

class mainShoppingBag extends StatefulWidget {
  const mainShoppingBag({super.key});

  @override
  State<mainShoppingBag> createState() => _mainShoppingBagState();
}

class _mainShoppingBagState extends State<mainShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    children: [
                      headerContent(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  headerContent() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
        left: MediaQuery.of(context).size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              'Shopping Bag',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'QuickSand-Bold',
                fontSize: MediaQuery.of(context).size.width * 0.07,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
