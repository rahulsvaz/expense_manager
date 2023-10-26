import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return  const  Scaffold(
      // body:  HomeScreen(),
      bottomNavigationBar: SizedBox(
        
        child: GnavNavigation())
      
    );
  }
}
