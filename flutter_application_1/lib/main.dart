import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora Pro'),
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
  final TextEditingController _ctrlDisplay = TextEditingController(text: "0");
  double aux1 = 0;
  String operacion = "";
  bool nuevoNumero =
      true; // Para saber si debemos limpiar la pantalla al escribir

  void gestionarClick(String valor) {
    setState(() {
      if (valor == "AC") {
        _ctrlDisplay.text = "0";
        aux1 = 0;
        operacion = "";
      } else if (valor == "+" || valor == "-" || valor == "x" || valor == "/") {
        aux1 = double.parse(_ctrlDisplay.text);
        operacion = valor;
        nuevoNumero = true;
      } else if (valor == "=") {
        double aux2 = double.parse(_ctrlDisplay.text);
        double resultado = 0;

        if (operacion == "+") resultado = aux1 + aux2;
        if (operacion == "-") resultado = aux1 - aux2;
        if (operacion == "x") resultado = aux1 * aux2;
        if (operacion == "/") resultado = aux2 != 0 ? aux1 / aux2 : 0;

        _ctrlDisplay.text = resultado.toString().replaceAll(".0", "");
        operacion = "";
        nuevoNumero = true;
      } else {
        // Escribir números
        if (nuevoNumero || _ctrlDisplay.text == "0") {
          _ctrlDisplay.text = valor;
          nuevoNumero = false;
        } else {
          _ctrlDisplay.text += valor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red.shade100,
      ),
      body: Column(
        children: [
          // Pantalla de la calculadora
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: TextField(
              controller: _ctrlDisplay,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const Spacer(),
          // Filas de botones
          buildRow(["AC", "()", "%", "/"]),
          buildRow(["7", "8", "9", "x"]),
          buildRow(["4", "5", "6", "-"]),
          buildRow(["1", "2", "3", "+"]),
          buildRow(["+/-", "0", ".", "="]),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Función para crear filas rápidamente
  Widget buildRow(List<String> etiquetas) {
    return Row(
      children: etiquetas.map((label) {
        if (label == "x" ||
            label == "-" ||
            label == "+" ||
            label == "/" ||
            label == "=" ||
            label == "AC" ||
            label == "()" ||
            label == "%") {
          return Buttondark(numero: label, onClick: gestionarClick);
        } else {
          return Buttonlight(numero: label, onClick: gestionarClick);
        }
      }).toList(),
    );
  }
}
