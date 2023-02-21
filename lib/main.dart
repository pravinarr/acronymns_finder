import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blocs/search/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acronym Search',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: GoogleFonts.abhayaLibre().fontFamily,
      ),
      home: const SearchPage(),
    );
  }
}
