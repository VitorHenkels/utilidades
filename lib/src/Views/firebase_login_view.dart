import 'package:flutter/material.dart';
import 'package:utilidades/src/Controller/usuario_cotroller.dart';
import 'package:utilidades/src/Views/firebase_register_view.dart';

class FirebaseLoginView extends StatefulWidget {
  const FirebaseLoginView({super.key});

  @override
  State<FirebaseLoginView> createState() => _FirebaseLoginViewState();
}

class _FirebaseLoginViewState extends State<FirebaseLoginView> {
  bool _loading = false;
  final UsuarioCotroller _cotroller = UsuarioCotroller();
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String? _erro;

  void _abrirCadasstro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FirebaseRegisterView()),
    );
  }

  void _login() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _loading = true;
        _erro = null;
      });
      final usuario = await _cotroller.autenticar(
        _emailController.text,
        _senhaController.text,
      );

      if (usuario != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login realizado com sucesso.")),
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _erro = "E-mail ou senha incorreto";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login com firebase")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              if (_erro != null) ...[
                Text(_erro!, style: TextStyle(color: Colors.redAccent)),
              ],
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o e-mail" : null,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: "senha"),
                obscureText: true,
                validator: (value) =>
                    value == null || value.length < 6 ? "senha inválida" : null,
              ),
              SizedBox(height: 20),
              //botão ou loading
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(onPressed: _login, child: Text("Entrar")),
              TextButton(
                onPressed: _abrirCadasstro,
                child: Text("Não tem conta? Cadastre-se."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
