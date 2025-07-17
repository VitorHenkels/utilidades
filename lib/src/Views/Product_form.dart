

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:utilidades/src/Controller/product_controller.dart';
import 'package:utilidades/src/Model/product_model.dart';

class ProductForm extends StatefulWidget {
  final ProductModel? produto;
  final ProductController controller;

  const ProductForm({super.key, this.produto, required this.controller});
  
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
    super.initState();
    if(widget.produto != null){
      _nomeController.text = widget.produto!.nome;
      _precoController.text = widget.produto!.preco.toString();
      _descricaoController.text = widget.produto!.descricao;

    }
  }

  void _salvar() async{
    final produto = ProductModel(
      id: widget.produto?.id,
      nome: _nomeController.text, 
      preco: double.tryParse(_precoController.text.replaceAll(RegExp(r'[^\d]'),'').replaceAll(',', '.')) ?? 0.0, 
      descricao: _descricaoController.text.trim(),
      );

    if(widget.produto == null){
      await widget.controller.criarProduto(produto);
    } else {
      await widget.controller.atualizarProduto(produto);
    }

    if(context.mounted){
      Navigator.pop(context,true);
    }
  }

  
  /* final produto = ProductModel(
    id: widget.produto?.id,
    nome: _nomeController.text.trim(), 
    preco: _precoController.text.replaceAll(RegExp(r'[^\d,]'), '')
      .replaceAll((',','')?? 0.0); 
    
    ); */
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.produto == null ? "Novo produto" : 'Editar Produto'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome do Produto"),
              validator: (v) => v!.isEmpty ? "Informe o nome" : null,
            ),
            TextFormField(
              controller: _precoController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                CurrencyInputFormatter(
                  leadingSymbol: "R\$",
                  useSymbolPadding: true,
                  thousandSeparator: ThousandSeparator.Period,
                  mantissaLength: 2,
                )
              ],
              decoration: const InputDecoration(labelText: "Preço do produto"),
              validator: (v) => v!.isEmpty ? "Informe o preço do produto" : null,
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: "Descrição do produto"),
              validator: (v) => v!.isEmpty ? "Informe uma descrição" : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
        ElevatedButton(onPressed: _salvar, child: Text('Salvar'))
      ],
    );
  }
}