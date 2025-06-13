import 'package:chat_app/views/screens/home_screen.dart';
// import 'package:chat_app/views/screens/login_screen.dart';
import 'package:chat_app/provider/chat_provider.dart';
import 'package:chat_app/views/screens/login_screen.dart';
import 'package:chat_app/views/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData) {
            return UsersScreen(); // or ChatScreen(),
          } else {
            return LoginScreen();
          }
        },
      ),
      routes: {
        '/login': (_) => LoginScreen(),
        '/home': (_) => UsersScreen(),

      },
    );
  }
}
