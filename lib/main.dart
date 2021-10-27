import 'package:flutter/material.dart';
import 'package:gbff/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
