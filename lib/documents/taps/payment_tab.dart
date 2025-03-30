import 'package:flutter/material.dart';
import 'package:taj_alsafa/documents/taps/card.dart';

class PaymentTab extends StatelessWidget {
  PaymentTab({super.key});

  final List<Map<String, dynamic>> quotations = [
    {'quotationNumber': 1, 'requestNumber': 1},
    // {'quotationNumber': 2, 'requestNumber': 5},
    // {'quotationNumber': 3, 'requestNumber': 8},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: quotations.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final item = quotations[index];
          return QuotationCard(
            item: item,
            quotationLabel: 'Payment Number',
            requestLabel: 'Request Number',
            onPressed: () {},
          );
        },
      ),
    );
  }
}
