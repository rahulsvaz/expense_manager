import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/view/home/viewModel/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(height: height*0.05,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
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
                    width: width * 0.24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height * 0.50),
                        border: Border.all(color: Pallete.lightGrey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/arrow-down.png'),
                        const Text('Month')
                      ],
                    ),
                  ),
                  Image.asset('assets/images/menuIcon.png')
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Text(
                'Today',
                style: TextStyle(
                    fontSize: height * 0.026, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.33,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const TransactionCard(
                      logo: 'assets/images/food.png',
                      category: 'Food',
                      description: 'Dinner with family',
                      amount: '500',
                      time: '10:10 AM',
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Text(
                'Yesterday',
                style: TextStyle(
                    fontSize: height * 0.026, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.41,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const TransactionCard(
                      logo: 'assets/images/food.png',
                      category: 'Food',
                      description: 'Dinner with family',
                      amount: '500',
                      time: '10:10 AM',
                    );
                  }),
            ),
          ],
        ),
      ],
    ));
  }
}
