import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  const ChartItem({super.key, required this.height, required this.category});

  final height;
  final Category category;

  @override
  Widget build(BuildContext context) {
    bool _isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SizedBox(
      width: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              color: _isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Icon(categoryIcons[category]),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
