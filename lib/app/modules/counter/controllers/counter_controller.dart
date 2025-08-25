import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt hitung = 0.obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else if (hitung < 0 && hitung > 100) {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh dari 0 dan 100",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh dari 0 dan 100",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
