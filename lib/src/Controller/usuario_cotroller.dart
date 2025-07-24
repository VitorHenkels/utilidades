import 'package:utilidades/src/Model/services/auth_firebase_service.dart';
import 'package:utilidades/src/Model/usuario_model.dart';

class UsuarioCotroller {
  final AuthFirebaseService _authService = AuthFirebaseService();

  Future<UsuarioModel?> cadastrar(String nome, String email, String senha) {
    return _authService.registrarUsuario(nome, email, senha);
  }

  Future<UsuarioModel?> autenticar(String email, String senha) {
    return _authService.login(email, senha);
  }
}
