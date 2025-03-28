import 'package:flutter/material.dart';
import 'package:taj_alsafa/const/colors.dart';
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
        backgroundColor: appbar,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text('My Documents'),
        bottom: TabBar(
          indicatorColor: Colors.green,
          labelColor: Colors.black,

          controller: _tabController,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
          tabs: const [
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
