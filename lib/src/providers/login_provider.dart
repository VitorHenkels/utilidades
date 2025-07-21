import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utilidades/src/Controller/loginriverController.dart';
import 'package:utilidades/src/Model/loginState.dart';

final loginProvider =  StateNotifierProvider<Loginrivercontroller,Loginstate>((ref)=> Loginrivercontroller());