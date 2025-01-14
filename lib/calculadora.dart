import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == "+" || valor == "-" || valor == "x" || valor == "÷") {
        num1 = double.parse(_output);
        operand = valor;
        _output = "0";
      } else if (valor == "=") {
        num2 = double.parse(_output);
        switch (operand) {
          case "+":
            _output = (num1 + num2).toString();
            break;
          case "-":
            _output = (num1 - num2).toString();
            break;
          case "x":
            _output = (num1 * num2).toString();
            break;
          case "÷":
            if (num2 == 0) {
              _output = "Error"; // Handle division by zero
            } else {
              _output = (num1 / num2).toString();
            }
            break;
        }
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (valor == "C") {
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else {
        if (_output == "0") {
          _output = valor;
        } else {
          _output += valor;
        }
      }
    });
  }

  Widget _botao(String valor) {
    return ElevatedButton(
      onPressed: () => _pressionarBotao(valor),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      child: Text(valor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Use Scaffold for proper layout
      appBar: AppBar(title: const Text('Calculadora')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _botao('7'),
                _botao('8'),
                _botao('9'),
                _botao('÷'),
                _botao('4'),
                _botao('5'),
                _botao('6'),
                _botao('x'),
                _botao('1'),
                _botao('2'),
                _botao('3'),
                _botao('-'),
                _botao('C'),
                _botao('0'),
                _botao('.'),
                _botao('+'),
                _botao('='),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

