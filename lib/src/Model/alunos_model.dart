class AlunosModel {
  String id;
  String nome;
  int idade;
  String turma;

  AlunosModel({
    required this.id,
    required this.idade,
    required this.nome,
    required this.turma,
  });

  factory AlunosModel.fromFireStore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return AlunosModel(
      id: documentId,
      idade: data['idade'] ?? '',
      nome: data['nome'] ?? '',
      turma: data['turma'] ?? '',
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'nome': nome,
      'idade' : idade,
      'turma' : turma
    };
  }
}
