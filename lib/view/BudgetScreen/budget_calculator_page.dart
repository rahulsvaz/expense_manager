import 'package:expense_manager/view/budgetScreen/add_budget_screen.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetCalculatorPage extends StatefulWidget {
  const BudgetCalculatorPage({super.key});

  @override
  State<BudgetCalculatorPage> createState() => _BudgetCalculatorPageState();
}

class _BudgetCalculatorPageState extends State<BudgetCalculatorPage> {
  final graph = Get.put(HomeScreenControllers());

  @override
  Widget build(BuildContext context) {
    double income = graph.getTotalIncome();
    double expense = graph.getTotalExpense();
    double myBudget = 10;
    Map<String, double> dataMap = {
      'Expense': expense,
      'Income': income,
      'Budget': myBudget
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Budget Calculator'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(()=> const AddBudgetScreen());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            PiChartOverView(dataMap: dataMap),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class PiChartOverView extends StatelessWidget {
  const PiChartOverView({
    super.key,
    required this.dataMap,
  });

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      //   centerText: 'Expensense',
      initialAngleInDegree: 90,
      ringStrokeWidth: 30,
      colorList: const [
        Pallete.expenseBackGroundColor,
        Pallete.incomeBackGroundColor,
        Pallete.grey,
      ],
      legendOptions: const LegendOptions(showLegends: true),
      chartType: ChartType.disc,

      dataMap: dataMap,
      chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          decimalPlaces: 1,
          showChartValuesInPercentage: true),
    );
  }
}
