

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytown_itfest_2024/homepage.dart';
import 'package:mytown_itfest_2024/placesToVisit.dart';
import 'package:mytown_itfest_2024/events.dart';

void main() {
  runApp(const MyTown());
}

class MyTown extends StatelessWidget {
  const MyTown({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget page = HomePage();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTown',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: page,
      routes: {
        '/homepage': (context) => HomePage(),
        '/events': (context) => Events(),
        '/placesToVisit': (context) => PlacesToVisit(),
      }
    );
  }
 }
