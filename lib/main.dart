import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  _DicePage createState() => _DicePage();
}

class _DicePage extends State {
  var leftDice = 1;
  var rightDice = 1;
  void _RandomNumber() {
    setState(() {
      leftDice = Random.secure().nextInt(6) + 1;
      rightDice = Random.secure().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              child: Image.asset("images/dice$leftDice.png"),
              onPressed: () {
                _RandomNumber();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset(
                "images/dice$rightDice.png",
              ),
              onPressed: () {
                _RandomNumber();
              },
            ),
          ),
        ],
      ),
    ));
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
