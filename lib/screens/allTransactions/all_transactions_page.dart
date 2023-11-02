import 'package:expense_manager/model/enum.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/screens/allTransactions/Widgets/dropDown/drop_down_month.dart';
import 'package:expense_manager/screens/constant/colors/colors.dart';
import 'package:expense_manager/screens/home/viewModel/widgets/transaction_card.dart';
import 'package:iconly/iconly.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  Widget build(BuildContext context) {
    Box<Transactions> transactionBox = Hive.box<Transactions>('TransactionBox');

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.05),
                    border: Border.all(color: Pallete.lightGrey),
                  ),
                  child: const Center(child: DropDownMonth()),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyBold.filter_2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Text(
              'All Transactions',
              style: TextStyle(
                fontSize: height * 0.026,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: height * .74,
            child: ListView(
              children: [
                ValueListenableBuilder(
                  valueListenable: transactionBox.listenable(),
                  builder: (context, Box<Transactions> transactionBox, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Added this line
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                      ),
                      itemCount: transactionBox.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = transactionBox.length - 1 - index;

                        Transactions transaction =
                            transactionBox.getAt(reversedIndex)!;

                        if (transactionBox.isEmpty) {
                          return const Center(
                            child: Text('No Transaction Found'),
                          );
                        } else {
                          return GestureDetector(
                            onLongPress: () {
                              transactionBox.deleteAt(reversedIndex);
                            },
                            child: TransactionCard(
                              dateTime: transaction.dateAndTime,
                              imagePath: transaction.imageUrl,
                              iconPath: transaction.type == 'expense'
                            ?'assets/images/expense.png'
                            :'assets/images/income.png',
                              color: transaction.type == 'expense'
                                  ? Pallete.expenseBackGroundColor
                                  : Pallete.incomeBackGroundColor,
                              logo: 'assets/images/food.png',
                              category: transaction.category,
                              description: transaction.description,
                              amount: transaction.amount.toString(),
                              time: transaction.dateAndTime.toString(),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
