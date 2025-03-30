import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/documents/taps/invoice_tab.dart';
import 'package:taj_alsafa/documents/taps/payment_tab.dart';
import 'package:taj_alsafa/documents/taps/quotationTap.dart';

class MyDocumentsPage extends StatefulWidget {
  const MyDocumentsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDocumentsPageState createState() => _MyDocumentsPageState();
}

class _MyDocumentsPageState extends State<MyDocumentsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: appbar,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'My Documents',
          style: AppTextStyles.secondaryStyle.copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        bottom: TabBar(
          indicatorColor: Colors.green,
          labelColor: Colors.black,
          controller: _tabController,
          labelStyle: AppTextStyles.secondaryStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: MediaQuery.sizeOf(context).width > 600 ? 12.sp : 16.sp,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.green),
            insets: EdgeInsets.symmetric(
              horizontal: -30.w,
            ), // Decrease this to make it longer
          ),
          tabs: [
            Tab(text: 'Quotation'),
            Tab(text: 'Invoice'),
            Tab(text: 'Payment'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [QuotationTab(), InvoiceTab(), PaymentTab()],
      ),
    );
  }
}
