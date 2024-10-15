import 'package:dialogo/pages/profile_page.dart';
import 'package:dialogo/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.email,
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                  settings: const RouteSettings(name: Routes.profile),
                );
                Navigator.push(context, route);
              },
              child: Text('LOGIN PAGE $email'),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  height: 70,
                  color: Colors.primaries[index],
                ),
                itemCount: Colors.primaries.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute {
  const SecondRoute();
}
