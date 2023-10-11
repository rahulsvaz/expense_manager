import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/widgets/size.dart';
import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  final String categoryLogo;
  final String category;
  final String description;
  final String amount;
  final String time;

  const RecentTransaction({
    Key? key,
    required this.categoryLogo,
    required this.category,
    required this.description,
    required this.amount,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: height * 0.02, right: height * 0.02, bottom: height * 0.01),
      child: SizedBox(
        height: height * 0.11,
        width: width * 0.9,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: Image.asset(
                  categoryLogo,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  const Height10(),
                  Text(
                    description,
                    maxLines: 10,
                    style: TextStyle(
                      fontSize: height * 0.012,
                      color: Pallete.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: width*0.08,),
              Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '- ₹ $amount',
                    style: TextStyle(
                        color: Pallete.expenseBackGroundColor,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                  const Height10(),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: height * 0.02, color: Pallete.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
