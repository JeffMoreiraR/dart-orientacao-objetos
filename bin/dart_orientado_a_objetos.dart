void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String corFruta = "Verde e Amarela";
  String sabor = "Doce e citrica";
  int diasDesdeColheita = 20;
  bool  isMadura = (funcEstaMadura(diasDesdeColheita));

  funcMostrarMadura(nome, diasDesdeColheita, cor: "Amarela");
  int quantosDias = funcQuantosDiasMadura(diasDesdeColheita);
  print("Faltam $quantosDias para ficar madura.");
}


int funcQuantosDiasMadura(int dias){
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}


void funcMostrarMadura(String nomeFruta, int dias, {required String cor}){
  if(dias >= 30){
    print("A $nomeFruta está madura!");
  }else{
    print("A $nomeFruta não está madura!");
  }

  if(cor != null){
    print("A $nomeFruta é $cor");
  }
}

  

bool funcEstaMadura(int dias){
  if(dias >= 30){
    return true;
  }else{
    return false;
  }
}