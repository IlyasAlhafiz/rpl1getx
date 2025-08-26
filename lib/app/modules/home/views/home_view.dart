import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('HomeView is working', style: TextStyle(fontSize: 20)),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Get.toNamed('/details'),
            child: FloatingActionButton(
              heroTag: 'details',
              onPressed: () => Get.toNamed('/details'),
              child: const Icon(Icons.details),
              tooltip: 'Go to Details',
            ),
          ),
          
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'form',
            onPressed: () => Get.toNamed('/form-pendaftaran'),
            child: const Icon(Icons.assignment),
            tooltip: 'Go to Forms',
          ),
        ],
      ),
    );
  }
}
