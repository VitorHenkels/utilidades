import 'package:flutter/material.dart';
import 'package:utilidades/services/auth_service.dart';
import 'package:utilidades/src/Views/firebase_login_view.dart';
import 'package:utilidades/src/Views/login_view.dart';
import 'package:utilidades/src/app/app_menu.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.blueAccent),
            height:130,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 30),
              child: Center(
                child: Image.asset("assets/imagens/logo.png",width: 150,),
              ),
            ),
          ),
          ...appMenuItems.map(
            (item) => ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () {
                Navigator.pushReplacementNamed(context, item.route);
              },
            ) ,),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text("LogOut"),
              onTap: () {
                AuthService().logout();
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (_) => FirebaseLoginView()),
                  (route) => false
                  );
              },
            )
        ],
      ),
    );
  }
}