import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/controllers/nav_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController nav = Get.find<NavController>();
    // Set tab index ke 2 saat halaman Profile aktif
    nav.setIndex(2);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 16),
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            SizedBox(height: 12),
            Text(
              'Raden Adika Ruzain',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text('email@example.com'),
          ],
        ),
      ),

      // Tambahkan bottom nav di Profile juga
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
