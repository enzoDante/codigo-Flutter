import 'package:flutter/material.dart';
import 'Retangulo.dart';
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
  //============================================================
  componenteTxt() {
    TextField txt = TextField(
        controller: txtN1Controller,
        decoration: InputDecoration(hintText: 'Base'));
    return txt;
  }
  componenteTxt2() {
    TextField txt = TextField(
        controller: txtN2Controller,
        decoration: const InputDecoration(hintText: 'Altura'));
    return txt;
  }


  componenteLblResposta() {
    Text lblResposta = Text(resposta);
    return lblResposta;
  }
  componenteBtnRetangulo() {
    TextButton btn1 = TextButton(
      onPressed: () {
        double base = double.parse(txtN1Controller.text);
        double altura = double.parse(txtN2Controller.text);

        Retangulo ret = new Retangulo();
        ret.altura = altura;
        ret.base = base;

        String area = ret.area().toString();
        String perimetro = ret.perimetro().toString();
        String diagonal = ret.diagonal().toString();

        setState(() {
          resposta = "Área: [$area]  Perímetro: [$perimetro]  Diagonal: [$diagonal]";
        });
      },
      child: const Text("Calcular retangulo"),
    );
    return btn1;
  }

  componenteFormulario() {
    return Center(
      child: Column(children: <Widget>[
      componenteTxt(),
      componenteTxt2(),
      componenteBtnRetangulo(),
      componenteLblResposta(),
     ]));
  }
}
