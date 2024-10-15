import 'package:dialogo/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            // Navigator.popUntil(
            //   context,
            //   (route) {
            //     final name = route.settings.name;
            //     if (name == Routes.homeInicial) {
            //       return true;
            //     }
            //     print('${route.settings.name}');
            //     return false;
            //   },
            // );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeInicial,
              (route) => false,
            );
          },
          child: const Text("LOG OUT"),
        ),
      ),
    );
  }
}
