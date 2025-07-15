import 'package:flutter/material.dart';
import 'package:utilidades/src/Controller/product_controller.dart';
import 'package:utilidades/src/Model/product_model.dart';

class ProductForm extends StatefulWidget {
  final ProductModel? produto;
  final ProductController? controller;

  const ProductForm({super.key, this.produto, this.controller});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.produto != null) {
      _nomeController.text = widget.produto!.nome;
      _precoController.text = widget.produto!.preco.toString();
      _descricaoController.text = widget.produto!.descricao;
    }
  }

  void _salvar() async {
    final produto = ProductModel(
      id: widget.produto?.id,
      nome: _nomeController.text,
      preco:
          double.tryParse(
            _precoController.text
                .replaceAll(RegExp(r'[^\d,]'), '')
                .replaceAll(',', '.'),
          ) ?? 0.0,
      descricao: _descricaoController.text.trim(),
    );

    if (widget.produto==null) {
      await widget.controller.criarProduto(produto);
    }else{
      await widget.controller!.atualizarProduto(produto);
    }
  }
  /* 
  final produto = ProductModel(
    id: widget.produto?.id,
    nome: _nomeController.text.trim(),
    preco: _precoController.text.replaceAll(RegExp(r'[^/d]',''), '')
    .replaceAll(',', '')??0.0,
    descricao: _descricaoController.text.trim()
  ); */

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.produto == null ? "Novo Produto" : 'Editar Produto'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome dp produto"),
              validator: (v) => v!.isEmpty ? "informe o nome" : null,
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: "Descrição do produto",
              ),
              validator: (v) => v!.isEmpty ? "informe uma descricao" : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("cancelar"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("salvar")),
      ],
    );
  }
}
