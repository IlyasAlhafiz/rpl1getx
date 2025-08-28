import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});
  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CounterView'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Hitungan ke:${controller.hitung}',
                style: TextStyle(
                  fontSize: 20.0 + controller.hitung.value.toDouble(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: controller.decrement,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
