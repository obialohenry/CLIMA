

import 'package:flutter/material.dart';
import 'Screens/Location_Screen.dart';
import 'Screens/Loading_Screen.dart';
import 'Screens/City_Screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        Loading_Screen.id: (context) => Loading_Screen(),
        Location_Screen.id: (context) => const Location_Screen(),
        City_Screen.id: (context) => const City_Screen(),
      },
      initialRoute: Loading_Screen.id,
    ),
  );
}