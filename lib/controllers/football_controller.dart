import 'package:get/get.dart';
import 'package:calculator_app/models/player_model.dart';

class FootballController extends GetxController {
  var player = <Player>[
    Player(
      image: "aassets/images/messi.jpg",
      name: "Lionel Messi",
      position: "RW",
      number: 2,
    ),
    Player(
      image: "assets/images/ronaldo.jpg",
      name: "Cristiano Ronaldo",
      position: "ST",
      number: 1,
    ),
    Player(
      image: "assets/images/neymarjr.jpg",
      name: "Neymar Jr",
      position: "LW",
      number: 3,
    ),
  ].obs;

  void updatePlayer(int index, Player updated) {
    if (index >= 0 && index < player.length) {
      player[index] = updated;
    }
  }
}
