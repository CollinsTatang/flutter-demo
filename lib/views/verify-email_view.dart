import 'package:flutter/material.dart' show BuildContext, Column, State, StatefulWidget, Text, TextButton, Widget;

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {


  @override
  Widget build(BuildContext context) {
    return Column(children: [
          const Text('Please verify your email'),
          TextButton(onPressed: () {}, child: const Text('Send email verification'),)
        ],
    );
  }
}