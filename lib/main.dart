import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondamenu/screens/landing_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  var posDbOpt = new FirebaseOptions(apiKey: "AIzaSyBQWjeIjGY_9B1m6JhT7Tkt2AtvRtiW8mk", appId: "1:1024532317222:android:c8cd7594f341f563e412e7",messagingSenderId: "ondamenu-pos", projectId: "ondamenu-pos");
  FirebaseApp app = await Firebase.initializeApp(
    name: "OnDaMenu-POS",
    options: posDbOpt,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  // print('Initialized $app');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  // OnDaMenu.initializeSecondary();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.acmeTextTheme(
        Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(
          primary: Color(0xFFFF1E80),
          secondary: Color(0xFF1EFF22),
        ),
      ),
      home: LandingPage(),
    );
  }
}

