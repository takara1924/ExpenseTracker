import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/chart_item.dart';
import 'package:flutter/material.dart';

class ChartExpense extends StatelessWidget {
  final List<Expense> expensesList;

  ChartExpense({super.key, required this.expensesList});

  double maxHeight = 0;

  @override
  Widget build(BuildContext context) {
    Map<Category, double> categoryValue = {
      Category.food: 0,
      Category.leisure: 0,
      Category.study: 0,
      Category.transport: 0,
    };

    for (final item in expensesList) {
      categoryValue[item.category] =
          categoryValue[item.category]! + item.amount;
    }

    for (final item in categoryValue.values) {
      if (maxHeight < item) maxHeight = item;
    }

    if (maxHeight != 0) {
      for (final key in categoryValue.keys) {
        categoryValue[key] = categoryValue[key]! / maxHeight * 85;
      }
    }

    List<ChartItem> itemChart = categoryValue.entries
        .map((item) => ChartItem(height: item.value, category: item.key))
        .toList();

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 150,
      width: 360,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...itemChart,
        ],
      ),
    );
  }
}
