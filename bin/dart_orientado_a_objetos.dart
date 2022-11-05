void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e citrica";
  int diasDesdeColheita = 20;
  bool isMadura;

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }

  Legumes mandioca1 = Legumes("Mandioca", 10.2, "Marrom", true);
  Fruta banana1 = Fruta("Banana", 40, "Amarela", "Doce", 20);
  Nozes macadamia1 = Nozes("Macadâmia", 2, "Branco Amarelado", "Doce", 15, 30);
  Citricas limao1 = Citricas("Limão", 150, "Verde", "Azedo", 6, 9);

  mandioca1.printAlimento();
  banana1.printAlimento();
  macadamia1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();
  banana1.fazerSuco();
  macadamia1.fazerSuco();
  limao1.fazerSuco();
  macadamia1.fazerMassa();
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

void funcMostrarMadura(String nomeFruta, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nomeFruta está madura!");
  } else {
    print("A $nomeFruta não está madura!");
  }

  if (cor != null) {
    print("A $nomeFruta é $cor");
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este(a) $nome pesa $peso gramas e é $cor");
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print('"A sua $nome ela foi colhida a $diasDesdeColheita dias, \n'
        'E precisa de $diasParaMadura para poder comer. \n'
        'Ela está madura? $isMadura."');
  }

  void fazerSuco() {
    print("Você fez um ótimo suco de $nome");
  }

  @override
  void assar() {
    print("Levar a massa ao forno");
  }

  @override
  void fazerMassa() {
    print("Misturar a fruta com ovos, leite, etc...");
  }

  @override
  void separarIngredientes() {
    print("Separar os ilimentes");
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print("O $nome está cozinhando!");
    } else {
      print("O $nome já está cozido!");
    }
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }

  @override
  void assar() {
    // TODO: implement assar
  }
}

class Citricas extends Fruta {
  double nivelAzeda;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzeda)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefrigerante(bool existe) {
    if (existe) {
      print("Existe Refrigerante de $nome");
    } else {
      print("Não existe Refrigerante de $nome");
    }
  }
}

class Nozes extends Fruta {
  double porcentagemDeOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemDeOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);
  @override
  void fazerMassa() {
    print("Tirar a casca");
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}
