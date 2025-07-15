import 'package:flutter/widgets.dart';
import 'package:utilidades/src/Model/product_model.dart';
import 'package:utilidades/src/Model/services/product_services.dart';

class ProductController {
  final ProductService _service = ProductService();

  Future<List<ProductModel>> fetchProdutos(BuildContext context) =>
      _service.getAll(context);

  Future<void> criarProduto(ProductModel produto) => _service.create(produto);
  Future<void> atualizarProduto(ProductModel produto) =>
      _service.update(produto);
  Future<void> deleteProduto(int id) => _service.delete(id);
}
