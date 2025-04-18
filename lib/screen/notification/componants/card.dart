import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';

class NotificationCard extends StatelessWidget {
  final String date;
  final String time;
  final String ticketNumber;
  final String description;

  const NotificationCard({
    super.key,
    required this.date,
    required this.time,
    required this.ticketNumber,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: AppTextStyles.smallStyle.copyWith(
                    fontFamily: 'ABeeZee',
                    fontSize: 12.sp,
                  ),
                ),
                Spacer(),
                Text(
                  time,
                  style: AppTextStyles.smallStyle.copyWith(
                    fontFamily: 'ABeeZee',
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 70.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.h,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: appbar,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'TAJ ALSAFA',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.secondaryStyle,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ticket No.$ticketNumber',
                          style: AppTextStyles.smallStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            description,
                            style: AppTextStyles.smallStyle.copyWith(
                              fontFamily: 'ABeeZee',
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
