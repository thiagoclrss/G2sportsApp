import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g2sports/ui/home_page.dart';

//import 'package:buscador_gifs/ui/gif_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
