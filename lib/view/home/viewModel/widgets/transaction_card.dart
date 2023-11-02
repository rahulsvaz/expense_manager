import 'package:expense_manager/view/viewTransaction/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TransactionCard extends StatelessWidget {
  final String logo;
  final String category;
  final String description;
  final String amount;
  final String time;
  final Color color;
  final String iconPath;

  const TransactionCard(
      {super.key,
      required this.iconPath,
      required this.color,
      required this.logo,
      required this.category,
      required this.description,
      required this.amount,
      required this.time,
      });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: ListTile(
          onTap: () {
            Get.to(TransactionDetails(
              amount: amount,
              dateAndTime: time,
              description: description,
            ));
          },
          leading: Image.asset(iconPath),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: TextStyle(
                    fontSize: height * 0.018, fontWeight: FontWeight.bold),
              ),
              Text(
                '₹ $amount',
                style: TextStyle(fontSize: height * 0.018, color: color),
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
              Text(
                time.toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
