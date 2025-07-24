import 'package:flutter/material.dart';
import 'package:utilidades/src/Controller/usuario_cotroller.dart';

class FirebaseRegisterView extends StatefulWidget {
  const FirebaseRegisterView({super.key});

  @override
  State<FirebaseRegisterView> createState() => _FirebaseRegisterViewState();
}

class _FirebaseRegisterViewState extends State<FirebaseRegisterView> {
  bool _loading = false;
  String? _erro;
  final _formkey = GlobalKey<FormState>();

  final UsuarioCotroller _controller = UsuarioCotroller();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _cadastrar() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _loading = true;
        _erro = null;
      });

      final usuario = await _controller.cadastrar(
        _nomeController.text,
        _emailController.text,
        _senhaController.text,
      );

      setState(() {
        _loading = false;
      });

      if (usuario != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Usuário cadastrado com sucesso!")),
        );
        Navigator.pop(context);
      } else {
        setState(() {
          _erro = "Erro ao cadastrar usuário";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro firebase')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_erro != null) ...[
                Text(_erro!, style: const TextStyle(color: Colors.red)),
                SizedBox(height: 20),
              ],
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe seu nome' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Informe seu e-mail'
                    : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Senha' : null,
              ),
              const SizedBox(height: 20),
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _cadastrar,
                      child: Text("Cadastrar"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
