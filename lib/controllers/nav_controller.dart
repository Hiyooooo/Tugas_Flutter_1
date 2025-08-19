import 'package:get/get.dart';
import 'package:calculator_app/routes/routes.dart';

class NavController extends GetxController {
  final currentIndex = 0.obs;

  void setIndex(int i) => currentIndex.value = i;

  void onTap(int i) {
    if (i == currentIndex.value) return;
    currentIndex.value = i;
    switch (i) {
      case 0:
        Get.offNamed(AppRoutes.calculator);
        break;
      case 1:
        Get.offNamed(AppRoutes.footballplayers);
        break;
      case 2:
        Get.offNamed(AppRoutes.profile);
        break;
    }
  }
}
