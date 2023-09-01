import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import '../../main.dart';

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notes'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(newNoteRoute);
          },
              icon: const Icon(Icons.add)
          ),
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if(shouldLogout) {
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false,
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
      body: const Text('Waiting for all note view!'),
    );
  }
}