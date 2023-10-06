import 'dart:math';
class Baskara{
  late int a;
  late int b;
  late int c;

  setA(int value){
    a = value;
  }
  setB(int value){
    b = value;
  }
  setC(int value){
    c = value;
  }

  CalcularRaizes(){
    int delta = b * b - 4 * a * c;

    if (delta > 0) {
      double raizDelta = sqrt(delta);
      double x1 = (-b + raizDelta) / (2 * a);
      double x2 = (-b - raizDelta) / (2 * a);
      return "Raízes: x1[$x1] e x2[$x2]";
    } else if (delta == 0) {
      double x = -b / (2 * a);
      return "Raíz: [$x]";
    } else {
      // Não há raízes reais
      return "Não tem raiz!";
    }
  }

}