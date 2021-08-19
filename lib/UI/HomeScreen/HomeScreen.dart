import 'file:///D:/Flutter/personal_task/lib/UI/tabs/HomePage.dart';
import 'package:accucia_task/UI/HomeScreen/BottomNavBar.dart';
import 'package:accucia_task/UI/tabs/Ranked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _tabPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabPageController = PageController();
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Accucia Shop",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        bottomNavigationBar: Bottomtabs(
          selectedTab: _selectedTab,
          tabPressed: (num) {
            _tabPageController.animateToPage(num,
                duration: Duration(milliseconds: 400), curve: Curves.easeOutCubic);
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _tabPageController,
                onPageChanged: (num) {
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomePage(),
                  RankedList()
                ],
              ),
            ),
          ],
        ));
  }
}
