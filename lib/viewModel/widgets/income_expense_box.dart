
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';



class IncomeExpenseBox extends StatelessWidget {
  final String logo;
  final Color backGroundColor;
  final String label;
  final String amount;

  const IncomeExpenseBox(
      {super.key,
      required this.logo,
      required this.backGroundColor,
      required this.label,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 164,
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 13),
            child: Image.asset(logo),
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    label,
                    style: const TextStyle(color: Pallete.white),
                  )),
              Container(
                  margin:const  EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    '₹ $amount',
                    style: const TextStyle(
                        color: Pallete.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
