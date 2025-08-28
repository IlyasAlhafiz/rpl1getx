import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl1getx/app/modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import 'package:rpl1getx/app/modules/alquran/views/alquran_view.dart';
import 'package:rpl1getx/app/modules/counter/views/counter_view.dart';
import 'package:rpl1getx/app/modules/post/views/post_view.dart';
import 'package:rpl1getx/app/modules/profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text('HomeView is working', style: TextStyle(fontSize: 20)),
//       ),
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           InkWell(
//             onTap: () => Get.toNamed('/details'),
//             child: FloatingActionButton(
//               heroTag: 'details',
//               onPressed: () => Get.toNamed('/details'),
//               child: const Icon(Icons.details),
//               tooltip: 'Go to Details',
//             ),
//           ),

//           const SizedBox(height: 16),
//           FloatingActionButton(
//             heroTag: 'form',
//             onPressed: () => Get.toNamed('/form-pendaftaran'),
//             child: const Icon(Icons.assignment),
//             tooltip: 'Go to Forms',
//           ),

//           const SizedBox(height: 16),
//           FloatingActionButton(
//             onPressed:  () => Get.toNamed('/post'),
//             child: const Icon(Icons.post_add),
//             tooltip: 'Go to Posts',
//           ),

//           const SizedBox(height: 16),
//           FloatingActionButton(onPressed: () => Get.toNamed('/alquran'),
//             child: const Icon(Icons.book),
//             tooltip: 'Go to Alquran',
//           ),

//           const SizedBox(height: 16),
//           FloatingActionButton(onPressed: () => Get.toNamed('/login'),
//             child: const Icon(Icons.person),
//             tooltip: 'Go to Login',
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Widget> pages = [CounterView(), PostView(), FormPendaftaranView(), AlquranView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Obx(() => pages[controller.selectedIndex.value]),
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
