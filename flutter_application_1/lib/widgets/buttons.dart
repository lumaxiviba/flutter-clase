import 'package:flutter/material.dart';

class Buttonlight extends StatelessWidget {
  final String numero;
  final void Function(String) onClick;

  const Buttonlight({super.key, required this.numero, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onClick(numero),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 81, 223, 255),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            numero,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Buttondark extends StatelessWidget {
  final String numero;
  final void Function(String) onClick;

  const Buttondark({super.key, required this.numero, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onClick(numero),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 139, 141, 142),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            numero,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
