import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasil = "".obs;

  void tambah() {
    int angka1 = int.parse(txtAngka1.text.toString());
    int angka2 = int.parse(txtAngka2.text.toString());

    int hasilJumlah = angka1 + angka2;
    hasil.value = hasilJumlah.toString();
  }

  void kurang() {
    int angka1 = int.parse(txtAngka1.text.toString());
    int angka2 = int.parse(txtAngka2.text.toString());

    int hasilJumlah = angka1 - angka2;
    hasil.value = hasilJumlah.toString();
  }

  void kali() {
    int angka1 = int.parse(txtAngka1.text.toString());
    int angka2 = int.parse(txtAngka2.text.toString());

    int hasilJumlah = angka1 * angka2;
    hasil.value = hasilJumlah.toString();
  }

  void bagi() {
    int angka1 = int.parse(txtAngka1.text.toString());
    int angka2 = int.parse(txtAngka2.text.toString());

    double hasilJumlah = angka1 / angka2;
    hasil.value = hasilJumlah.toString();
  }

  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
  }
}
