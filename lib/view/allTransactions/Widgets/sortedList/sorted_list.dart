import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:expense_manager/viewModel/dateFilterController/date_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortedTransactions extends StatefulWidget {
  const SortedTransactions({super.key});

  @override
  State<SortedTransactions> createState() => _SortedTransactionsState();
}

class _SortedTransactionsState extends State<SortedTransactions> {
  final controller = Get.put(DateFilter());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    List<Transactions> filterd = controller.filter;

    return  ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: filterd.length,
          itemBuilder: (context, index) {
            
            return Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.01),
              child: TransactionCard(
                  type: filterd[index].type,
                  index: index,
                  dateTime: filterd[index].dateAndTime,
                  iconPath: filterd[index].type == 'expense'
                      ? 'assets/images/expense.png'
                      : 'assets/images/income.png',
                  color: filterd[index].type == 'expense'
                      ? Pallete.expenseBackGroundColor
                      : Pallete.incomeBackGroundColor,
                  category:  filterd[index].category  == 'Amount Added' ||
                         filterd[index].category.length < 11
                      ?filterd[index].category
                      : filterd[index].category.substring(9).toUpperCase(),  
                  
                  
                  
                  description: filterd[index].description,
                  amount: filterd[index].amount.toString(),
                  time: filterd[index].dateAndTime.toString(),
                  imagePath: filterd[index].imageUrl),
            );
          },
    );
  }
}
