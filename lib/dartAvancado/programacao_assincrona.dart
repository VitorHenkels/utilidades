/**
 * programação assincrona é um modelo de programação onde as operações que podem levar tempo para serem concluídas (como chamadas de rede, leitura de arquivos ou espera por eventos) são executadas sem bloequear o fluxo principal do programa.
 * 
 * CONCEITO TÉCNICO
 * Em vez de esperar uma tarefa demorada terminar antes de continuar, a programação assincrona registra um callback (função de retorno) ou usa estruturas como future ,Stream, async/await para deletar a tarefa e contimuar executando o restante do código. Quando a tarefa termina, o resulado é entregue automaticamente.
 * 
 * No Dart
 * Future(T) =>  representa uma operação assíncrona que eventualmente retorna um valor do Tipo T
 * 
 * async w await =>  permitem escrever código assíncrono como se fosse síncrono
 * 
 * Stream<T> representa uma sequencia assíncrona de valores (ex: eventos, dados em série)
 */

void main(List<String> args) {
  imprimeNumeros();
}

void imprimeNumeros() async {
  numero1();
  await numero2(); //aguarde o resultado da função
  numero3();
}

void numero1() {
  print("Numero 1");
}

Future<void> numero2() {
  return Future.delayed(Duration(seconds: 3), () {
    print("Numero 2");
  });
}

void numero3() {
  print("Numero 3");
}
