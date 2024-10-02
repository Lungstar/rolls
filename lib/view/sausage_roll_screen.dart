import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/basket_controller.dart';
import '../services/sauage_provider.dart';
import '../widgets/sausage_roll_item.dart';
import '../widgets/basket_summary.dart';

class SausageRollScreen extends ConsumerWidget {
  const SausageRollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sausageRollAsyncValue = ref.watch(sausageRollProvider);
    final basket = ref.watch(basketProvider);
    final totalPrice = ref.watch(basketProvider.notifier).totalPrice;

    return Scaffold(
      appBar: AppBar(title: const Text("Greggs Sausage Roll")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    sausageRollAsyncValue.when(
                      data: (sausageRoll) => SausageRollItem(
                        sausageRoll: sausageRoll,
                        onAddToBasket: () {
                          ref.read(basketProvider.notifier).addItem(sausageRoll);
                        },
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stack) => Text('Error: $error'),
                    ),
                    const Divider(),
                    BasketSummary(
                      basketItems: basket,
                      totalPrice: totalPrice,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
