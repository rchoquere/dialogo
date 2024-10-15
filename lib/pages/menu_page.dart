import 'package:dialogo/routes.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class PageData {
  final String name;
  final String label;
  final Object? arguments;
  final void Function(Object?)? onResult;

  PageData({
    required this.name,
    required this.label,
    this.arguments,
    this.onResult,
  });
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MaterialColor _color = Colors.red;

  late final List<PageData> _pages;

  // void _onTap(BuildContext context) {
  //   final faker = Faker();
  //   final name = faker.internet.email();
  //   final route = MaterialPageRoute(
  //     builder: (_) => LoginPage(
  //       email: name,
  //     ),
  //     settings: const RouteSettings(name: Routes.login),
  //   );
  //   Navigator.push(context, route);
  // }
  @override
  void initState() {
    super.initState();
    _pages = <PageData>[
      PageData(
        name: Routes.login,
        label: 'Go To Login',
        arguments: 'eder@gmail.com',
      ),
      PageData(
        name: Routes.counter,
        label: 'Go To Counte',
      ),
      PageData(
        name: Routes.colorPicker,
        label: 'Go To Color Picker',
        onResult: (result) {
          if (result != null) {
            _color = result as MaterialColor;
            setState(() {});
          }
        },
      ),
      PageData(
        name: Routes.dialogs,
        label: 'Go To Dialog',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          final data = _pages[index];
          return ListTile(
            title: Text(data.label),
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                data.name,
                arguments: data.arguments,
              );
              if (data.onResult != null) {
                data.onResult!(result);
              }
            },
          );
        },
        itemCount: _pages.length,
      ),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       onTap: () => _onTap(context),
      //       title: const Text(
      //         "Ir a LOGIN",
      //       ),
      //       trailing: const Icon(
      //         Icons.arrow_right_alt_outlined,
      //       ),
      //     ),
      //     ListTile(
      //       onTap: () {
      //         Navigator.pushNamed(
      //           context,
      //           Routes.counter,
      //         );
      //       },
      //       title: const Text(
      //         "Ir a COUNTER",
      //       ),
      //       trailing: const Icon(
      //         Icons.arrow_right_alt_outlined,
      //       ),
      //     ),
      //     ListTile(
      //       onTap: () async {
      //         // Navigator.pushNamed(
      //         //   context,
      //         //   Routes.colorPicker,
      //         // );
      //         final route = MaterialPageRoute<MaterialColor>(
      //           builder: (_) => const ColorPicker(),
      //         );
      //         final result = await Navigator.push(
      //           context,
      //           route,
      //         );
      //         // print(result);
      //         if (result != null) {
      //           _color = result;
      //           setState(() {});
      //         }
      //       },
      //       title: const Text(
      //         "Ir a COLOR PICKER",
      //       ),
      //       trailing: const Icon(
      //         Icons.arrow_right_alt_outlined,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
