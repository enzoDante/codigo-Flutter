import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController txtN1Controller = TextEditingController();
  final TextEditingController txtN2Controller = TextEditingController();
  final TextEditingController txtN3Controller = TextEditingController();
  String resposta = "";

  void dispose(){
    txtN1Controller.dispose();
    txtN2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: componenteFormulario(),
      ),
      
    );
  }



  //=================================================
  componenteTxt() {
    TextField txt = TextField(
        controller: txtN1Controller,
        decoration: InputDecoration(hintText: 'Nota 1'));
    return txt;
  }
  componenteTxt2() {
    TextField txt = TextField(
        controller: txtN2Controller,
        decoration: const InputDecoration(hintText: 'Nota 2'));
    return txt;
  }
  componenteTxt3() {
    TextField txt = TextField(
        controller: txtN3Controller,
        decoration: InputDecoration(hintText: 'Nota 3'));
    return txt;
  }


  componenteLblResposta() {
    Text lblResposta = Text(resposta);
    return lblResposta;
  }
  CalcularBtn() {
    TextButton btn1 = TextButton(
      onPressed: () {
        double n1 = double.parse(txtN1Controller.text);
        double n2 = double.parse(txtN2Controller.text);
        double n3 = double.parse(txtN3Controller.text);

        double media = calcNota(n1, n2, n3);

        setState(() {
          resposta = "Média:[$media] -> "+ (media >= 7? "Aprovado" : "Reprovado");
        });
      },
      child: const Text("Calcular média"),
    );
    return btn1;
  }
  calcNota(double n1, double n2, double n3){
    return (n1+n2+n3)/3;
  }

  componenteFormulario() {
    return Center(
      child: Column(children: <Widget>[
      componenteTxt(),
      componenteTxt2(),
      componenteTxt3(),
      CalcularBtn(),
      componenteLblResposta(),
     ]));
  }
}
