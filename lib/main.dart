import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:g2sports/components/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
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
          print("has error");
          return Container(width: 100, height: 100, color: Colors.red);
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("concluído");
          return Container(width: 100, height: 100, color: Colors.green);
        }
        return Loading();
      },
    );
  }
}
