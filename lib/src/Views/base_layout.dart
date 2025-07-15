import 'package:flutter/material.dart';
import 'package:utilidades/services/auth_service.dart';
import 'package:utilidades/widgets/custom_app_bar.dart';
import 'package:utilidades/widgets/custom_app_drawer.dart';

class BaseLayout extends StatefulWidget {
  final String title;
  final Widget body;
  const BaseLayout({super.key,required this.title,required this.body});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {

  @override 
  void initState(){
    AuthService().checkLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      drawer: CustomAppDrawer(),
      body: widget.body,
    );
  }
}