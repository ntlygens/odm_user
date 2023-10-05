import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ondamenu/constants.dart';
import 'package:ondamenu/screens/home_page.dart';
import 'package:ondamenu/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  // static final posDbOpt = new FirebaseOptions(apiKey: "AIzaSyBQWjeIjGY_9B1m6JhT7Tkt2AtvRtiW8mk", appId: "1:1024532317222:android:c8cd7594f341f563e412e7",messagingSenderId: "ondamenu-pos", projectId: "ondamenu-pos");

  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // final Future<FirebaseApp> _initializationPOS = Firebase.initializeApp(name: "OnDaMenu-POS", options: posDbOpt);
  /*final Future<FirebaseApp> _initializePOS = Firebase.initializeApp(
    name: "OnDaMenu-POS",
    options: posDbOpt
  );
  Future<void> initializeSecondary() async {
    FirebaseApp app2 = await Firebase.initializeApp(
      name: "OnDaMenu-POS",
      options: posDbOpt,
    );
    print('initialized $app2');

  }*/
  // final FirebaseFirestore _firestore2 = FirebaseFirestore.instanceFor(app: Firebase.app('OnDaMenu-POS'));
  // LandingPage({Key? key}) : super(key: key);
  /*var posDbOpt = new FirebaseOptions(apiKey: "AIzaSyBQWjeIjGY_9B1m6JhT7Tkt2AtvRtiW8mk", appId: "1:1024532317222:android:c8cd7594f341f563e412e7",messagingSenderId: "ondamenu-pos", projectId: "ondamenu-pos");
  Future<void> initializeSecondary() async {
    FirebaseApp app2 = await Firebase.initializeApp(
      name: "OnDaMenu-POS",
      options: posDbOpt,
    );
    print('Initialized $app2');
  }*/

  // final lngth = Firebase.apps.length;

  @override
  Widget build(BuildContext context) {
    // initializeSecondary();
    // print('Initialized $_initializePOS');

    // print('app length: $lngth');
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
            // print('dUser: ${_initialization}');
            // print('dUser: $_user');
            print('User exists');
            return HomePage();
          }
        }

        return const Scaffold(
          body: Center(
            child: Text(
              "Initializing App.... ",
              style: Constants.regHeading,
            ),
          ),
        );
      },
    );

    /*return FutureBuilder(
        // future: _initialization,
        future: _initializationPOS,
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
                    // print('dUser: ${_initialization}');
                    // print('dUser: $_user');
                    print('User exists');
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
        });*/
  }
}
