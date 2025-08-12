import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/controllers/football_controller.dart';
import 'package:calculator_app/models/player_model.dart';

class FootbalEditController extends GetxController {
  // Controller list pemain
  final fc = Get.find<FootballController>();

  // TextField controllers
  final imageCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final posCtrl = TextEditingController();
  final numberCtrl = TextEditingController();

  late int index; // index pemain yang diedit

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments as int; // terima index dari routing
    _load();
  }

  // Ambil data awal ke form
  void _load() {
    final p = fc.player[index];
    imageCtrl.text = p.image ?? '';
    nameCtrl.text = p.name;
    posCtrl.text = p.position;
    numberCtrl.text = p.number.toString();
  }

  // Simpan perubahan
  void save() {
    final n = int.tryParse(numberCtrl.text.trim());
    if (n == null) {
      _snack('Invalid', 'Nomor punggung harus angka');
      return;
    }

    final updated = Player(
      image: imageCtrl.text.trim().isEmpty ? null : imageCtrl.text.trim(),
      name: nameCtrl.text.trim(),
      position: posCtrl.text.trim(),
      number: n,
    );

    fc.updatePlayer(index, updated);

    // Kembali ke list lalu tampilkan snackbar sukses singkat
    Get.back();
    Future.delayed(const Duration(milliseconds: 100), () {
      _snack('Tersimpan', 'Data ${updated.name} berhasil diperbarui');
    });
  }

  // Snackbar sederhana
  void _snack(String title, String message) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    imageCtrl.dispose();
    nameCtrl.dispose();
    posCtrl.dispose();
    numberCtrl.dispose();
    super.onClose();
  }
}
