
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';



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
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Container(
      height:height*0.1 ,
      width: width*0.42,
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
            margin:  EdgeInsets.only(left: width*0.05),
            child: Image.asset(logo,height: height*0.04,),
          ),
          Column(
            children: [
              Container(
                  margin:  EdgeInsets.only(top: height*0.024, left: width*0.01),
                  child: Text(
                    label,
                    style:  TextStyle(color: Pallete.white,fontSize: height*0.012),
                  )),
              Container(
                  margin:  EdgeInsets.only(top:height*0.003 , left: width*0.02),
                  child: Text(
                    '₹ $amount',
                    style:  TextStyle(
                      overflow: TextOverflow.ellipsis,
                        color: Pallete.white,
                        fontSize: height*0.02,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
