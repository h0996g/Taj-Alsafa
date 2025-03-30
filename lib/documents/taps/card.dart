import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/components/componants.dart'; // For CustomSubmitButton

class DocumentCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onPressed;
  final String quotationLabel;
  final String requestLabel;

  const DocumentCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.quotationLabel = 'Quotation Number',
    this.requestLabel = 'Request Number',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(2, 0), // Shadow in all directions
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$quotationLabel: ${item['quotationNumber']}',
              style: AppTextStyles.smallStyle,
            ),
            const SizedBox(height: 8),
            Text(
              '$requestLabel: ${item['requestNumber']}',
              style: AppTextStyles.smallStyle,
            ),
            const SizedBox(height: 16),
            CustomSubmitButton(
              icon: SvgPicture.asset(
                'assets/svg/Pdf.svg',
                height: 15.h,
                width: 15.w,
              ),
              text: 'View File',
              onPressed: onPressed,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
