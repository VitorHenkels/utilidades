/**
 * uma stream representa uma fonte de eventos/usados que ocorrem ao longo do tempo
 * QUANDO USAR
 * quando voce precisa escutar atualizações contínuas
 * - ex: GPS , mensagens de chat, digitação em tempo real, eventos de usuário
 * 
 * CARACTERÍSTICAS
 * - pode emitir valores com yield
 * - pode durar indefinidamente
 * - pode ser usada com listen ou await for
 * - podemos usar async* para declarar funções assíncronas que retornam uma stream
 */

//exemplo 1 - contador de tempo
/* Stream<int> contarTempo() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; //yield serve como emissor. ele emite a nova informação para a stream, como se fosse um return. Poré sem finalizar a função.
  }
}

//exemplo 2 - simulação de chat
Stream<String> mensagemChat()async*{
  yield 'oi';
  await Future.delayed(Duration(seconds: 1));
  yield "tudo  bem ?";
  await Future.delayed(Duration(seconds: 1));
  yield "sim e vc?";
  await Future.delayed(Duration(seconds: 1));
  yield "que bom!";
  await Future.delayed(Duration(seconds: 1));
  yield "adeus";
}

void main(List<String> args) {
 /*  contarTempo().listen(
    (event) => print("contagem: $event"),
    onDone: () => print("stream finalizada"),
  ); */

  mensagemChat().listen(
    (mensagem)=> print(mensagem),
    onDone: () => print("fim  do chat.")
  );
} */


//exemplos com controle de erro try catch
Stream<int> contarTempo() async*{
  try {
    for (var i = 0; i < 10; i++) {
      await  Future.delayed(Duration(seconds: 1));
      if (i==3) {
        throw Exception("erro ao contar");
      }
      yield i;
    }
  } catch (e) {
    print("Erro no contador de tempo: $e");
  }
}

void main(List<String> args) {
  contarTempo().listen(
    (event)=>print("Número: $event"),
    onError: (erro) => print(erro),
    onDone: () => print("finalizado")
  );
}
