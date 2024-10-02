import 'package:flutter/material.dart';
import '../models/sausage_roll_model.dart';

class BasketSummary extends StatelessWidget {
  final List<SausageRoll> basketItems;
  final double totalPrice;

  const BasketSummary({
    Key? key,
    required this.basketItems,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Basket:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: basketItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(basketItems[index].articleName),
                trailing: Text("\$${basketItems[index].eatOutPrice.toStringAsFixed(2)}"),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Total: \$${totalPrice.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
