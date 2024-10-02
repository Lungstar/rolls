
import 'dart:async';

import '../models/sausage_roll_model.dart';

class SausageRollService {
  Future<SausageRoll> fetchSausageRoll() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // Mock JSON response
    final mockJson = {
      "articleCode": "1000446",
      "shopCode": "1234",
      "availableFrom": "2020-12-30T00:00:00Z",
      "availableUntil": "2045-05-13T23:59:59Z",
      "eatOutPrice": 1.05,
      "eatInPrice": 1.15,
      "articleName": "Sausage Roll",
      "dayParts": ["Breakfast", "Lunch", "Evening"],
      "customerDescription": "The Nation’s favourite Sausage Roll.\n\nMuch like Elvis was hailed the King of Rock...",
      "imageUri": "https://articles.greggs.co.uk/images/1000446.png",
      "thumbnailUri": "https://articles.greggs.co.uk/images/1000446-thumb.png",
    };

    return SausageRoll.fromJson(mockJson);
  }
}
