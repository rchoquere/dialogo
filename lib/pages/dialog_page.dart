import 'package:dialogo/dialogs/confirm_dialog.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Show Info Dialog"),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => const MyDialog(),
              );
              // print("Hola");
            },
          ),
          ListTile(
            title: const Text("Show Confirm Dialog"),
            onTap: () async {
              final isOK = await showConfirmDialog(
                context,
                title: 'Are You Sure?',
              );
              print('OK = $isOK');
            },
          )
        ],
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Mi Primer Dialogo'),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
