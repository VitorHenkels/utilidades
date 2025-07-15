import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utilidades/services/auth_service.dart';
import 'package:utilidades/src/Model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  Future<List<ProductModel>> getAll(BuildContext context) async {
    final token = await _getToken();

    final Response = await http.get(
      Uri.parse('$baseUrl/produtos'),
      headers: {'Authorization:': 'Baerer $token'},
    );

    if (Response.statusCode == 401) {
      await AuthService().logout();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
      throw Exception("Usuário não autorizado");
    } else if (Response.statusCode == 200) {
      final List data = jsonDecode(Response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Erro ao buscar produtos");
    }
  }

  Future<void> create(ProductModel produto) async {
    final _token = await _getToken();
    await http.post(
      Uri.parse('$baseUrl/produtos'),
      headers: {
        'Authorization': 'Baerer $_token',
        'Content-Type': 'aplication/json',
      },
      body: jsonEncode(produto.toJson()),
    );
  }

  Future<void> update(ProductModel produto) async {
    final _token = await _getToken();

    await http.put(
      Uri.parse('$baseUrl/produtos/${produto.id}'),
      headers: {
        'Authorization': 'Baerer $_token',
        'Content-Type': 'aplication/json',
      },
      body: jsonEncode(produto.toJson()),
    );
  }

  Future<void> delete(int id) async {
    final _token = await _getToken();

    await http.delete(
      Uri.parse('$baseUrl/produto/$id'),
      headers: {'Authorization': 'Baerer $_token'},
    );
  }
}
