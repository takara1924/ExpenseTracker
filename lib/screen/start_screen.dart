import 'package:expenses_tracker/widgets/expense_item.dart';
import 'package:expenses_tracker/screen/new_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/chart.dart';

List<Expense> _expensesList = [
  Expense(
    name: 'Example',
    amount: 15.99,
    category: Category.food,
    date: DateTime.now(),
    time: TimeOfDay.now(),
  ),
];

double sum = 0;

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense newExpense) {
    setState(() {
      _expensesList.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    sum = 0;
    for (final item in _expensesList) {
      sum += item.amount;
    }

    int number = _expensesList.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
      ),
      body: width <= 600
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ChartExpense(
                        expensesList: _expensesList,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Number: $number',
                        style: Theme.of(context).textTheme.displayMedium),
                    Text('Summary: $sum',
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 10),
                    if (_expensesList.isNotEmpty)
                      SizedBox(
                        height: 320,
                        child: ListView.builder(
                          itemCount: _expensesList.length,
                          itemBuilder: (context, i) {
                            final removedItem = _expensesList[i];
                            final item = _expensesList[i];
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                padding: const EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                color: Colors.red,
                                child:
                                    const Icon(Icons.delete_forever_outlined),
                              ),
                              onDismissed: (direction) => {
                                setState(() {
                                  _expensesList.removeAt(i);
                                }),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 2),
                                    content: const Text('Removed Expense'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        setState(() {
                                          _expensesList.insert(i, removedItem);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              },
                              key: ValueKey(item),
                              child: ExpenseItem(
                                expenseItem: item,
                              ),
                            );
                          },
                        ),
                      )
                    else
                      const Text('The list is empty!'),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ChartExpense(
                            expensesList: _expensesList,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Number: $number',
                            style: Theme.of(context).textTheme.displayMedium),
                        Text('Summary: $sum',
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 10),
                      ],
                    ),
                    if (_expensesList.isNotEmpty)
                      Expanded(
                        child: SizedBox(
                          height: 320,
                          child: ListView.builder(
                            itemCount: _expensesList.length,
                            itemBuilder: (context, i) {
                              final removedItem = _expensesList[i];
                              final item = _expensesList[i];
                              return Dismissible(
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  alignment: Alignment.centerRight,
                                  color: Colors.red,
                                  child:
                                      const Icon(Icons.delete_forever_outlined),
                                ),
                                onDismissed: (direction) => {
                                  setState(() {
                                    _expensesList.removeAt(i);
                                  }),
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content: const Text('Removed Expense'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          setState(() {
                                            _expensesList.insert(
                                                i, removedItem);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                },
                                key: ValueKey(item),
                                child: ExpenseItem(
                                  expenseItem: item,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    else
                      const Text('The list is empty!'),
                  ],
                ),
              ),
            ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) => NewExpense(
              expensesList: _expensesList,
              addExpense: addExpense,
            ),
          ),
        ),
      ),
    );
  }
}
