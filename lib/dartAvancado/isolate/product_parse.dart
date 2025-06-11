import 'dart:convert';

import 'package:flutter/material.dart';

class ProductParse extends StatefulWidget {
  const ProductParse({super.key});

  @override
  State<ProductParse> createState() => _ProductParseState();
}

class _ProductParseState extends State<ProductParse> {
  late Future<List<dynamic>> _items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = loadJson();
  }

  //ler os dados do json
  Future<List<dynamic>> loadJson() async {
    final jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/data.json");
    final parsed = jsonDecode(jsonString);
    return parsed['items'] as List<dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("parse de produtos")),
      body: FutureBuilder<List<dynamic>>(
        future: _items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }
          else{
            final products = snapshot.data!;
            return ListView.builder(padding: EdgeInsets.all(8),
            itemCount: products.length, 
            itemBuilder: (context,index){
              final product = products[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                elevation: 2,
                child: ListTile(
                  title: Text(product['nome'],
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(product["categoria"]),
                  trailing: Text(
                    "R\$ ${product['preco'].toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.greenAccent,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              );
            },);
          }
        },
      ),
    );
  }
}
