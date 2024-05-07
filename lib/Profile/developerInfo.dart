import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showDeveloperInfo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
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
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: AssetImage('assets/images/emma.jpeg')),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'Emmanuel Aguilar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'Cel: +52 7717774411',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    '@: emma_3a@outlook.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://github.com/EmmaDev-1'); // Se usa Uri para manejar URLs
                          if (!await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/images/github.png')),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 219, 103, 255)
                                    .withOpacity(1), // Color de la sombra
                                spreadRadius: 0, // Extensión de la sombra
                                blurRadius: 0, // Desenfoque de la sombra
                                offset: const Offset(0,
                                    0), // Desplazamiento horizontal y vertical de la sombra
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final Uri urlLinkedin = Uri.parse(
                              'https://www.linkedin.com/in/dev-emma1/'); // Se usa Uri para manejar URLs
                          if (!await launchUrl(
                            urlLinkedin,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch $urlLinkedin');
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/images/linkedin.png'),
                                fit: BoxFit.contain),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 183, 212, 255)
                                    .withOpacity(1), // Color de la sombra
                                spreadRadius: 0, // Extensión de la sombra
                                blurRadius: 0, // Desenfoque de la sombra
                                offset: const Offset(0,
                                    0), // Desplazamiento horizontal y vertical de la sombra
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
