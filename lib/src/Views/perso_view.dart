import 'package:flutter/material.dart';
import 'package:utilidades/src/Controller/person_controller.dart';

class PersoView extends StatefulWidget {
  const PersoView({super.key});

  @override
  State<PersoView> createState() => _PersoViewState();
}

class _PersoViewState extends State<PersoView> {
  final controller = PersonController();
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: "Nome"),
          ),
          TextField(
            controller: idadeController,
            decoration: const InputDecoration(labelText: "Idade"),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final nome = nomeController.text.trim();
              final idade = int.tryParse(idadeController.text.trim()) ?? 0;
              if (nome.isNotEmpty && idade > 0) {
                controller.addPerson(nome, idade);
                nomeController.clear();
                idadeController.clear();
              }
            },
            child: Text("Cadastrar"),
          ),
        ],
      ),
    );
  }
}
