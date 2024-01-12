import 'package:flutter/material.dart';

class mainProfile extends StatefulWidget {
  const mainProfile({super.key});

  @override
  State<mainProfile> createState() => _mainProfileState();
}

class _mainProfileState extends State<mainProfile> {
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
                      userData(),
                      profileContent(),
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

  userData() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 1,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(250.0),
              bottomRight: Radius.circular(250.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Color de la sombra
                spreadRadius: 1, // Extensión de la sombra
                blurRadius: 10, // Desenfoque de la sombra
                offset: const Offset(
                    0, 3), // Desplazamiento horizontal y vertical de la sombra
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/profile_background2.jpg'),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width * 0.35,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.14,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/profile_Image.jpg'),
              ),
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
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.165,
            left: MediaQuery.of(context).size.height * 0.27,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 255, 255, 255),
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
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  )),
            ))
      ],
    );
  }

  profileContent() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              'Hi, Emmanuel',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontFamily: 'Quicksand-Bold',
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25), // Esquinas redondeadas

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Color de la sombra
                  spreadRadius: 1, // Extensión de la sombra
                  blurRadius: 5, // Desenfoque de la sombra
                  offset: const Offset(0,
                      3), // Desplazamiento horizontal y vertical de la sombra
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 146, 82),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.wallet_rounded,
                          size: 27,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.028,
                          left: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Text(
                          'Wallet Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.11,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.045,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 225, 225, 225),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Se presiono");
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 25,
                            color: Color.fromARGB(158, 0, 0, 0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 146, 82),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 27,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.028,
                          left: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Text(
                          'User Info',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.11,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.045,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 225, 225, 225),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Se presiono");
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 25,
                            color: Color.fromARGB(158, 0, 0, 0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 146, 82),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.admin_panel_settings,
                          size: 27,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.028,
                          left: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Text(
                          'Developer Info',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.11,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.045,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 225, 225, 225),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Se presiono");
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 25,
                            color: Color.fromARGB(158, 0, 0, 0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          GestureDetector(
            onTap: () {
              print("Se presiono");
            },
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25), // Esquinas redondeadas

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Color de la sombra
                    spreadRadius: 1, // Extensión de la sombra
                    blurRadius: 5, // Desenfoque de la sombra
                    offset: const Offset(0,
                        3), // Desplazamiento horizontal y vertical de la sombra
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.login_rounded,
                      size: 25,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.023,
                      left: MediaQuery.of(context).size.height * 0.015,
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: 'Quicksand-Bold',
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
