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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                categoryLogo,
                height: 80,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ),
                const Height10(),
                Text(
                  description,
                  maxLines: 10,
                  softWrap: true,
                  style: const TextStyle(
                    color: Pallete.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '- ₹ $amount',
                  style: const TextStyle(
                      color: Pallete.expenseBackGroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Height10(),
                Text(
                  time,
                  style: const TextStyle(color: Pallete.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
   
  }
}
