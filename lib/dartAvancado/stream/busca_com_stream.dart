import 'dart:async';

import 'package:flutter/material.dart';

class BuscaComStream extends StatefulWidget {
  const BuscaComStream({super.key});

  @override
  State<BuscaComStream> createState() => _BuscaComStreamState();
}

class _BuscaComStreamState extends State<BuscaComStream> {
  final _controllerBusca = StreamController();
  final List<String> _itens = [
    "maçã",
    "banana",
    "melancia",
    "tangerina",
    "manga",
    "abacaxi",
    "romã",
    "limão",
    "poncã",
    "uva",
    "Laranja"

  ];

  List<String> _filtrar(String termo){
    return _itens.where((item)=> item.toLowerCase().contains(termo.toLowerCase())
    ).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buscar produtos (stream)")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "buscar fruta"),
              onChanged: (texto) {
                _controllerBusca.add(texto);
              },
            ),
            SizedBox(height: 20),
            StreamBuilder<dynamic>(stream: _controllerBusca.stream, builder: (context,snapshot){
              final listaFiltrada= _filtrar(snapshot.data?? '');
              return Expanded(
                child: ListView.builder(
                  itemCount: listaFiltrada.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(listaFiltrada[index]),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
