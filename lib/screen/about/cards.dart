import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';

class CustomListCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomListCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10),
      // height: 120.h,
      color: appbar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.smallStyle),
          SizedBox(height: 10.h),
          Text(
            description,
            style: AppTextStyles.smallStyle.copyWith(
              // fontWeight: FontWeight.w300,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class ListCards extends StatelessWidget {
  ListCards({super.key});

  // Example list with different text values
  final List<Map<String, String>> items = [
    {
      'title': 'Integrity',
      'description':
          'We uphold the highest ethical standards, ensuring transparency, trust, and accountability in all our dealings.\n\n',
    },
    {
      'title': 'excellence',
      'description':
          'We relentlessly pursue excellence in design, construction, and service, setting new benchmarks for luxury Living .\n\n',
    },
    {
      'title': 'innovation',
      'description':
          'We embrace innovation to create homes that harmonise modernity with timeless elegance, integrating the latest technology and sustainable practices .\n\n',
    },
    {
      'title': 'customer-centric',
      'description':
          'Our clients are at the heart of everything we do. We prioritise their needs, offering personalised experiences and solutions .\n\n',
    },
    {
      'title': 'sustainability',
      'description':
          'We are committed to environmental responsibility, designing properties that minimise our ecological footprint and contribute to a greener future .\n\n',
    },
    {
      'title': 'innovative designs, lasting quality',
      'description':
          'We embrace innovation to create homes that harmonise modernity with timeless elegance, integrating the latest technology and sustainable practices .\n\n',
    },
    {
      'title': 'innovation',
      'description':
          "Taj Alsafa Real Estate Development was established in Amman in 2014 by industry specialists with more than 20 years of expertise in the real estate business. We provide our customers with a diverse choice of outstanding high-end residential and commercial projects. We also offer our clients a unique array of services and professional guidance to assist them in making the finest property decisions. We embrace change and constantly challenge tradition because we strongly desire to improve the construction method and raise the efficiency and quality of our projects to meet customers' needs, requirements, and well-being.\n\n",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CustomListCard(
          title: item['title']!,
          description: item['description']!,
        );
      },
    );
  }
}
