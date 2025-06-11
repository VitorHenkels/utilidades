import 'package:flutter/material.dart';
import 'package:utilidades/dartAvancado/future.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _status = "aguardando...";
  bool _carregando = false;

  //sempre que trabalhar com tarefas assincronas no flutter use initState

  @override
  void initState() {
    super.initState();
  }

  //simulação do login
  Future<bool> autenticar(String usuario, String senha) async {
    await Future.delayed(Duration(seconds: 2));
    return usuario == 'admin' && senha == 'admin';
  }

  _fazerLogin() async {
    setState(() {
      _carregando = true;
      _status = "processando...";
    });

    bool sucesso = await autenticar('admin', 'admin');

    setState(() {
      _carregando = false;
      _status = sucesso ? "login com sucesso" : "falha no login";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login com future")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_carregando) CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(_status, style: TextStyle(fontSize: 18)),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _carregando ? null : _fazerLogin,
              child: Text("Simular Login"),
            ),
          ],
        ),
      ),
    );
  }
}
