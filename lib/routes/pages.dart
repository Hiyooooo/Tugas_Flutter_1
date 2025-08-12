import 'package:calculator_app/pages/calculator_page.dart';
import 'package:calculator_app/pages/football_page.dart';
import 'package:calculator_app/pages/football_edit_page.dart';
import 'package:calculator_app/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPages()),
    GetPage(name: AppRoutes.footballedit, page: () => FootbalEdit()),
  ];
}
