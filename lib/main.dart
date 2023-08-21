import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_view.dart';
import 'package:flutter_app/views/register_view.dart';
import 'package:flutter_app/views/verify-email_view.dart';


void main() {
  runApp(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        ),
        home: const HomePage(),
        routes: {
          '/login/': (context) => const LoginView(),
          '/register/': (context) => const RegisterView(),
          '/verify/': (context) => const VerifyEmailView(),
        },
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
    return  FutureBuilder(
          builder: (context, snapshot) {
           return const NotesView();
          },
    );
  }
}

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) {

          }, itemBuilder: (context) {
            return [
            const PopupMenuItem<MenuAction>(value: MenuAction.logout, child: Text('Logout'),
            ),
            ];

          },)
        ],
      ),
      body: const Text('Hello World'),
    );
  }
}


