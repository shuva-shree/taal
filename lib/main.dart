import 'package:flutter/material.dart';
import 'package:taal/screens/home_screen.dart';
import 'package:taal/screens/main_screen.dart';
import 'package:taal/screens/music_player_screen.dart';
import 'package:taal/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Color[],
          primaryColor: Colors.purple,
          accentColor: Colors.deepPurpleAccent),
      home: Musicplayer(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
      },
    );
  }
}
