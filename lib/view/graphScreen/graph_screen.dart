import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
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
      legendOptions:const  LegendOptions(showLegends: true),
      chartType: ChartType.disc,

      dataMap: dataMap,
      chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          decimalPlaces: 1,
          showChartValuesInPercentage: true),
    );
  }
}



