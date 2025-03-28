import 'package:flutter/material.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/screen/notification/componants/card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSecond(title: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            NotificationCard(
              date: '25 - 5 - 2024',
              time: '9:45 AM',
              ticketNumber: '10',
              description:
                  'Maintenance work was carried out and completed required. All the mentioned problems were fixed.',
            ),
            NotificationCard(
              date: '25 - 5 - 2024',
              time: '9:45 AM',
              ticketNumber: '11',
              description:
                  'Another maintenance issue resolved successfully. No further actions required.',
            ),
          ],
        ),
      ),
    );
  }
}
