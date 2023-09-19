import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ondamenu/constants.dart';
import 'package:ondamenu/screens/home_page.dart';
import 'package:ondamenu/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Current Error: ${snapshot.error}"),
              ),
            );
          }

          // Connected ~ App is running on Firebase
          if (snapshot.connectionState == ConnectionState.done) {

            // Streambuilder check of live login
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ),
                  );
                }

                if (streamSnapshot.connectionState == ConnectionState.active) {
                  // get the user
                  Object? _user = streamSnapshot.data;

                  // if user not logged in
                  if(_user == null) {
                    print('no user');
                    return LoginPage();
                  } else {
                    // user is logged in go to home page
                    print('user: $_user');
                    return HomePage();
                  }
                }

                return const Scaffold(
                  body: Center(
                    child: Text(
                      "Checking Authentication.... ",
                      style: Constants.regHeading,
                    ),
                  ),
                );
              },
            );
          }

          return const Scaffold(
            body: Center(
              child: Text(
                "Initializing App.... ",
              ),
            ),
          );
        });
  }
}
