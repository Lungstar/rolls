
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sausage_roll_model.dart';

class BasketController extends StateNotifier<List<SausageRoll>> {
  BasketController() : super([]);

  void addItem(SausageRoll item) {
    state = [...state, item];
  }

  double get totalPrice {
    return state.fold(0, (sum, item) => sum + item.eatOutPrice);
  }
}


final basketProvider = StateNotifierProvider<BasketController, List<SausageRoll>>((ref) {
  return BasketController();
});
