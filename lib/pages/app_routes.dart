import 'package:dialogo/pages/color_picker.dart';
import 'package:dialogo/pages/counter_page.dart';
import 'package:dialogo/pages/dialog_page.dart';
import 'package:dialogo/pages/login_page.dart';
import 'package:dialogo/pages/menu_page.dart';
import 'package:dialogo/pages/profile_page.dart';
import 'package:dialogo/pages/splash_page.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

T getArguments<T>(BuildContext context) {
  // metodo generico para devolver un valor
  return ModalRoute.of(context)!.settings.arguments as T;
}

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.homeInicial: (context) => const MenuPage(),
    Routes.login: (contex) {
      final email = getArguments<String>(contex);
      return LoginPage(
        email: email,
      );
    },
    Routes.counter: (context) => const CounterPage(),
    Routes.profile: (context) => const ProfilePage(),
    Routes.splash: (context) => const SplashPage(),
    Routes.colorPicker: (context) => const ColorPicker(),
    Routes.dialogs: (_) => const DialogPage(),
  };
}
