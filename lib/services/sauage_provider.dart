
import 'package:assign/services/sausage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/sausage_roll_model.dart';


final sausageRollServiceProvider = Provider<SausageRollService>((ref) {
  return SausageRollService();
});

final sausageRollProvider = FutureProvider<SausageRoll>((ref) async {
  final service = ref.read(sausageRollServiceProvider);
  return service.fetchSausageRoll();
});
