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
        decoration: InputDecoration(hintText: 'Massa'));
    return txt;
  }
  componenteTxt2() {
    TextField txt = TextField(
        controller: txtN2Controller,
        decoration: const InputDecoration(hintText: 'Altura'));
    return txt;
  }
  componenteTxt3() {
    TextField txt = TextField(
        controller: txtN3Controller,
        decoration: InputDecoration(hintText: 'Nome'));
    return txt;
  }


  componenteLblResposta() {
    Text lblResposta = Text(resposta);
    return lblResposta;
  }
  CalcularimcBtn() {
    TextButton btn1 = TextButton(
      onPressed: () {
        double massa = double.parse(txtN1Controller.text);
        double altura = double.parse(txtN2Controller.text);
        String nome = txtN3Controller.text;

        double imc = calcIMC(massa, altura);

        setState(() {
          resposta = "Nome: [$nome] imc: [$imc]";
        });
      },
      child: const Text("Calcular retangulo"),
    );
    return btn1;
  }
  calcIMC(double massa, double altura){
    return massa/(altura*altura);
  }

  componenteFormulario() {
    return Center(
      child: Column(children: <Widget>[
      componenteTxt3(),
      componenteTxt(),
      componenteTxt2(),
      CalcularimcBtn(),
      componenteLblResposta(),
     ]));
  }
}
