import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utilidades/src/Controller/login_controller.dart';
import 'package:utilidades/src/Model/loginState.dart';

class Loginrivercontroller extends StateNotifier<Loginstate> {
  Loginrivercontroller() : super(Loginstate());

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void upatePassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> submitLogin() async {
    state = state.copyWith(isLoadin: true);

    await Future.delayed(Duration(seconds: 2));

    state = state.copyWith(isLoadin: false);

    if (state.email == 'bracellos@gmail.com' && state.password == '1234') {
      print('login ok');
    } else {
      print('login errado');
    }
  }
}
