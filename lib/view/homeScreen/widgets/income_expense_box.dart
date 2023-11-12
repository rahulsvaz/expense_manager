import 'package:expense_manager/view/constant/colors/colors.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 03,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: height * 0.09,
        width: width * 0.42,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.05),
              child: Image.asset(
                logo,
                height: height * 0.04,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: height * 0.024, left: width * 0.05),
                  child: Text(
                    label,
                    style: TextStyle(
                        color: Pallete.white, fontSize: height * 0.012),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: height * 0.003, left: width * 0.02),
                  child: SizedBox(
                    width: width * 0.24,
                    child: Text(
                      '₹ $amount',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Pallete.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
