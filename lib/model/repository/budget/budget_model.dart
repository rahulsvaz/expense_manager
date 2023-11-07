
import 'package:hive_flutter/hive_flutter.dart';
part 'budget_model.g.dart';

@HiveType(typeId: 3)
class BudgetModel {
  @HiveField(0)
  double salary;
  @HiveField(1)
  double budget;
  BudgetModel({required this.salary, required this.budget});
}