import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'package:g2sports/components/loading.dart';
import 'package:g2sports/pages/Login/index.dart';
import 'package:loader_overlay/loader_overlay.dart';

//import 'package:buscador_gifs/ui/gif_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(
    MaterialApp(
      home: App(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(width: 100, height: 100, color: Colors.red);
        } else if (snapshot.connectionState == ConnectionState.done) {
          return LoaderOverlay(
            child: Login(),
            overlayOpacity: 0.7,
            overlayColor: Colors.black,
            disableBackButton: true,
          );
          // return Container(width: 100, height: 100, color: Colors.green);
        }
        return Loading();
      },
    );
  }
}
