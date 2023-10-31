
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
  final Icon icon;

  const TransactionCard({
    Key? key,
    required this.color,
    required this.logo,
    required this.category,
    required this.description,
    required this.amount,
    required this.time,
    required this.icon
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
              Get.to( TransactionDetails(amount:amount ,dateAndTime: time,description: description,));
            },
            leading: icon,
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
                Text(time.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
