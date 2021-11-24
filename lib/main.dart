import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:g2sports/components/loading.dart';
import 'package:g2sports/pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: App()));
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
          return Container(child: Login());
          // return Container(width: 100, height: 100, color: Colors.green);
        }
        return Loading();
      },
    );
  }
}
