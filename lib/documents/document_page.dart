import 'package:flutter/material.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDocumentsPage extends StatefulWidget {
  const MyDocumentsPage({super.key});

  @override
  _MyDocumentsPageState createState() => _MyDocumentsPageState();
}

class _MyDocumentsPageState extends State<MyDocumentsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // We have 3 tabs: Quotation, Invoice, Payment
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

class QuotationTab extends StatelessWidget {
  QuotationTab({super.key});

  // Example data for multiple quotations
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
                // Replace this with your custom button
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

class InvoiceTab extends StatelessWidget {
  const InvoiceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with your Invoice UI
    return const Center(
      child: Text('Invoice Page', style: TextStyle(fontSize: 18)),
    );
  }
}

class PaymentTab extends StatelessWidget {
  const PaymentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with your Payment UI
    return const Center(
      child: Text('Payment Page', style: TextStyle(fontSize: 18)),
    );
  }
}
