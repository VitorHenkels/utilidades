import 'package:flutter/material.dart';
import 'package:utilidades/src/Model/menu_model.dart';
import 'package:utilidades/src/Views/about_view.dart';
import 'package:utilidades/src/Views/converter_view.dart';
import 'package:utilidades/src/Views/home_view.dart';

final List<MenuModel> appMenuItems = [
  MenuModel(
    title: "Home",
    icon: Icons.home,
    route: "/home",
    page: const HomeView(),
  ),
  MenuModel(
    title: "Sobre mim",
    icon: Icons.person_sharp,
    route: "/about",
    page: AboutView(),
  ),
  MenuModel(
    title: "Conversor de medidas",
    icon: Icons.design_services,
    route: "/convertermedidas",
    page: ConverterView(),
  ),
];
