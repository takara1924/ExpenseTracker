import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat('d/M/y');

enum Category {
  food,
  leisure,
  study,
  transport,
}

const categoryIcons = {
  Category.food: Icons.food_bank_outlined,
  Category.leisure: Icons.gamepad_outlined,
  Category.study: Icons.school_outlined,
  Category.transport: Icons.emoji_transportation,
};

class Expense {
  Expense({
    required this.name,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
  }) : id = const Uuid().v4();

  final String name;
  final double amount;
  final DateTime date;
  final Category category;
  final TimeOfDay time;
  final String id;

  String get formattedDate => formatter.format(date);
  String get formattedTime => DateFormat('hh:mm a')
      .format(DateTime(2022, 01, 01, time.hour, time.minute));
  IconData get getIcons => categoryIcons[category]!;
}
