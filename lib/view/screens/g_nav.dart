import 'package:expense_manager/view/screens/add_expense_page.dart';
import 'package:expense_manager/view/screens/all_transactions_page.dart';
import 'package:expense_manager/view/screens/home_screen.dart';
import 'package:expense_manager/view/screens/settings_page.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';

class GnavNavigation extends StatefulWidget {
  const GnavNavigation({Key? key}) : super(key: key);

  @override
  GnavNavigationState createState() => GnavNavigationState();
}

class GnavNavigationState extends State<GnavNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    AddExpensePage(),
    AllTransactions(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    //   final width = MediaQuery.sizeOf(context).width;
    //  final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: GNav(
              backgroundColor: Pallete.scaffoldBgColor,
              activeColor: Pallete.purple,
              gap: 7,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: IconlyLight.home,
                  text: "Home",
                ),
                GButton(
                  icon: IconlyLight.plus,
                  text: "Add Transaction",
                ),
                GButton(
                  icon: IconlyLight.time_circle,
                  text: "History",
                ),
                GButton(
                  icon: IconlyLight.setting,
                  text: "Settings",
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
    );
  }
}
