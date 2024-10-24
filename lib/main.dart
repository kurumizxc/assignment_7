import 'package:flutter/material.dart';

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
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the result section
  double result = 0;

  // Controllers for the input fields
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  // Function to perform addition
  void performAddition() {
    setState(() {
      double firstNum = double.tryParse(add1Controller.text) ?? 0;
      double secondNum = double.tryParse(add2Controller.text) ?? 0;
      result = firstNum + secondNum;
    });
  }

  // Function to perform subtraction
  void performSubtraction() {
    setState(() {
      double firstNum = double.tryParse(add1Controller.text) ?? 0;
      double secondNum = double.tryParse(add2Controller.text) ?? 0;
      result = firstNum - secondNum;
    });
  }

  // Function to perform multiplication
  void performMultiplication() {
    setState(() {
      double firstNum = double.tryParse(add1Controller.text) ?? 0;
      double secondNum = double.tryParse(add2Controller.text) ?? 0;
      result = firstNum * secondNum;
    });
  }

  // Function to perform division
  void performDivision() {
    setState(() {
      double firstNum = double.tryParse(add1Controller.text) ?? 0;
      double secondNum = double.tryParse(add2Controller.text) ?? 0;
      if (secondNum != 0) {
        result = firstNum / secondNum;
      } else {
        result = 0; // Avoid division by zero
      }
    });
  }

  // Function to clear inputs and reset result
  void clearInputs() {
    setState(() {
      add1Controller.clear();
      add2Controller.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Addition Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: performAddition,
              ),
            ],
          ),
          
          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: performSubtraction,
              ),
            ],
          ),
          
          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" × "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: performMultiplication,
              ),
            ],
          ),
          
          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" ÷ "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: performDivision,
              ),
            ],
          ),
          
          // Clear Button
          ElevatedButton(
            onPressed: clearInputs,
            child: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}
