import 'package:flutter/material.dart';
import 'package:utilidades/src/Model/menu_model.dart';
import 'package:utilidades/src/Views/about_view.dart';
import 'package:utilidades/src/Views/converter_view.dart';
import 'package:utilidades/src/Views/home_view.dart';
import 'package:utilidades/src/Views/perso_view.dart';
import 'package:utilidades/src/Views/produtos_list_page.dart';

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
  MenuModel(
    title: "Produtos",
    icon: Icons.production_quantity_limits,
    route: "/produtos",
    page: ProductListPage(),
  ),
  MenuModel(
    title: "Pessoas(sqlite)",
    icon: Icons.people,
    route: "/pessoas",
    page: PersoView(),
  ),
];
