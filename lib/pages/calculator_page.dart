import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:calculator_app/controllers/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/widgets/custom_textfield.dart';
import 'package:calculator_app/widgets/custom_button.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );
  final NavController nav = Get.put(NavController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    nav.setIndex(0);

    return Scaffold(
      appBar: AppBar(title: const Text("My Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: calculatorController.txtAngka1,
              label: "input angka 1",
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: calculatorController.txtAngka2,
              label: "input angka 2",
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "+",
                    onPressed: () => calculatorController.tambah(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: "-",
                    onPressed: () => calculatorController.kurang(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "X",
                    onPressed: () => calculatorController.kali(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: "/",
                    onPressed: () => calculatorController.bagi(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Obx(
              () => Text(
                "Hasil: ${calculatorController.hasil.value}",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Clear",
              onPressed: () => calculatorController.clear(),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: nav.currentIndex.value,
          onTap: nav.onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Football',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
