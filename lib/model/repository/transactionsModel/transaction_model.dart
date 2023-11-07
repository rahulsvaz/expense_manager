// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 2)
class Transactions {
  @HiveField(0)
  double amount;
  @HiveField(1)
  String type;
  @HiveField(2)
  DateTime dateAndTime;
  @HiveField(3)
  String category;
  @HiveField(4)
  String description;
  @HiveField(5)
  String imageUrl;

  Transactions({
    required this.amount,
    required this.type,
    required this.dateAndTime,
    required this.category,
    required this.description,
    required this.imageUrl,
  });
}


