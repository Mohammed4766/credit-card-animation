import 'package:flutter/material.dart';

import 'PaymentDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentDetails(
        amount: '500',
      ),
    );
  }
}
