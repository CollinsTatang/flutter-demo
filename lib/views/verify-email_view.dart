import 'package:flutter/material.dart' show AppBar, BuildContext, Column, Navigator, Scaffold, State, StatefulWidget, Text, TextButton, Widget;

import '../constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Verify email'),
    ),
    body: Column(children: [
          const Text('Please verify your email'),
          TextButton(onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(notesRoute, (route) => false,);
          }, child: const Text('Send email verification'),)
        ],
    ),
    );
  }
}