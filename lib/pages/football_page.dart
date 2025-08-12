import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_app/controllers/football_controller.dart';
import 'package:calculator_app/models/player_model.dart';
import 'package:calculator_app/routes/routes.dart';

class FootballPages extends StatelessWidget {
  FootballPages({super.key});
  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
