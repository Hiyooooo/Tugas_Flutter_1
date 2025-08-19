import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/controllers/football_controller.dart';
import 'package:calculator_app/controllers/nav_controller.dart';
import 'package:calculator_app/models/player_model.dart';
import 'package:calculator_app/routes/routes.dart';

class FootballPages extends StatelessWidget {
  FootballPages({super.key});

  final FootballController footballController = Get.put(FootballController());
  final NavController nav =
      Get.find<NavController>(); // sudah di-put dari Calculator

  @override
  Widget build(BuildContext context) {
    // Saat halaman Football tampil, set index ke 1
    nav.setIndex(1);

    return Scaffold(
      appBar: AppBar(title: const Text('Football Players')),
      body: Obx(() {
        return ListView.builder(
          itemCount: footballController.player.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final Player p = footballController.player[index];

            return ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipOval(
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: (p.image != null && p.image!.isNotEmpty)
                      ? Image.asset(
                          p.image!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: const Color(0xFFF1F1F5),
                            alignment: Alignment.center,
                            child: const Text(
                              "?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Container(
                          color: const Color(0xFFF1F1F5),
                          alignment: Alignment.center,
                          child: const Text(
                            "?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              ),
              title: Text(p.name),
              subtitle: Text('${p.position} · ${p.number}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  Get.toNamed(AppRoutes.footballedit, arguments: index),
            );
          },
        );
      }),

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
