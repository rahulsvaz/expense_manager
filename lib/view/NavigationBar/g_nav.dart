import 'package:expense_manager/view/addTransaction/add_transaction.dart';
import 'package:expense_manager/view/allTransactions/all_transactions_page.dart';
import 'package:expense_manager/view/home/home_screen.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/NavigationBar/controller/gnav_controller.dart';
import 'package:expense_manager/view/settings/settings_page_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';

class GnavNavigation extends StatefulWidget {
  const GnavNavigation({super.key});

  @override
  GnavNavigationState createState() => GnavNavigationState();
}

class GnavNavigationState extends State<GnavNavigation> {
  final gnav = Get.put(GnavController());
  final List<Widget> _screens =  [
    HomeScreen(),
    AddTransaction(),
    AllTransactions(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    //   final width = MediaQuery.sizeOf(context).width;
    //  final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Pallete.scaffoldBgColor,
        activeColor: Pallete.purple,
        gap: 5,
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
        },
      ),
      body: Obx(
        () => IndexedStack(
          index: gnav.currentIndex.value,
          children: _screens,
        ),
      ),
    );
  }
}
