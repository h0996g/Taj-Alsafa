import 'package:flutter/material.dart';
import 'package:taj_alsafa/const/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Column(
          children: [
            Image.asset('assets/images/logo/logo.png'),
            SizedBox(height: 10),
          ],
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              label: Text('3', style: TextStyle(color: Colors.black)),
              backgroundColor: thirdColor,
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
    );
  }
}
