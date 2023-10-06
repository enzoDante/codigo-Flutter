import 'package:flutter/material.dart';
import 'Baskara.dart';
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
        decoration: InputDecoration(hintText: 'valor de a'));
    return txt;
  }
  componenteTxt2() {
    TextField txt = TextField(
        controller: txtN2Controller,
        decoration: const InputDecoration(hintText: 'valor de b'));
    return txt;
  }
  componenteTxt3() {
    TextField txt = TextField(
        controller: txtN3Controller,
        decoration: InputDecoration(hintText: 'valor de c'));
    return txt;
  }


  componenteLblResposta() {
    Text lblResposta = Text(resposta);
    return lblResposta;
  }
  CalcularBtn() {
    TextButton btn1 = TextButton(
      onPressed: () {
        int n1 = int.parse(txtN1Controller.text);
        int n2 = int.parse(txtN2Controller.text);
        int n3 = int.parse(txtN3Controller.text);

        Baskara b = new Baskara();
        b.setA(n1);
        b.setB(n2);
        b.setC(n3);
        String raizes = b.CalcularRaizes();

        setState(() {
          resposta = raizes;
        });
      },
      child: const Text("Calcular baskara"),
    );
    return btn1;
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
