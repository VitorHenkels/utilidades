import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilidades/dartAvancado/future/login.dart';
import 'package:utilidades/dartAvancado/isolate/product_parse.dart';
import 'package:utilidades/dartAvancado/stream/busca_com_stream.dart';
import 'package:utilidades/src/Views/counter_cubit.dart';
import 'package:utilidades/src/app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //runApp(MaterialApp(home: Login(),));
  //runApp(MaterialApp(home: BuscaComStream(),));
  //runApp(MaterialApp(home: ProductParse(),));
  //runApp(AppWidget());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( AppWidget());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: BlocProvider(create: (_) => CounterCubit()));
  }
}

/**
 * riverpod - é uma biblioteca de gerenciamento de estado desenvolvida por Remi Rousslet(criador provider) .
 * ele foi criado para corrigir limitações do provider e oferecer uma abordagem mais robusca,segura e flxível.
 * 
 * vantagens
 * -seguro em tempo de compilação: detecta erros mais cedo
 * - não depende de BuildContext
 * -trstável e modular
 * -suporte nativdo para providers assíncronos, como FuturProvider e StreamProvider
 * -----------------------------------------------
 * 
 * BLoC - Business Logic Component
 * é um padrão de arquitetura que separa a lógica de negócios da interface de usuários usando streams.
 * Ele foi criado pelo google para facilitar o recuso da lógica em vários widgets
 * 
 * vantagens
 * - muito usado em apps corporativos
 * -força uma arquitetura bem definida
 * -baseado em Streams(fluxo de dados)
 * 
 * conceitos principais
 * - event: entrada privada pelo usuário
 * -state: saída do bloco
 * -bloc: recebe eventos e emite estados
 * 
 * para usar precisamos instalar o pacote flutter_bloc
 * 
 * bloc + cubit
 * 
 * cubit é uma versão mais simples e direta do bloc, sem eventos, voce apenas chama métodos e emite estados
 * 
 */
