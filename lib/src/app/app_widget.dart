import 'package:flutter/material.dart';
import 'package:utilidades/services/auth_service.dart';
import 'package:utilidades/src/Views/login_view.dart';
import 'package:utilidades/src/app/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Utilidades",
      initialRoute: "/home",
      routes: {
        "/login": (context) => LoginView(),
        ...generateRoutes()
      },

    );
  }
}