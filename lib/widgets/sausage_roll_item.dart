import 'package:flutter/material.dart';
import '../models/sausage_roll_model.dart';

class SausageRollItem extends StatelessWidget {
  final SausageRoll sausageRoll;
  final VoidCallback onAddToBasket;

  const SausageRollItem({
    Key? key,
    required this.sausageRoll,
    required this.onAddToBasket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          sausageRoll.imageUri,
          fit: BoxFit.cover,
          width: 10,
          height: 10,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'placeholder.png',
              fit: BoxFit.cover,
            );
          },
        ),
        const SizedBox(height: 10),
        Text(
          sausageRoll.articleName,
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          "\R${sausageRoll.eatOutPrice.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(sausageRoll.customerDescription),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onAddToBasket,
          child: const Text("Add to Basket"),
        ),
      ],
    );
  }
}
