import 'package:utilidades/dartAvancado/future/login.dart';

class Loginstate {
  final String email;
  final String password;
  final bool isLoading;

  Loginstate({this.email = '', this.password = '', this.isLoading = false});

  Loginstate copyWith({
    String? email,
    String? password,
    bool isLoadin = false,
  }) {
    return Loginstate(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
