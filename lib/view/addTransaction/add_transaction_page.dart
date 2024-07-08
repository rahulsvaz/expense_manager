import 'package:expense_manager/view/addTransaction/Widgets/expense_widget.dart';
import 'package:expense_manager/view/addTransaction/Widgets/income_widget.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
elevation: 0,
          backgroundColor: ColorsClass.transparent,
          centerTitle: true,
          title: const Text('Add Transaction'),
          bottom:  TabBar(
dividerHeight: 0,
            tabAlignment: TabAlignment.center,
            labelColor: ColorsClass.black,
            indicatorColor: ColorsClass.black,
            isScrollable: true,

            tabs: [
              Tab(
                text: 'Add Income',
              ),
              Tab(
                text: 'Add Expense',
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          IncomeWidget(),
          ExpenseWidget(),
        ]),
      ),
    );
  }
}
