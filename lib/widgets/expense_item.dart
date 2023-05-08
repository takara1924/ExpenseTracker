import 'package:expenses_tracker/models/expense.dart';

import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseItem});

  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text('\$${expenseItem.amount}'),
            const Spacer(),
            Column(
              children: [
                Text(expenseItem.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(expenseItem.formattedTime),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(expenseItem.formattedDate),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(expenseItem.getIcons),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
