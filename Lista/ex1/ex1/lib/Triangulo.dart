import 'dart:math';
class Triangulo {
  late double _base;
  late double _altura;
  
  double area() {    
     return (_base*_altura)/2;  
  }
  double perimetro() {    
     return 2*_base + 2*_altura;  
  }
   double diagonal() {    
     return sqrt(_base*_base + _altura*_altura );  
  }
  double get altura {
    return _altura;
  }
  set altura(double altura){
      _altura = altura;
  }
  double get base {
    return _base;
  }
  set base(double base){
      _base = base;
  }

  Triangulo.parametros(this._base, this._altura);
  Triangulo.parametroSimples(double lado) {
    _base = lado;
    _altura = lado;
  }
  Triangulo() {
    _base = 0;
    _altura = 0;
  }
}
