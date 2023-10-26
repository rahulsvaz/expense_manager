import 'package:expense_manager/view/viewTransaction/transaction_details.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TransactionCard extends StatelessWidget {
  final String logo;
  final String category;
  final String description;
  final String amount;
  final String time;

  const TransactionCard({
    Key? key,
    required this.logo,
    required this.category,
    required this.description,
    required this.amount,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
            onTap: () {
              Get.to(const TransactionDetails());
            },
            leading: Image.asset(
              logo,
              height: height * 0.11,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category,
                  style: TextStyle(
                      fontSize: height * 0.018, fontWeight: FontWeight.bold),
                ),
                Text(
                  '-₹ $amount',
                  style: TextStyle(
                      fontSize: height * 0.018,
                      color: Pallete.expenseBackGroundColor),
                )
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  description,
                  style: TextStyle(fontSize: height * 0.016),
                ),
                const Text('10,10 AM')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
