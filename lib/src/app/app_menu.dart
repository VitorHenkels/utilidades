import 'package:flutter/material.dart';
import 'package:utilidades/src/Model/menu_model.dart';
import 'package:utilidades/src/Views/home_view.dart';

final List<MenuModel> appMenuItems = [
  MenuModel(title: "Home", icon: Icons.home, route: "/home", page: const HomeView())
];