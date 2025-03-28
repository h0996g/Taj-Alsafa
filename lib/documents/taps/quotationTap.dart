import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/text_style.dart';

class QuotationTab extends StatelessWidget {
  QuotationTab({super.key});

  final List<Map<String, dynamic>> quotations = [
    {'quotationNumber': 1, 'requestNumber': 1},
    // {'quotationNumber': 2, 'requestNumber': 5},
    // {'quotationNumber': 3, 'requestNumber': 8},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotations.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        final item = quotations[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.white),
          ),
          elevation: 4,
          shadowColor: Colors.grey,

          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quotation Number: ${item['quotationNumber']}',
                  style: AppTextStyles.smallStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Request Number: ${item['requestNumber']}',
                  style: AppTextStyles.smallStyle,
                ),
                const SizedBox(height: 16),
                CustomSubmitButton(
                  icon: SvgPicture.asset('assets/svg/Pdf.svg'),
                  text: 'View File',
                  onPressed: () {},
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
