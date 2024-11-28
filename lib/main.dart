import 'dart:math';

import 'package:flutter/material.dart';


// where app starts
void main() => runApp(MyApp());

// sets up the main structure of the app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(), // set to the calculator class
    );
  }
}

// stateful widget (meaning it can change over time)
class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _State();
}

class _State extends State<Calculator> {

  String displayExpression = '';
  String currentNumber = '';
  String previousExpression = '';
  int i = 0;
  int pressCount = 0;
  bool lastPressedEquals = false;

  Widget calbutton(String btntext, Color btncolor, Color textColor){
    return Container(
        height: 70,
        width: 70,
        child: ElevatedButton(
          onPressed: (){
            if (lastPressedEquals && btntext != '=') {
              // Clear the display if the last button pressed was '=' and the current button is not '='
              currentNumber = '';
              displayExpression = currentNumber;
              lastPressedEquals = false;
            }
            if (btntext == '0' && currentNumber == '0') {
              // Do nothing if 0 is already displayed
            }else {
              calculation(btntext);
            }
          }, // TODO function for the button when pressed
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: btncolor,
            padding: EdgeInsets.all(15),
          ),
          child: Text(btntext,
            style: TextStyle(
              fontSize: 30,
              color: textColor,
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator",
            style: TextStyle(fontSize: 25)),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  displayExpression,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      // check whether the result number is greater than 15 and show error
                      resultToShow.length > 20 ? 'Number too large' :
                      resultToShow, // Append operator next to result
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        // check if text is error chnage the color into red
                        color: resultToShow == 'Error' ? Colors.red : Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: () {
                      calculation('⌫');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ], // <- Add a comma here to close the children list
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton("AC", Color(0xFF5f5c5c), Colors.black),
                calbutton("\u221A", Color(0xFF5f5c5c), Colors.black),
                calbutton("%", Color(0xFF5f5c5c), Colors.black),
                calbutton("/", Color(0xFF5f5c5c), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton("7", Color(0xFF383838), Colors.white),
                calbutton("8", Color(0xFF383838), Colors.white),
                calbutton("9", Color(0xFF383838), Colors.white),
                calbutton("x", Color(0xFF5f5c5c), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton("4", Color(0xFF383838), Colors.white),
                calbutton("5", Color(0xFF383838), Colors.white),
                calbutton("6", Color(0xFF383838), Colors.white),
                calbutton("-", Color(0xFF5f5c5c), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton("1", Color(0xFF383838), Colors.white),
                calbutton("2", Color(0xFF383838), Colors.white),
                calbutton("3", Color(0xFF383838), Colors.white),
                calbutton("+", Color(0xFF5f5c5c), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // This is button 0
                // ElevatedButton(
                //   onPressed: (){
                //     calculation('0');
                //   },
                //   child: Text('0',
                //     style: TextStyle(
                //         fontSize: 30,
                //         color: Colors.white
                //     ),),
                //   style: ElevatedButton.styleFrom(
                //     padding: EdgeInsets.fromLTRB(30, 15, 115, 15),
                //     shape: StadiumBorder(),
                //     backgroundColor: Color(0xFF383838),
                //   ),
                // ),
                calbutton("+/-", Color(0xFF5f5c5c), Colors.white),
                calbutton("0", Color(0xFF5f5c5c), Colors.white),
                calbutton(".", Color(0xFF5f5c5c), Colors.white),
                calbutton("=", Color(0xFFFFFC0A), Colors.black),
              ],
            )
          ],
        ),
      ),
    );
  }
  // for the calculator logic

//Calculator logic
  dynamic resultToShow ='';
  dynamic finalResult = '';
  dynamic result = '';
  
  void calculation(String btnText) {
    if (btnText == 'AC') {
      resultToShow = '';
      result = '';
      finalResult = '';
      displayExpression = '';
      currentNumber = '';
      previousExpression = '';
      i = 0;
    } else if (btnText == '⌫') {
      if (currentNumber.isNotEmpty) {
        currentNumber = currentNumber.substring(0, currentNumber.length - 1);
        if (currentNumber.isEmpty) {
          currentNumber = '';
        }
        finalResult = currentNumber;
      }
    } else if (btnText == '=') {
      displayExpression = '$displayExpression $currentNumber';
      finalResult = doesContainDecimal(evaluateExpression(displayExpression));
      currentNumber = '';
      lastPressedEquals = true;
    }else if (btnText == '%') {
      if (currentNumber.isNotEmpty) {
        if(i >= 1){
          finalResult = "Invalid";
        }else{
          i += 1;
          displayExpression = '$currentNumber %';
          double number = double.parse(currentNumber);
          double percentage = number / 100;
          currentNumber = percentage.toString();
          finalResult = currentNumber;
          currentNumber = '';
        }
      }
    }else if(btnText == '+/-'){
      if (currentNumber.isNotEmpty) {
        double number = double.parse(currentNumber);
        number = (-number);
        currentNumber = doesContainDecimal(number);
        finalResult = currentNumber;
        currentNumber = '';
      }
    }else if (btnText == '.') {
      if (!currentNumber.contains('.')) {
        if ( currentNumber == ''){
          currentNumber = '0.';
        }else {
          currentNumber += '.';
        }
      }else if (currentNumber.contains('.') && !(currentNumber.endsWith('.'))){
          currentNumber += '.';
      }
      result = currentNumber;
      finalResult = result;
    }else if (btnText == '\u221A') {
      // Handle square root functionality
      if (currentNumber.isNotEmpty) {
        double number = double.parse(currentNumber);
        if (number < 0) {
          finalResult = "Invalid";  // Handle negative numbers in square root
        } else {
          displayExpression = '√$currentNumber';
          double sqrtResult = (number >= 0) ? sqrt(number) : 0;
          // currentNumber = sqrtResult.toStringAsFixed(5);
          currentNumber = doesContainDecimal(sqrtResult);
          finalResult = currentNumber;
          currentNumber = '';
        }
      }
    }else {
      if (currentNumber.isEmpty && ['+', '-', 'x', '/', '%'].contains(btnText.trim().split(' ').last) && resultToShow.isEmpty) {
        // do nothing
      }
      else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '%') {
        if (currentNumber.isEmpty && ['+', '-', 'x', '/', '%'].contains(btnText.trim().split(' ').last)){
          // do nothing
        }
        if (currentNumber.isEmpty || currentNumber == 'Error') {
          currentNumber = resultToShow + ' $btnText ';
        } else if (!['+', '-', 'x', '/', '%'].contains(currentNumber.trim().split(' ').last)) {
          currentNumber += ' $btnText ';
        } else if (currentNumber == '0'){
          // nothing
        }
      } else {
        if (currentNumber == 'Error') {
          currentNumber = btnText;
        } else {
          currentNumber += btnText;
        }
      }
      finalResult = currentNumber;
    }
    setState(() {
      resultToShow = finalResult;
    });
  }

  String evaluateExpression(String expression) {
    List<String> tokens = expression.split(' ');
    List<double> values = [];
    List<String> ops = [];

    for (String token in tokens) {
      if (token.isEmpty) continue;

      if (isOperator(token)) {
        while (ops.isNotEmpty && hasPrecedence(token, ops.last)) {
          values.add(applyOp(ops.removeLast(), values.removeLast(), values.removeLast()));
        }
        ops.add(token);
      } else {
        values.add(double.parse(token));
      }
    }

    while (ops.isNotEmpty) {
      values.add(applyOp(ops.removeLast(), values.removeLast(), values.removeLast()));
    }

    if (values.last.isNaN) {
      return "Can't divide by 0";
    }
    else if (values.last.isInfinite) {
      return "Error";
    }

    return values.last.toString();
  }

  bool isOperator(String token) {
    return token == '+' || token == '-' || token == 'x' || token == '/' || token == '%';
  }

  bool hasPrecedence(String op1, String op2) {
    if ((op1 == 'x' || op1 == '/' || op1 == '%') && (op2 == '+' || op2 == '-')) {
      return false;
    } else {
      return true;
    }
  }

  double applyOp(String op, double b, double a) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case 'x':
        return a * b;
      case '/':
        return a / b;
      case '%':
        return (a * (b / 100));
      default:
        return 0;
    }
  }
  String doesContainDecimal(dynamic result) {
    String resultStr = result.toString();
    if (resultStr.contains('.')) {
      List<String> splitDecimal = resultStr.split('.');
      String decimalPart = splitDecimal[1];
      if (decimalPart.length > 1) {
        for (int i = 1; i <= decimalPart.length / 2; i++) {
          String pattern = decimalPart.substring(0, i);
          String repeatedPattern = pattern * (decimalPart.length ~/ i);
          if (decimalPart.startsWith(repeatedPattern)) {
            return '${splitDecimal[0]}.$pattern';
          }
        }
      }
      if (!(int.parse(decimalPart) > 0)) {
        return splitDecimal[0].toString();
      }
    }
    return resultStr;
  }

}
