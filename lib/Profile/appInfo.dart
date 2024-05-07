import 'package:flutter/material.dart';

void showAppInfo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.57,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/wappi_logo.jpg')),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.2), // Color de la sombra
                      spreadRadius: 2, // Extensión de la sombra
                      blurRadius: 10, // Desenfoque de la sombra
                      offset: const Offset(0,
                          4), // Desplazamiento horizontal y vertical de la sombra
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Column(
                children: [
                  Text(
                    'Created By',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontFamily: 'Quicksand',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'Emmanuel Aguilar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Text(
                    'Implemented Technologies',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontFamily: 'Quicksand',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.078,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/flutter_Logo.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.65,
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: Text(
                              'Flutter Framework',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'QuickSand-Bold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.078,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/Dart_Logo.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.65,
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: Text(
                              'Dart Language',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'QuickSand-Bold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.078,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/location.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.65,
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Text(
                              'GPS Sensor',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'QuickSand-Bold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.078,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/firebase.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.65,
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Text(
                              'Firebase Authentication',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'QuickSand-Bold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.078,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/ui_ux.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.65,
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Text(
                              'UI-UX Design',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'QuickSand-Bold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        /*
          Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: AssetImage('assets/images/wappi_logo.jpg')),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Color de la sombra
                    spreadRadius: 2, // Extensión de la sombra
                    blurRadius: 10, // Desenfoque de la sombra
                    offset: const Offset(0,
                        4), // Desplazamiento horizontal y vertical de la sombra
                  ),
                ],
              ),
            ),
            
            
            Column(
              children: [
                Text(
                  'Created By\nEmmanuel Aguilar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'Quicksand-Bold',
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  'Implemented Technologies',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'Quicksand-Bold',
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            
            /*
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.078,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/flutter_Logo.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            'Flutter Framework',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'QuickSand-Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.078,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Dart_Logo.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            'Dart Language',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'QuickSand-Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.078,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage('assets/images/location.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Text(
                            'GPS Sensor',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'QuickSand-Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.078,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage('assets/images/firebase.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Text(
                            'Firebase Authentication',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'QuickSand-Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.078,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage('assets/images/ui_ux.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Text(
                            'UI-UX Design',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'QuickSand-Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )*/*/
      );
    },
  );
}
