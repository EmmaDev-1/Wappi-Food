import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Login/login.dart';
//import 'package:project/Auth/firebaseAuth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCWnnv-nDDA0fLojmf48l72gOAVAyb_n8Q",
          appId: "1:141836323622:android:2bb9e1014febad8cddcfe7",
          messagingSenderId: "141836323622",
          projectId: "wappi-auth"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
    );
  }
}
