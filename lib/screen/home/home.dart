import 'package:flutter/material.dart';
import 'package:taj_alsafa/components/widget/drawer.dart';
import 'package:taj_alsafa/const/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Column(
          children: [
            Image.asset('assets/images/logo/logo.png'),
            SizedBox(height: 10),
          ],
        ),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
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
      body: Center(child: Text('Home Page Content')),
    );
  }
}
