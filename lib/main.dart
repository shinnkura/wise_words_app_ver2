import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quote_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Color subduedOrange = const Color(0x88FFA500);

  ThemeData buildTheme(Brightness brightness) {
    return ThemeData(
      // primaryColor: subduedOrange,
      textTheme: GoogleFonts.newTegominTextTheme(),
      brightness: brightness,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WiseWords',
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: QuoteList(),
    );
  }
}
