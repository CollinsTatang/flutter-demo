import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        ),
        home: const HomePage(),
      ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Propelond'),
        ),
      body: FutureBuilder(
          /*future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlaform
          ),*/
        builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
              return const Text('Done');
              default:
                return const Text('waiting');
            }
        }
      ),
    );
  }
}

