import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl1getx/app/modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import 'package:rpl1getx/app/modules/alquran/views/alquran_view.dart';
import 'package:rpl1getx/app/modules/counter/views/counter_view.dart';
import 'package:rpl1getx/app/modules/post/views/post_view.dart';
import 'package:rpl1getx/app/modules/profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Widget> pages = [
    CounterView(),
    PostView(),
    FormPendaftaranView(),
    AlquranView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        onTap: controller.changePage,
        items: const [
          TabItem(icon: Icons.router, title: 'Counter'),
          TabItem(icon: Icons.post_add, title: 'Post'),
          TabItem(icon: Icons.assignment, title: 'Form'),
          TabItem(icon: Icons.book, title: 'Alquran'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}
