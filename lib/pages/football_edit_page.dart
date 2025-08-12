import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/controllers/football_edit_controller.dart';

class FootbalEdit extends StatelessWidget {
  FootbalEdit({super.key});
  final FootbalEditController editController = Get.put(FootbalEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color.fromARGB(31, 0, 0, 0)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(164, 193, 193, 193),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: editController.imageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Image Path',
                  hintText: 'contoh: assets/images/foto.jpg',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: editController.nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: editController.posCtrl,
                decoration: const InputDecoration(labelText: 'Position'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: editController.numberCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Number'),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => editController.save(),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
