import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Something went wrong in Flutter Fire');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: WelcomeScreen.routeName,
            routes: {
              WelcomeScreen.routeName: (context) => WelcomeScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegistrationScreen.routeName: (context) => RegistrationScreen(),
              ChatScreen.routeName: (context) => ChatScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepPurpleAccent,
            ),
          ),
        );
      },
    );
  }
}
