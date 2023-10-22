import 'package:expense_manager/view/screens/add_expense_page.dart';
import 'package:expense_manager/view/screens/all_transactions_page.dart';
import 'package:expense_manager/view/screens/home_screen.dart';
import 'package:expense_manager/view/screens/settings_page.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/controllers/gnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';

class GnavNavigation extends StatefulWidget {
  const GnavNavigation({Key? key}) : super(key: key);

  @override
  GnavNavigationState createState() => GnavNavigationState();
}

class GnavNavigationState extends State<GnavNavigation> {
  final gnav = Get.put(GnavController());
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
              selectedIndex: gnav.currentIndex.value,
              onTabChange: (index) {
                gnav.changeIndex(index);
                print(gnav.currentIndex.value);
              },
            ),
          ),
          body: Obx(
            () => IndexedStack(
              index: gnav.currentIndex.value,
              children: _screens,
            ),
          )),
    );
  }
}
