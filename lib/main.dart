import 'package:flutter/material.dart';
import 'package:wise_words_app_ver2/quote_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WiseWords',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: QuoteList(),
    );
  }
}
