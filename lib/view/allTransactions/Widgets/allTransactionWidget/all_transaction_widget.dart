import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:slideable/slideable.dart';

class AllTransactionWidget extends StatefulWidget {
  const AllTransactionWidget({super.key});

  @override
  State<AllTransactionWidget> createState() => _AllTransactionWidgetState();
}

class _AllTransactionWidgetState extends State<AllTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return GetBuilder<HomeScreenControllers>(
      builder: (controller) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            int reversedIndex = controller.transactionList.length - 1 - index;
            Transactions transaction =
                controller.transactionList[reversedIndex];
            return Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.01),
              child:

                  // Dismissible(
                  //   key: ValueKey(controller.transactionList[reversedIndex]),
                  //   onDismissed: (direction) async {
                  //     // controller.deleteTransaction(context, reversedIndex);
                  //   },
                  //  child:

                  Slideable(
                items: [
                  ActionItems(
                      backgroudColor: Colors.transparent,
                      icon: const Icon(Icons.delete,color: Pallete.expenseBackGroundColor,),
                      onPress: () {
                        controller.deleteTransaction(context, reversedIndex);
                      })
                ],
                child: TransactionCard(
                  index: reversedIndex,
                  type: transaction.type,
                  dateTime: transaction.dateAndTime,
                  imagePath: transaction.imageUrl.toString(),
                  color: transaction.type == 'expense'
                      ? Pallete.expenseBackGroundColor
                      : Pallete.incomeBackGroundColor,
                  category: transaction.category == 'Amount Added' ||
                          transaction.category.length < 11
                      ? transaction.category
                      : transaction.category.substring(9).toUpperCase(),
                  description: transaction.description.toUpperCase(),
                  amount: transaction.amount.toString(),
                  time: transaction.dateAndTime.toString(),
                  iconPath: transaction.type == 'expense'
                      ? 'assets/images/expense.png'
                      : 'assets/images/income.png',
                ),
              ),
              //     ),
            );
          },
          itemCount: controller.listLength,
        );
      },
    );
  }
}
