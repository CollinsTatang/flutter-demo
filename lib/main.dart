import 'package:flutter/material.dart';
import 'package:flutter_app/constants/routes.dart';
import 'package:flutter_app/views/login_view.dart';
import 'package:flutter_app/views/notes/new_note_view.dart';
import 'package:flutter_app/views/notes/note_view.dart';
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
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          verifyRoute: (context) => const VerifyEmailView(),
          notesRoute: (context) => const NotesView(),
          newNoteRoute: (context) => const NewNoteView(),
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


