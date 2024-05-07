// ignore_for_file: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Navegation/navegationAnimation.dart';
import 'package:project/navigationBar/navBar.dart';
import 'package:project/navigationBar/notificationBar.dart';
import '../Register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late bool _obscureText = true;
  bool _animacionEjecutada = false;
  bool _animacionIniciada = false;
  late String selectedtext = "";
  late TextEditingController emailController;
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setStatusBarLightStyle();
    emailController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_animacionIniciada) {
        _iniciarAnimacion();
      }
    });
  }

  void _iniciarAnimacion() async {
    // Simula un retraso de 1 segundo
    await Future.delayed(const Duration(seconds: 1));
    // Actualiza el estado solo si el widget está todavía en el árbol de widgets
    if (mounted) {
      setState(() {
        _animacionEjecutada = true;
        _animacionIniciada = true;
      });
    }
  }

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Color.fromARGB(255, 255, 94, 0)),
            ),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const navigationBar()),
      );
    } catch (e) {
      Navigator.pop(context);
      _showErrorDialog();
    }
  }

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text("Please check you're credentials."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: login(),
                    ),
                  ],
                ),
              )
            ],
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

  Widget login() {
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
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 1,
            child: _animacionEjecutada
                ? TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: const Duration(
                        milliseconds:
                            150), // Ajusta la velocidad de la animación
                    text: const ['Hi,\nWelcome Back...'],
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
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 215, 215, 215), // Color de fondo gris
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde
                ),
                hintText: 'User',
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
            height: MediaQuery.of(context).size.height * 0.047,
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  crearRuta(context, const registerPage()),
                );
              },
              child: Text(
                'Don\'t have and account? Sign Up Here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'QuickSand-Bold',
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            child: Text(
              'Default user: test@gmail.com\nDefault password: 123456',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontFamily: 'QuickSand',
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: ElevatedButton(
              onPressed: () => signIn(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 255, 94, 0), // Puedes cambiar el color aquí
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Login',
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
