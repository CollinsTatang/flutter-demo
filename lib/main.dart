import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
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
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if(shouldLogout) {
                  Navigator.of(context).pushNamedAndRemoveUntil('/login/', (_) => false,
                  );
                }
                break;
            }
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
Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text('Are you sure you want to sign out'),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop(false);
            }, child: const Text('Cancel'),),
            TextButton(onPressed: () {
              Navigator.of(context).pop(true);
            }, child: const Text('Log out'),),
          ],
        );
      },
  ).then((value) => value ?? false);
}


