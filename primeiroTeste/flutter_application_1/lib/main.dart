import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'teste do flutter', //titulo do app
      theme: ThemeData(
        // "flutter run"        
        // "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MInhaPaginaInicial(nomeApp: 'meu novo aplicativo teste'),
    );
  }
}

class MInhaPaginaInicial extends StatefulWidget {
  const MInhaPaginaInicial({super.key, required this.nomeApp});

  // home page of your application
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String nomeApp;

  @override
  State<MInhaPaginaInicial> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<MInhaPaginaInicial> {
  //int _counter = 0;
  final TextEditingController txtN1Controller = TextEditingController();
  final TextEditingController txtN2Controller = TextEditingController();
  String resposta = "";

  void dispose(){
    txtN1Controller.dispose();
    txtN2Controller.dispose();

    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.nomeApp),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: componenteTexto(),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=funcoes aquiiii -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  componenteTexto(){
    //const Text componente = Text("Ola mundo :)");
    //return componente;
    const TextField txtNome = TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.person),
            hintText: 'NOME DO CLIENTE'));
    return txtNome;
  }
  //===============
  componenteTxtNota1() {
    TextField txtNota1 = TextField(
        controller: txtN1Controller,
        decoration: InputDecoration(hintText: 'Nota 1'));
    return txtNota1;
  }
  //=======================
  componenteTxtNota2() {
    TextField txtNota2 = TextField(
        controller: txtN2Controller,
        decoration: const InputDecoration(hintText: 'Nota 2'));
    return txtNota2;
  }
  //===========================
  componenteLblResposta() {
    Text lblResposta = Text("Média: $resposta");
    return lblResposta;
  }
  //===================================
  componenteBtnCalcular() {
    TextButton btn1 = TextButton(
      onPressed: () {
        double x = double.parse(txtN1Controller.text);
        double y = double.parse(txtN2Controller.text);
        double r = calcularMedia(x,y);

        setState(() {
          resposta = r.toString();
        });
      },
      child: const Text("Calcular 1"),
    );
    return btn1;
  }
  //==============================
  double calcularMedia(double n1, double n2) {
    double x = n1;
    double y = n2;
    double r = (x + y) / 2;
    return r;
  }
  //===========================
  componenteFormulario() {
    return Center(
      child: Column(children: <Widget>[
      componenteTxtNota1(),
      componenteTxtNota2(),
      componenteBtnCalcular(),
      componenteLblResposta(),
     ]));
  }

}
