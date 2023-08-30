import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import 'package:news/BottomNavigatonBar/screens/business_Screen.dart';
import 'package:news/BottomNavigatonBar/screens/SportsScreen.dart';
import 'package:news/BottomNavigatonBar/screens/ScienceScreen.dart';
import 'package:news/widgets/constants.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> Screenview = [
    AllNewsScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.backGroud,
      appBar: AppBar(
        backgroundColor: AppConst.backGroud,
        elevation: 0.0,
        title: Text(
          'News',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(IconlyLight.search),
            ),
          )
        ],
      ),
      body: Screenview[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: AppConst.kMainColor,
            elevation: 0,
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'news',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'sports'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.science,
                  ),
                  label: 'science')
            ]),
      ),
    );
  }
}
