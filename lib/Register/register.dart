import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:project/navigationBar/navBar.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  //Variables
  bool _animacionEjecutada = false;
  late bool _obscureText = true;
  late String selectedtext = "";
  late bool _obscureTextRepeat = true;
  late String selectedtextRepeat = "";

  //Controllers
  late TextEditingController userController;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllerRepeat = TextEditingController();

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _animacionEjecutada = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true, // Extiende el cuerpo detrás de la barra de aplicación
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Stack(
                    children: [
                      disenoSuperior(),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.30,
                        child: register(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget disenoSuperior() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/loginBackground.jpg'),
              fit: BoxFit.cover)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.14,
        ),
        child: Text(
          'Wappi Food',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeight.bold,
            fontFamily: 'QuickSand',
            color: const Color.fromARGB(255, 255, 94, 0),
          ),
        ),
      ),
    );
  }

  Widget register() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
            ),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 1,
            child: _animacionEjecutada
                ? TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: const Duration(milliseconds: 150),
                    text: const ['Sign Up...'],
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'QuickSand',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.start,
                  )
                : Container(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 215, 215, 215), // Color de fondo gris
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde
                ),
                hintText: 'User Name',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ), // Texto por defecto
                prefixIcon: const Icon(Icons.person_outline_rounded,
                    color: Color.fromARGB(
                        255, 83, 83, 83)), // Icono a la izquierda
                // Puedes agregar más propiedades de estilo según tus necesidades
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 215, 215, 215), // Color de fondo gris
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ), // Texto por defecto
                prefixIcon: const Icon(Icons.email_outlined,
                    color: Color.fromARGB(
                        255, 83, 83, 83)), // Icono a la izquierda
                // Puedes agregar más propiedades de estilo según tus necesidades
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: _obscureText,
                onChanged: (text) {
                  setState(() {
                    // Actualiza el estado del icono del ojo al escribir
                    _obscureText = text.isEmpty ? true : _obscureText;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 215, 215, 215), // Color de fondo gris
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Bordes redondeados
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline_rounded,
                      color: Color.fromARGB(
                          255, 83, 83, 83)), // Icono a la izquierda
                  suffixIcon: passwordController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(
                                255, 83, 83, 83), // Color del icono del ojo
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                  // Puedes agregar más propiedades de estilo según tus necesidades
                ),
              )),
          Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: TextField(
                controller: passwordControllerRepeat,
                obscureText: _obscureTextRepeat,
                onChanged: (text) {
                  setState(() {
                    // Actualiza el estado del icono del ojo al escribir
                    _obscureTextRepeat =
                        text.isEmpty ? true : _obscureTextRepeat;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 215, 215, 215), // Color de fondo gris
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Bordes redondeados
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  hintText: 'Repeat Password',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline_rounded,
                      color: Color.fromARGB(
                          255, 83, 83, 83)), // Icono a la izquierda
                  suffixIcon: passwordControllerRepeat.text.isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(
                                255, 83, 83, 83), // Color del icono del ojo
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTextRepeat = !_obscureTextRepeat;
                            });
                          },
                        ),
                  // Puedes agregar más propiedades de estilo según tus necesidades
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigationBar()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 255, 94, 0), // Puedes cambiar el color aquí
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
