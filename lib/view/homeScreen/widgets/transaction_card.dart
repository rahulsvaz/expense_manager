import 'package:expense_manager/viewModel/addTransaction/date_controller.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/viewTransaction/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionCard extends StatelessWidget {
  final String logo;
  final String category;
  final String description;
  final String amount;
  final String time;
  final Color color;
  final String iconPath;
  final String imagePath;
  final DateTime dateTime;
  final String type;
  final int index;

  const TransactionCard(
      {super.key,
required this.type,
required this.index,
      required this.dateTime,
      required this.iconPath,
      required this.color,
      required this.logo,
      required this.category,
      required this.description,
      required this.amount,
      required this.time,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final dateFormatter = Get.put(DateController());
    //final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: ListTile(
          onTap: () {
            Get.to(TransactionDetails(
              index: index,
              category: category,
              type: type,
              imagePath: imagePath,
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
                category.trim(),
                style: TextStyle(
                    fontSize: height * 0.018, fontWeight: FontWeight.bold,color: Pallete.grey),
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
                style: TextStyle(fontSize: height * 0.016,color: Pallete.grey),
              ),
              Text(
                dateFormatter.formatDate(dateTime)
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
