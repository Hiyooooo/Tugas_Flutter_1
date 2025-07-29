import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstNumber = TextEditingController();
  final TextEditingController secondNumber = TextEditingController();

  int hasil = 0;

  void calculate(String ops) {
    if (firstNumber.text.trim().isEmpty || secondNumber.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('number columns must be filled in!')),
      );
      return;
    }

    int num1 = int.parse(firstNumber.text.trim());
    int num2 = int.parse(secondNumber.text.trim());

    setState(() {
      switch (ops) {
        case "+":
          hasil = num1 + num2;
          break;
        case "-":
          hasil = num1 - num2;
        case "x":
          hasil = num1 * num2;
        case ":":
          hasil = num1 ~/ num2;
        default:
      }
    });
  }

  void clear() {
    firstNumber.clear();
    secondNumber.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Calculator")),

      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: firstNumber,
              decoration: InputDecoration(
                labelText: "First Number",
                hintText: "Enter the first number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20),
            TextField(
              controller: secondNumber,
              decoration: InputDecoration(
                labelText: "Second Number",
                hintText: "Enter the second number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        calculate("+");
                      },
                      child: Text("+"),
                    ),
                  ),
                  SizedBox(width: 12),

                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        calculate("-");
                      },
                      child: Text("-"),
                    ),
                  ),
                  SizedBox(width: 12),

                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        calculate("x");
                      },
                      child: Text("x"),
                    ),
                  ),
                  SizedBox(width: 12),

                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        calculate(":");
                      },
                      child: Text(":"),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 160,
                height: 50,
                child: ElevatedButton(onPressed: clear, child: Text("Reset")),
              ),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("Hasil = $hasil", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
