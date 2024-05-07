// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/Login/login.dart';
import 'package:project/Profile/appInfo.dart';
import 'package:project/Profile/developerInfo.dart';
import 'package:project/navigationBar/notificationBar.dart';
import '../Navegation/navegationAnimation.dart';
import 'package:image_picker/image_picker.dart';

class mainProfile extends StatefulWidget {
  const mainProfile({super.key});

  @override
  State<mainProfile> createState() => _mainProfileState();
}

class _mainProfileState extends State<mainProfile> {
  @override
  void initState() {
    super.initState();
    setStatusBarLightStyle();
  }

  File? profileImagen;
  File? backgroundImagen;

  Future<void> changeImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.025,
                  bottom: MediaQuery.of(context).size.height * 0.03,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Change image...',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontFamily: 'Quicksand-Bold',
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          profileImagen = File(pickedFile.path);
                        });
                        Navigator.pop(context); // Cerrar el bottom sheet
                      }
                    },
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: profileImagen != null ? null : Colors.black,
                          image: profileImagen != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(profileImagen!),
                                )
                              : const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/profile_Image.jpg'),
                                ),
                        ),
                      ),
                      const Icon(
                        Icons.mode_edit_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ]),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          backgroundImagen = File(pickedFile.path);
                        });
                        Navigator.pop(context); // Cerrar el bottom sheet
                      }
                    },
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: backgroundImagen != null ? null : Colors.black,
                          image: backgroundImagen != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(backgroundImagen!),
                                )
                              : const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/profile_background2.jpg'),
                                ),
                        ),
                      ),
                      const Icon(
                        Icons.mode_edit_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Profile image',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'BackGround image',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

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
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: backgroundImagen != null ? null : Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Color de la sombra
                spreadRadius: 1, // Extensión de la sombra
                blurRadius: 10, // Desenfoque de la sombra
                offset: const Offset(
                    0, 3), // Desplazamiento horizontal y vertical de la sombra
              ),
            ],
            image: backgroundImagen != null
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(backgroundImagen!),
                  )
                : const DecorationImage(
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
            decoration: BoxDecoration(
              color: backgroundImagen != null ? null : Colors.black,
              shape: BoxShape.circle,
              image: profileImagen != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(profileImagen!),
                    )
                  : const DecorationImage(
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
            top: MediaQuery.of(context).size.height * 0.175,
            left: MediaQuery.of(context).size.height * 0.28,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.045,
                width: MediaQuery.of(context).size.width * 0.11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 255, 255, 255),
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
                child: IconButton(
                    onPressed: () {
                      changeImage(context);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ),
            ))
      ],
    );
  }

  profileContent() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 1,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
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
                GestureDetector(
                  onTap: () {
                    showDeveloperInfo(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 146, 82),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
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
                            'Developer Info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontFamily: 'Quicksand-Bold',
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showAppInfo(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 146, 82),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.code_outlined,
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
                            'App Info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontFamily: 'Quicksand-Bold',
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
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
              Navigator.pushAndRemoveUntil(
                context,
                crearRuta(context, const loginPage()),
                (Route<dynamic> route) => false,
              );
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
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
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
