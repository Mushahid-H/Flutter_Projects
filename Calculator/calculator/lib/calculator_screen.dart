// import 'dart:ffi';
// import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

class Calculator_Screen extends StatefulWidget {
  const Calculator_Screen({super.key});

  @override
  State<Calculator_Screen> createState() => _Calculator_ScreenState();
}

class _Calculator_ScreenState extends State<Calculator_Screen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  double performCalulation(String text) {
    text = text.replaceAll(' ', '');

    for (int i = 0; i < text.length; i++) {
      if (isOperator(text[i])) {
        double operand1 = double.parse(text.substring(0, i));
        double operand2 = double.parse(text.substring(i + 1));
        String operator = text[i];

        switch (operator) {
          case '+':
            return operand1 + operand2;
          case '-':
            return operand1 - operand2;
          case '*':
            return operand1 * operand2;
          case '/':
            if (operand2 == 0) {
              throw ArgumentError("Cannot divide by zero.");
            }
            return operand1 / operand2;
          default:
            throw ArgumentError('Invalid operator: $operator');
        }
      }
    }

    throw ArgumentError('Invalid text: $text');
  }

  bool isOperator(String character) {
    return ['+', '-', '*', '/'].contains(character);
  }

  Widget Button(title, color) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => {
                  if (title == 'AC')
                    {
                      _controller.text = '',
                      _controller2.text = '',
                    }
                  else if (title == 'DEL')
                    {
                      _controller.text = _controller.text
                          .substring(0, _controller.text.length - 1)
                    }
                  else if (title == '=')
                    {
                      _controller2.text =
                          performCalulation(_controller.text).toString()
                    }
                  else
                    {
                      _controller.text += title,
                    }
                },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                        controller: _controller,
                        textAlign: TextAlign.right,
                        readOnly: true,
                        style:
                            const TextStyle(fontSize: 60, color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controller2,
                      textAlign: TextAlign.right,
                      readOnly: true,
                      style: const TextStyle(fontSize: 60, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button('AC', Colors.grey),
                        Button('+/-', Colors.grey),
                        Button('%', Colors.grey),
                        Button('/', Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button('7', Colors.grey),
                        Button('8', Colors.grey),
                        Button('9', Colors.grey),
                        Button('*', Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button('4', Colors.grey),
                        Button('5', Colors.grey),
                        Button('6', Colors.grey),
                        Button('-', Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button('1', Colors.grey),
                        Button('2', Colors.grey),
                        Button('3', Colors.grey),
                        Button('+', Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button('0', Colors.grey),
                        Button('.', Colors.grey),
                        Button('DEL', Colors.grey),
                        Button('=', Colors.orange),
                      ],
                    )
                  ],
                ),
              )),
            )))); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
