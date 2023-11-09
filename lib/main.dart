import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.deepPurple,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;

  @override
  Widget build(BuildContext context) {
    String result = '';

    if (left > right) {
      result = 'Left die is higher';
    } else if (right > left) {
      result = 'Right die is higher';
    } else {
      result = 'Both dice are equal';
    }

    String parityResult = (left + right) % 2 == 0 ? 'Even' : 'Odd';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset('images/dice$right.png'),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'The Total roll is ${left + right}',
            style: const TextStyle(fontSize: 27.5),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 27.3),
          ),
          Text(
            'Sum is $parityResult',
            style: const TextStyle(fontSize: 27.4),
          ),
        ],
      ),
    );
  }

  void ChangeValue() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
    });
  }
}
